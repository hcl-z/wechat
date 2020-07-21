const mongoose=require('mongoose')
var Schema = mongoose.Schema({
    id: { type: [Number], index: true } ,
    from: {type:String,required:true},
    to: {type:String,required:true},
    content: {type:String,required:true},
    time:{type:String,required:true}
  });
var Msg = mongoose.model('msg', Schema);

module.exports=Msg