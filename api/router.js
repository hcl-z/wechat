const loginrouter=require('./router/loginrouter')
const funrouter=require('./router/funrouter')

module.exports=app=>{
    app.use('/',loginrouter)
    app.use('/fun',funrouter)
}