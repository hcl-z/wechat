<template>
    <div :style={height:height} class='inputcontent'>
        <textarea name="" id="input" v-model="msg"></textarea>
        <button @click="send" >send</button>
    </div>
</template>

<script>
export default {
    data() {
        return {
            msg:''
        }
    },
    props:['height'],
    methods:{
        send(){
            this.$emit('sendmsg',this.msg)
        }
    }
}
</script>
<style scoped>
    .inputcontent{
       position: relative;
    }
    #input{
        width: 100%;
        height:100%;
        resize: none;
        border:none;
        outline: none;
        padding:10px;
        box-sizing: border-box;
        font-size:1.25em;
        font-family: Arial,'楷体',Helvetica, sans-serif;
    }
    button{
        position: absolute;
        bottom:20px;
        right:20px;
    }
</style>