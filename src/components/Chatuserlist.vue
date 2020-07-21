<template>
  <div class="content">
    <ul>
      <li v-for="item in userlist" :key="item.key" @click=chooseuser(item.id)>
        <img :src="item.headerimg" />
        <div class="msgbox">
          <span>{{item.name}}</span>
          <span>hello</span>
        </div>
        <span style='flex:1;text-align:end;padding-right:20px'>{{item.isonline==true?'在线':'离线'}}</span>
      </li>
    </ul>
  </div>
</template>

<script>
export default {
  data() {
    return {};
  },
  props: ["userlist"],
  methods: {
      chooseuser(id){
          this.$emit('chosenuser',id)
      }
  },
};
</script>
<style scoped>
    .content {
    display: inline-block;
    height: 100%;
    width: 100%;
    background: darkgrey;
    }
    ul {
    box-sizing: border-box;
    padding-left:20px;
    list-style: none;
    width: 100%;
    height:100%;
    overflow: auto;
    }
    ul > li {
    width: 100%;
    height: 80px;

    display: flex;
    align-items: center;
    }
    ul > li > img {
    height: 50px;
    width: 50px;
    border-radius: 50%;
    }
    .msgbox {
    display: flex;
    flex-direction: column;
    margin-left: 20px;
    }
</style>