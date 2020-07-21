const express = require('express')
const User = require('../db/model/user')
const config=require('../config')
const jwt=require('jsonwebtoken')
const router = express.Router()
//const send=require('../../nodemail')

router.post('/log', async (req, res) => {
    let { name, pass } = req.body
    if (!(name && pass)) return res.send({ code: 0, msg: '用户名或密码缺失' })
    try {
        let user = await User.find({ name: name, pass: pass })
        if (user.length>0) 
        {
            await User.update({ name: name, pass: pass },{ $set: { isonline: true }})
            let token=jwt.sign({name:user[0].name,_id:user[0]._id},config.token.secret,config.token.options)
            return res.send({ code: 1, msg: '登录成功', _id: user[0]._id,token:token,name:user[0].name,headimg:user[0].headerimg })
        }
        return res.send({ code: 0, msg: '用户名或密码错误' })
    } catch (error) {
        res.send({ code: 0, msg: '系统出错' + error })
    }
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

router.post('/reg', async (req, res) => {
    try {
        let { name, pass, email } = req.body
        if (!(name && pass && email)) return res.send({ code: 0, msg: '信息缺失' })
        let queryuser = await User.find({ name: name, email: email })
        console.log(queryuser.length)
        if (queryuser.length>=1) return res.send({ code: 0, msg: '用户已存在' })
        await User.insertMany({ name: name, pass: pass, email: email, isonline: false })
        res.send({ code: 1, msg: '注册成功' })
    } catch (error) {
        res.send({ code: 0, msg: error })
    }


})


module.exports = router