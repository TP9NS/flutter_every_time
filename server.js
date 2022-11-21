const express = require('express');
const MongoClient = require('mongodb').MongoClient;
const app = express();
const methodOverride = require('method-override');
const bodyParser = require('body-parser');
const { request } = require('express');
const jwt = require('jsonwebtoken');
const ObjectId = require('mongodb').ObjectId;
app.use(express.json());
app.use(express.urlencoded({
    extended: true
}));
app.use(bodyParser.urlencoded({ extended: true }));
app.use(methodOverride('_method'));
app.set('view engine', 'html');

var db_board;
var db_user;
const key = 'token';
let today = new Date();

let year = leadingZeros(today.getFullYear() % 1000, 2);
let month = leadingZeros(today.getMonth() + 1, 2);
let date = leadingZeros(today.getDate(), 2);
let hour = leadingZeros(today.getHours(), 2);
let minutes = leadingZeros(today.getMinutes(), 2);

//날짜 리턴
function GetDate()
{
    return year+'/'+month+'/'+date+' '+hour+':'+minutes;
}

//한자리 날짜에 '0'붙이기
function leadingZeros(n, digits) {
    var zero = '';
    n = n.toString();
  
    if (n.length < digits) {
      for (var i = 0; i < digits - n.length; i++)
        zero += '0';
    }
    return zero + n;
}

//MongoDB연결
MongoClient.connect('mongodb+srv://lsmin0828:!@ljs040207!@@every.ilkse02.mongodb.net/?retryWrites=true&w=majority', (err, client) => {
    if (err) {
        return console.log(err + '에러발생');
    }
    else{
        console.log('MongoDB에 연결');
    }
    db_user = client.db('UserInfo');
    db_board = client.db('board');
    app.listen(8080, () => {
        console.log('8080포트에 연결');
    });
})

//이용약관 동의 처리
app.post('/agree', (req, res) => {
    console.log(req.body);
    if (req.body.agree1 & req.body.agree2) {
        res.status(200).send('true');
        console.log('모두 동의함');
    }
    else{
        res.status(404).send('false');
        console.log('동의 하지않음');
        console.log(GetDate());
        console.log(today.toLocaleString());
    }
});

//회원가입 처리
app.post('/sign_up', (req, res) => {
    console.log('/sign_up에서 <'+req.body+'>를 받음');
    if (req.body.Id != '' & req.body.nicname != '' & req.body.num != '' & req.body.pas1 != '') {
        if (req.body.pas1 == req.body.pas2) {
            db_user.collection('LogIn').insertOne({ name: req.body.name, nic: req.body.nicname, num: req.body.num, pas: req.body.pas1 })
            res.status(200).send('true');
            console.log('회원가입 성공');
        }
        else{
            console.log('비밀번호가 일치하지 않음');
        }
    }
    else{
        console.log('비어있는 값이 존재');
    }
});

//로그인 처리
app.post('/log_in', (req, res) => {
    console.log(req.body);
    db_user.collection('LogIn').find({ num: req.body.num, pas: req.body.pas }).toArray((err, result) => {
        console.log('계정 탐색중...');
        console.log(result);
        if (err || result == '') {
            res.status(404).send('비밀번호가 일치하지 않습니다.');
            console.log('로그인에 실패함');
        }
        else {
            const token = jwt.sign({ num: req.body.num }, key);
             // jwt.sign으로 3가지 인자를 token 담아 클라이언트에게 넘겨준다.
            res.status(200).send(req.body.num);
            console.log(req.body.num+' 로그인에 성공, 토큰을 발급함');
        }
    });
});

//글쓰기
app.post('/write_add', (req, res) => {
    console.log(req.body);
    if (req.body.num != '' & req.body.title != '' & req.body.contents != '')
    {
            const data = { num: req.body.num, anon:req.body.anon, title: req.body.title, contents: req.body.contents };
            switch(req.body.board)
            {
            case '자유게시판':
                db_board.collection('board_list_free').insertOne(data);
                res.status(200).send('true');
                break;
            case '술 먹을 사람?':
                db_board.collection('drink_beer').insertOne(data)
                res.status(200).send('true');
                break;
            case '밥 먹을 사람?':
                db_board.collection('babmuk').insertOne(data)
                res.status(200).send('true');
                break;
            case '택시 탈 사람?':
                db_board.collection('taxi').insertOne(data)
                res.status(200).send('true');
                break;
            case '안양인들의 강화마켓':
                db_board.collection('market').insertOne(data)
                res.status(200).send('true');
                break;
            case '피드백':
                db_board.collection('feedback').insertOne(data)
                res.status(200).send('true');
                break;
            }
    }
    else{
        res.status(400).send('false');;
    }
});

