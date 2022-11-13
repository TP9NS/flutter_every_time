const express = require('express');
const MongoClient = require('mongodb').MongoClient; 
const app = express();
const methodOverride = require('method-override');
const bodyParser = require('body-parser');
const { request } = require('express');

app.use(bodyParser.urlencoded({extended:true}));
app.use(methodOverride('_method'));
app.set('view engine','html');  
var db;

MongoClient.connect('mongodb+srv://lsmin0828:!@ljs040207!@@every.ilkse02.mongodb.net/?retryWrites=true&w=majority',(err,client)=>{
    if(err){
        return console.log(err);
    }
    db = client.db('UserInfo');
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
    res.json('이게 맞나?');
});
app.post('/sign_up',(req,res)=>{
    
    console.log(req.body);
    if(req.body.pas1 == req.body.pas2) {
        db.collection('LogIn').insertOne({id: req.body.Id,nic:req.body.nicname,num:req.body.num,pas1:req.body.pas1})
    }
});