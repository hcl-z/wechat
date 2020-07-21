const mongoose=require('mongoose')
var Schema = mongoose.Schema({
    name: {type:String,required:true},
    email: {type:String,required:true},
    pass:  {type:String,required:true},
    headerimg:{type:String,required:true,default:'https://csdnimg.cn/cdn/content-toolbar/csdn-logo.png?v=20200416.1'},
    socketid:{type:String,required:false},
    isonline:{type:Boolean,required:true},
    firends:{type:Array,required:true,default:null}
  });
var User = mongoose.model('user', Schema);

module.exports=User