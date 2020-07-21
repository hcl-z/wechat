<template>
  <div id='logincontent'>
    
    <div class="sheet">
      <img src="../assets/img/headimg.svg" alt="" id='avator'>
      <p style='font-size:3em;opacity:0.7;'>We Chat</p>
      <keep-alive>
         <component :is="currentcomponent" @change='change'></component>
      </keep-alive>
     
    </div>
    
  </div>
</template>
<script>
import Login from '../components/login'
import Register from '../components/register'

export default {
  data() {
    return {
      currentcomponent:'login',
      name:'',
      pass:'',
      nameshow:true,
      passshow:true
    }
  },
  methods: {
    change(e){
      console.log(e)
      this.currentcomponent=e
    }
  },
  components:{Login,Register},
  watch: {
    name(n){
      if(n) this.nameshow=false;
      else this.nameshow=true
    },
    pass(n){
      if(n) this.passshow=false
      else this.passshow=true
    }
  },
}
</script>
<style scoped>
  
  #logincontent{
    width: 100%;
    height:100%;
    background:rgba(238, 235, 50,0.7) url('../assets/img/login.svg') no-repeat left center;
    background-size: 50% 50%;
  }
  .sheet{
    width: 400px;
    height: 100%;
    float:right;
    margin-right:200px;
    text-align: center;
  }
  #avator{
    margin-top:30%;
    width: 100px;
    height: 100px;
    border-radius: 50%;
  }
  
</style>