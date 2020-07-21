<template>
  <div class="content">
    
    <div class="msgto">{{ currentuser.name }}</div>
    <slot></slot>
    <div class="msgbox"  v-for="item in msglist" :key=item.index>
      <div v-if="item.type=='me'" class="right">
        <span v-if="item.mine=='text'">
          {{item.content}}
        </span>
        <span v-else-if="item.mine=='audio'">
          <audio :src="item.content" controls></audio>
        </span>
        <img :src='src' />
      </div>
      <div v-else-if="item.type=='he'" class="left">
        <img :src="currentuser.headimg"  />
        <span v-if="item.mine=='text'">
          {{item.content}}
        </span>
        <span v-else-if="item.mine=='audio'">
          <audio :src="item.content" controls></audio>
        </span>
      </div>
      
    </div>
    
  </div>
</template>

<script>

export default {
  data() {
    return {
      src:sessionStorage.getItem('imgsrc')
    };
  },
  props: ["currentuser", "msglist"]
};
</script>
<style scoped>
audio{
}
.content {
  width: 100%;
  height: 100%;
  background: darkturquoise;
  display: inline-block;
  overflow: auto;
}
.content .msgbox {
  width: 100%;
  min-height: 50px;
  overflow: auto;
}
.msgto {
  position: fixed;
  top: 0;
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
.left{
        display: flex;
        justify-content: flex-start;
    }
    .right{
        display: flex;
        justify-content: flex-end;
    }
    .left,.right{
        display: flex;
        align-items: center;
        padding:10px 20px;
    }
    .left span,.right span{
       background-color: rgb(159, 53, 168);
       display: inline-block;
       border-radius: 10px;
       max-width: 200px;
       overflow: hidden;
       white-space:pre-wrap;
       word-wrap : break-word ;
       padding:5px 10px;
       margin:0 10px;
       color:white;
    }
    .left img,.right img{
        width: 50px;
        height: 50px;
        border-radius: 50%;
    }
</style>