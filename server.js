const express = require('express');
const MongoClient = require('mongodb').MongoClient; 
const app = express();
const methodOverride = require('method-override');
const bodyParser = require('body-parser');
const { request } = require('express');
app.use(express.json());
const key = 'token';    

const jwt = require('jsonwebtoken');

app.use(express.urlencoded({
  extended: true
}));
app.use(bodyParser.urlencoded({extended:true}));
app.use(methodOverride('_method'));
app.set('view engine','html');  
var db_user;
var db_board;

MongoClient.connect('mongodb+srv://lsmin0828:!@ljs040207!@@every.ilkse02.mongodb.net/?retryWrites=true&w=majority',(err,client)=>{
    if(err){
        return console.log(err);
    }
    db_user = client.db('UserInfo');
    db_board= client.db('board');
    app.listen(8080,()=>{
        console.log('listen on 8080');
    });
    
})
//이용약관 동의
app.post('/agree',(req,res)=>{
    console.log(req.body);  
    if(req.body.agree1&req.body.agree2){
        res.status(200).send('true');
        console.log('모두 동의함');
    }
    else{
        res.status(200).send('false');
        console.log('동의 하지 않음');
    }
});

//회원가입
app.post('/sign_up',(req,res)=>{
    console.log(req.body);
    if(req.body.Id!=''&req.body.nicname!=''&req.body.num!=''&req.body.pas1!=''){
        if(req.body.pas1 == req.body.pas2) {
            db_user .collection('LogIn').insertOne({name: req.body.name,nic:req.body.nicname,num:req.body.num,pas:req.body.pas1})
            res.send(true);
        }
    }
});

//로그인
app.post('/log_in',(req,res)=>{
    
    console.log(req.body);
    db_user .collection('LogIn').find({num:req.body.num,pas:req.body.pas}).toArray((err,result)=>{
        console.log(result);
        
        if(err||result == ''){
            res.status(404).send('비밀번호가 일치하지 않습니다.'); 
        }
        else{
            const token = jwt.sign({nic:result.nic,num:req.body.num},key); // jwt.sign으로 3가지 인자를 token 담아 클라이언트에게 넘겨준다.
            res.status(200).send({ token });
        }
    });
});
//글쓰기 밥묵
app.post('/write_add', (req, res) => {
    console.log(req.body);
    const num = jwt.verify(JSON.parse(req.body.token).token,key).num;
    if (num != '' & req.body.title != '' & req.body.contents != '') {
        db_user.collection('LogIn').find({ num: num }).toArray((err, result) => {
            switch(req.body.board)
        {
            case '자유게시판':
                db_board.collection('board_list_free').insertOne({ nic: result[0].nic, num: num, title: req.body.title, contents: req.body.contents ,anon:req.body.anon})
                res.status(200).send('true');
                break;
            case '술 먹을 사람?':
                db_board.collection('drink_beer').insertOne({ nic: result[0].nic, num: num, title: req.body.title, contents: req.body.contents,anon:req.body.anon })
                res.status(200).send('true');
                break;
            case '밥 먹을 사람?':
                db_board.collection('babmuk').insertOne({ nic: result[0].nic, num: num, title: req.body.title, contents: req.body.contents,anon:req.body.anon })
                res.status(200).send('true');
                break;
            case '택시 탈 사람?':
                db_board.collection('taxi').insertOne({ nic: result[0].nic, num: num, title: req.body.title, contents: req.body.contents,anon:req.body.anon })
                res.status(200).send('true');
                break;
            case '안양인들의 강화마켓':
                db_board.collection('market').insertOne({ nic: result[0].nic, num: num, title: req.body.title, contents: req.body.contents ,anon:req.body.anon})
                res.status(200).send('true');
                break;
            case '피드백':
                db_board.collection('feedback').insertOne({ nic: result[0].nic, num: num, title: req.body.title, contents: req.body.contents,anon:req.body.anon })
                res.status(200).send('true');
                break;
        }
        });
    }
    else{
        res.status(400).send('false');;
    }
});
//app.post('/test',(req,res)=>{
//    const jwt = require('jsonwebtoken');
//    const key = 'token';    
//    const token = jwt.sign({num:'awd',pas:'awd'},key);
//    console.log(token);
//    const decoded = jwt.verify(token, key) ;
//    console.log(decoded);
//    console.log(new Date(decoded.iat * 1000).toLocaleString());
//});
