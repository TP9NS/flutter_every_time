const express = require('express');
const MongoClient = require('mongodb').MongoClient; 
const app = express();
const methodOverride = require('method-override');
const bodyParser = require('body-parser');
const { request } = require('express');
app.use(express.json());

app.use(express.urlencoded({
  extended: true
}));
app.use(bodyParser.urlencoded({extended:true}));
app.use(methodOverride('_method'));
app.set('view engine','html');  
var db;

MongoClient.connect('mongodb+srv://lsmin0828:!@ljs040207!@@every.ilkse02.mongodb.net/?retryWrites=true&w=majority',(err,client)=>{
    if(err){
        return console.log(err);
    }
    db = client.db('UserInfo');
    db = client.db('board');
    db.collection('LogIn').insertOne({name: 'jhon',id:'qwer'},(err,result)=>{
        if(err)
            console.log(err);
    });
    app.listen(8080,()=>{
        console.log('listen on 8080');
    });
    app.get('/asdf',(req,res)=>{
        //db apple을 써
    });
})
app.get('/',(req,res)=>{
    res.sendFile(__dirname + '/view/index.html');
});
app.post('/',(req,res)=>{
    if(!req.body.apple){
        res.send('404');
    }
    const data = {'id':req.body.apple};
    db.collection('LogIn').insertOne(data,(err,result)=>{
        if(err)
            console.log(err);
    });
    res.json(req.body);
    
});
app.get('/data',(req,res)=>{
    db.collection('LogIn').find({}).toArray((err,result)=>{
        if(err)
            console.log(err);
        console.log(result);
        res.json(result);
    });
});
app.get('/hinggu',(req,res)=>{
    db.collection('LogIn').deleteOne({id:'ychh1123'},(err,result)=>{
         if(err){
            console.log(err);
            return res.json('굳1');
        }

    console.log(result);
    res.json('굳2');
    });        
});

app.post('/agree',(req,res)=>{
    console.log(req.body);  
    if(req.body.agree1&req.body.agree2){
        res.send("ok");
    }
});
app.post('/sign_up',(req,res)=>{
    
    console.log(req.body);
    if(req.body.Id!=''&req.body.nicname!=''&req.body.num!=''&req.body.pas1!=''){
        if(req.body.pas1 == req.body.pas2) {
            db.collection('LogIn').insertOne({name: req.body.name,nic:req.body.nicname,num:req.body.num,pas:req.body.pas1})
            res.send("next");
        }
    }
});
app.post('/log_in',(req,res)=>{
    
    console.log(req.body);
    db.collection('LogIn').find({num:req.body.num,pas:req.body.pas}).toArray((err,result)=>{
        console.log(result);
        
        if(err||result == ''){
            res.status(404).send('비밀번호가 일치하지 않습니다.'); 
        }
        else{
            const jwt = require('jsonwebtoken');
            const key = 'token';    
            const token = jwt.sign({num:req.body.num,pas:req.body.pas},key); // jwt.sign으로 3가지 인자를 token 담아 클라이언트에게 넘겨준다.
            res.status(200).send({ token });
        }
    });
});
app.post('/write_add',(req,res)=>{
    console.log(req.body);
    if(req.body.title!=''&req.body.contents!=''){
        if(req.body.pas1 == req.body.pas2) {
            db.collection('boardbabmuk').insertOne({title: req.body.title,contents:req.body.contents})
            res.send("next");
        }
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
