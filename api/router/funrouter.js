const express=require('express')
var multer  = require('multer')
const User=require('../db/model/user')
const router=express.Router()
const jwt=require('jsonwebtoken')
const config=require('../config')
//const send=require('../../nodemail')
var storage = multer.diskStorage({
    destination: function (req, file, cb) {
      cb(null, 'uploads')
    },
    filename: function (req, file, cb) {
      cb(null, file.originalname)
    }
  })
  
var upload = multer({ storage: storage })

router.use('/',(req,res,next)=>{
  let token=req.headers.authorization
  if(!token){
    res.send({code:0,msg:'token不存在'})
  }else{
    jwt.verify(token, config.token.secret, function(err, decoded) {
      if (err) {
        res.send({code:0,msg:err.message})
      }
      console.log(decoded)
      req.id=decoded._id
      next()
    });
  }
})

router.post('/firends',async(req,res)=>{
    let users=await User.find({})
    let user=users.map((item,index)=>{
        return {_id:item._id,id:index,name:item.name,headerimg:item.headerimg,isonline:item.isonline,socketid:item.socketid}
    })
    res.send(user)
})

// router.post('/email',(req,res)=>{
//     let to=req.body.email
//     let capture=Math.ceil(Math.random()*8999+1000)
//     let msg={
//         subject:'验证码',
//         html: `<h1>您的验证码是${capture}</h1>`
//     }
//     send(to,msg)
//     .then(()=>{
//         codes[to]=capture
//         res.send({code:2,msg:'邮件发送成功'})
//     })
//     .catch(err=>{
//         res.send({code:0,msg:'邮件发送失败'})
//     })
// })

router.post('/headimg', upload.any(), function (req, res, next) {
  console.log(req.id)
   console.log(req.files)
   next()
},async(req,res)=>{
  await User.update({_id:req.id},{$set:{headerimg:'http://localhost:3000/'+req.id+'.png'}})
    res.send({imgsrc:'http://localhost:3000/'+req.id+'.png'})
})


module.exports=router