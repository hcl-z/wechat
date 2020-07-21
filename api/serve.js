const express=require('express')
const bodyparser = require('body-parser')
const app=express()
const db=require('./db/conn')
const User=require('./db/model/user')
const Msg=require('./db/model/msg')
const http = require("http").createServer(app);
const io = require("socket.io")(http);
const router=require('./router')
app.use(bodyparser.urlencoded({ extended: false }))
app.use(bodyparser.json())
app.use(express.static(__dirname+'/uploads'))
app.all('*', function(req, res, next) {
    res.header("Access-Control-Allow-Origin", "*");
    res.header("Access-Control-Allow-Headers", "Content-Type,Content-Length, Authorization, Accept,X-Requested-With");
    res.header("Access-Control-Allow-Methods","PUT,POST,GET,DELETE,OPTIONS");
    res.header("X-Powered-By",' 3.2.1')
    if(req.method=="OPTIONS") res.send(200);/*让options请求快速返回*/
    else next();
  });
  router(app)
  io.on('connection', function(socket){
    console.log('新加入一个连接。');
    // 不管是服务器还是客户端都有 emit 和 on 这两个函数，socket.io 的核心就是这两个函数
    socket.on('socketid', async(data)=>{
      console.log(socket.id)
      await User.updateOne({_id:data._id},{$set:{socketid:socket.id}}) 
  });
  socket.on('sendmsg',async(data)=>{
    //socket.broadcast.emit('message','ewe')
    let user=await User.find({_id:data.toid})
    console.log(data)
    io.to(user[0].socketid).emit('message',{data:data.msg,type:data.type});
    Msg.insertMany({from:data.id,to:data.toid,content:data.msg,time:new Date().toLocaleString()})
  })
})
  // io.on('connection', (socket) => {
  //   socket.on('id',data=>{
  //     console.log(data)
  //     setTimeout(() => {
  //       socket.to(data).emit('back',123)
  //       socket.to(socket.socketid).emit('back',123)
  //     }, 2000);
  //   })
  //   socket.on('back',data=>{
  //     console.log(data)
  //   })
  //   // socket.emit('conn','hi') 
  //   // socket.on('con',data=>{
  //   //   console.log(data)
  //   // })
    
  //   //   socket.on('socketid',async(data)=>{
  //   //     if(data)
  //   //     {
  //   //       await User.updateOne({"_id":data.id},{$set:{"socketid":socket.id,"isonline":true}})
  //   //     }
  //   //   })
  //   //   socket.emit('send','hello everrwerwrybody');
  //   //   console.log('a user connected');
  //   //   socket.on('sendmsg',data=>{
  //   //     console.log(data)
  //   //     socket.broadcast.emit('hi');
  //   //     //socket.to(data.sid).emit('message', 'hello');
  //   //   })
  //   //   // socket.on("msg", async function(data) {
  //   //   //     console.log();
  //   //   //     let touser=await User.find({'_id':data.toid})
  //   //   //  // console.log(touser[0].socketid)
  //   //   //     socket.to(id).emit('message', data.msg);
  //   //   //     socket.to("9q4JkjK056YRIxToAAAv").emit('message', data.msg);
          
          
  //   //   // });
      
  //   });
 


http.listen(3001, () => {
    console.log('listening on *:3000');
  });
app.listen(3000,()=>{
    console.log('running at 3000 port')
});