//글띄우기
app.post('/board_list', (req, res) => {
    if (req.body.num != '')
    {
            switch(req.body.board)
            {
            case '자유게시판':
                db_board.collection('board_list_free').find({}).sort({_id: -1}).skip(req.body.count).limit(10).toArray((err, result) => {
                    res.status(200).send(result);
                    console.log(result);
                });
                break;
            case '술 먹을 사람?':
                db_board.collection('drink_beer').find({}).sort({_id: -1}).skip(req.body.count).limit(10).toArray((err, result) => {
                    res.status(200).send(result);
                });
                break;
            case '밥 먹을 사람?':
                db_board.collection('babmuk').find({}).sort({_id: -1}).skip(req.body.count).limit(10).toArray((err, result) => {
                    res.status(200).send(result);
                });
                break;
            case '택시 탈 사람?':
                db_board.collection('taxi').find({}).sort({_id: -1}).skip(req.body.count).limit(10).toArray((err, result) => {
                    res.status(200).send(result);
                });
                break;
            case '안양인들의 강화마켓':
                db_board.collection('market').find({}).sort({_id: -1}).skip(req.body.count).limit(10).toArray((err, result) => {
                    res.status(200).send(result);
                });
                break;
            case '피드백':
                db_board.collection('feedback').find({}).sort({_id: -1}).skip(req.body.count).limit(10).toArray((err, result) => {
                    res.status(200).send(result);
                });
                break;
            }
    }
    else{
        res.status(400).send('false');;
    }
});
app.post('/add_post',(req,res)=>{
    console.log(req.body);
    switch(req.body.board)
            {
            case '자유게시판':
                console.log(req.body.id);
                db_board.collection('board_list_free').findOne( { _id : ObjectId(req.body.id)},(err,result)=>{
                    res.status(200).json({result});
                    console.log(111);
                    console.log(result);
                    console.log(1);
                });
                break;
            case '술 먹을 사람?':
                db_board.collection('drink_beer').findOne( { _id : ObjectId(req.body.id)} ).toArray((err,result)=>{
                    res.status(200).send(result);        
                });
                break;
            case '밥 먹을 사람?':
                db_board.collection('babmuk').find({_id:req.body.id}).toArray((err,result)=>{
                    res.status(200).send(result);        
                });
                break;
            case '택시 탈 사람?':
                db_board.collection('taxi').find({_id:req.body.id}).toArray((err,result)=>{
                    res.status(200).send(result);        
                });
                break;
            case '안양인들의 강화마켓':
                db_board.collection('market').find({_id:req.body.id}).toArray((err,result)=>{
                    res.status(200).send(result);        
                });
                break;
            case '피드백':
                db_board.collection('feedback').find({_id:req.body.id}).toArray((err,result)=>{
                    res.status(200).send(result);        
                });
                break;
    }
});

//댓글 쓰기
app.post('/write_comments', (req, res) => {
    console.log(req.body);
    if (req.body.comments != '')
    {
            const data = {comments: req.body.comments,board:req.body.board };
            switch(req.body.board)
            {
            case '자유게시판':
                db_board.collection('board_list_free').insertOne(data);
                res.status(200).send('true');
                break;
            case '술 먹을 사람?':
                db_board.collection('drink_beer').insertOne(data)
                res.status(200).send('true');
                break;
            case '밥 먹을 사람?':
                db_board.collection('babmuk').insertOne(data)
                res.status(200).send('true');
                break;
            case '택시 탈 사람?':
                db_board.collection('taxi').insertOne(data)
                res.status(200).send('true');
                break;
            case '안양인들의 강화마켓':
                db_board.collection('market').insertOne(data)
                res.status(200).send('true');
                break;
            case '피드백':
                db_board.collection('feedback').insertOne(data)
                res.status(200).send('true');
                break;
            }
    }
    else{
        res.status(400).send('false');;
    }
});