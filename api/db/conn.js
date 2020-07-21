var mongoose = require('mongoose');
mongoose.connect('mongodb://localhost/wechat',{ useNewUrlParser: true,useUnifiedTopology: true });
//连接数据库
var db = mongoose.connection;
db.on('error', console.error.bind(console, 'connection error:'));
db.once('open', function() {
  console.log('running')
});


