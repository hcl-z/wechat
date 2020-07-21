<template>
  <div class="content">
      <Chatcontent :currentuser='currentuser' :msglist='msglist' ref='con' class='msg'></Chatcontent>
      <Chatuserlist class='userlist' :userlist=userlist @chosenuser='changechatbox'></Chatuserlist>
      <Chatinput class='input'  @sendmsg="send" ></Chatinput>
      <div class="personspace">
        <div class="img" @click="jump">
          <img :src='src' alt="" class='headimg'>
        </div>
      </div>
      
  </div>
</template>

<script>
import Chatcontent from "../components/Chatcontent";
import Chatuserlist from "../components/Chatuserlist";
import Chatinput from "../components/Chatinput";

export default {
  data() {
    return {
      userlist: [],
      msglist:[],
      currentuser:{name:'',_id:'',headimg:''},
      src:sessionStorage.getItem('imgsrc')
    };
  },
 
  beforeCreate() {
    
     this.$axios.post('http://localhost:3000/fun/firends',{_id:window.sessionStorage.getItem('id')})
     .then(data=>{
       console.log(data)
      this.userlist=data.data
     })
  },
  
 created() {
   this.$socket.emit('socketid',{'_id':window.sessionStorage.getItem('id')})
   this.$socket.on('message',data=>{
     var content=null
     if(data.type=='audio'){
        content=URL.createObjectURL(new Blob([data.data]))
     }else{
       content=data.data
     }
   this.msglist.push({ id: this.msglist.length, type: "he",mine:data.type, content: content })
   })
  
 },
  methods: {
    changechatbox(id){
     this.currentuser={name:this.userlist[id].name,_id:this.userlist[id]._id,headimg:this.userlist[id].headerimg}
    },
    send(info) {
      let data=Object.assign(info,{toid:this.currentuser._id,id:window.sessionStorage.getItem('id')})
      console.log(data)
      this.$socket.emit("sendmsg", data);
      var content=null
      if(info.type=='audio'){
        content=URL.createObjectURL(new Blob([info.msg]))
      }else{
        content=info.msg
      }
      this.msglist.push({
        id: this.msglist.length + 1,
        type: "me",
        mine:info.type,
        content: content
      });
      console.log( this.$refs.con.$el.scrollTop);
      
      setTimeout(() => {
        this.$refs.con.$el.scrollTop+=100;
      }, 10);
    },
    jump(){
      this.$router.push({name:'person'})
    }
    
  },
  components: { Chatcontent, Chatuserlist,Chatinput }
};
</script>
<style>
  .content{
    width: 100%;
    height:100%;
    display:grid;
    grid-template-columns: 3fr 1fr;
    grid-template-rows: 5fr 220px;
  }
  .msg{
    grid-row: span 1;
    grid-column: span 1;
  }
  .input{
    grid-row: span 1;
    grid-column: span 1;
  }
  .userlist{
    grid-row: span 1;
    grid-column: span 1;
  }
  .personspace{
     grid-row: span 1;
     grid-column: span 1;
     position: relative;
     background: url('../assets/img/volodymyr-hryshchenko-V5vqWC9gyEU-unsplash.jpg')  no-repeat  center center ;
     background-size:cover;
  }
  .img{
    width: 35%;
    /* height:auto; */
    border-radius: 50%;
    overflow: hidden;
    position: absolute;
    top:0;
    left:0;
    transform: translate(-50%,-50%);
    z-index: 999;
  }
  .img img{
    width: 100%;
    height:auto;
  }
  
</style>
