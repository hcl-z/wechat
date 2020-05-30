<template>
  <div id="app">
    <Chatcontent :currentuser='currentuser'></Chatcontent>
    <Chatuserlist :userlist=userlist @chosenuser='changechatbox'></Chatuserlist>
  </div>
</template>

<script>
import Chatcontent from "./components/Chatcontent";
import Chatuserlist from "./components/Chatuserlist";
export default {
  data() {
    return {
      userlist: [
        { id: 1, name: "大娃", imgurl: require("./assets/img/大娃.jpg")},
        { id: 2, name: "二娃", imgurl: require("./assets/img/二娃.jpg") },
        { id: 3, name: "三娃", imgurl: require("./assets/img/三娃.jpg") },
        { id: 4, name: "四娃", imgurl: require("./assets/img/四娃.jpg") },
        { id: 5, name: "五娃", imgurl: require("./assets/img/五娃.jpg") },
        { id: 6, name: "六娃", imgurl: require("./assets/img/六娃.jpg") },
        { id: 7, name: "七娃", imgurl: require("./assets/img/七娃.jpg") }
      ],
      currentuser:null
    };
  },
  methods: {
    changechatbox(id){
     this.currentuser=this.userlist[id-1].name
    }
  },
  components: { Chatcontent, Chatuserlist }
};
</script>
<style>
  #app{
    width:100%;
    height:100%;
    display:flex;
  }
</style>
