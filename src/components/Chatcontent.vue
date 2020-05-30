<template>
  <div class="content">
    <div class="msgbox" ref="con">
      <div class="msgto">{{ currentuser }}</div>
      <Msgbox v-for='item in msglist' :key='item.id' :type="item.type" src="http://localhost:8080/img/%E5%A4%A7%E5%A8%83.738d70c1.jpg">{{item.content}}</Msgbox>
    </div>
    <Chartinput height="30%" @sendmsg="send"></Chartinput>
  </div>
</template>

<script>
import Chartinput from "./Chartinput";
import Msgbox from "./Msgbox";
export default {
  data() {
    return {
      msglist: [
        { id: 1, type: "me", content: "ddcfdsfvs" },
        { id: 2, type: "he", content: "ddcfdsfvs" },
        { id: 3, type: "me", content: "ddc ccfdsfvs" },
        { id: 4, type: "he", content: "ddcfdsfzxvs" },
        { id: 5, type: "he", content: "ddcfdscccfvs" },
        { id: 6, type: "me", content: "ddcfdczxcsfvs" },
        { id: 7, type: "me", content: "ddcfdczcsfvs" }
      ]
    };
  },
  components: { Chartinput, Msgbox },
  props: ["currentuser"],
  methods: {
    send(m) {
      this.msglist.push({id: this.msglist.length+1, type: "me", content: m})
      setTimeout(() => {
          this.$refs.con.scrollTop+=100
      }, 10);
    }
  }
};
</script>
<style scoped>
.content {
  width: 70%;
  height: 100%;
  background: darkturquoise;
  display: inline-block;
}
.content .msgbox {
  width: 100%;
  height: 70%;
  overflow: auto;
}
.msgto {
  position: fixed;
  top:0;
  text-align: center;
  display: inline-block;
  width: 70%;
  font-size: 1.5em;
  font-weight: 700;
}
.content .sendbox {
  width: 100%;
  height: 30%;
  background: darkseagreen;
}
</style>