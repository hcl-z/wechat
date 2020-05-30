<template>
    <div>
    <div v-if="type=='me'" class='right'>
      <span><slot></slot></span>
      <img :src="src" alt="">
    </div>
    <div v-else-if="type=='he'" class='left'>
     <img :src="src" alt="">
     <span><slot></slot></span>
    </div>
</div>
</template>

<script>
export default {
    data() {
        return {
            
        }
    },
    props:['type','src']
}
</script>
<style scoped>
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