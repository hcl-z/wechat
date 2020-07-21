<template>
  <div>
      <form>
    <div class="box">
      <i class="fa fa-user fa-lg"></i>
      <input id="name" type="text" v-model="name" />
      <label v-show="nameshow" for="name">Username</label>
    </div>
    <div class="box">
      <i class="fa fa-lock fa-lg"></i>
      <input id="pass" type="password" v-model="pass" />
      <label v-show="passshow" for="pass">Password</label>
    </div>
    <div class="box">
      <i class="fa fa-envelope"></i>
      <input id="email" type="email" v-model="email" />
      <label v-show="emailshow" for="email">Email</label>
    </div>
    <div class="box">
      <i class="fa fa-key"></i>
      <input id="code" type="text" v-model="code" />
      <label v-show="codeshow" for="code">code</label>
      <div class="code">点击发送验证码</div>
    </div>
    </form>
    <button class="active" @click='register'>注册</button>
    <button @click="change">登录</button>
  </div>
</template>
<script>
export default {
  data() {
    return {
      name: "",
      pass: "",
      email: "",
      code:'',
      codeshow:true,
      emailshow: true,
      nameshow: true,
      passshow: true
    };
  },
  methods: {
    change() {
      this.$emit("change", "login");
    },
    register(){
        let data={name:this.name,pass:this.pass,email:this.email}
        this.$axios.post('http://localhost:3000/reg',data)
        .then((res)=>{
            if(res.data.code==1) this.change()
        })
        .catch((err)=>{
            console.log(err)
        })
    }
  },
  watch: {
    name(n) {
      if (n) this.nameshow = false;
      else this.nameshow = true;
    },
    pass(n) {
      if (n) this.passshow = false;
      else this.passshow = true;
    },
    email(n) {
      if (n) this.emailshow = false;
      else this.emailshow = true;
    },
     code(n) {
      if (n) this.codeshow = false;
      else this.codeshow = true;
    }
  }
};
</script>
<style scoped>
button {
  width: 80%;
  padding: 10px;
  border-radius: 10px;
  border: none;
  font-size: 1em;
  outline: none;
  margin: 20px auto 5px;
  background-color: rgb(75, 175, 241);
}
input {
  appearance: none;
  border: none;
  border-bottom: 1px solid rgb(110, 163, 241);
  background-color: transparent;
  box-sizing: border-box;
  outline: none;
  width: 200px;
  height: 40px;
  margin: 10px auto;
  font-size: 1em;
  cursor: text;
}
.active {
  background-color: rgb(37, 248, 37) !important;
}
.box {
  position: relative;
  text-align: center;
}
.code {
  position: absolute;
  background:  rgb(220, 231, 189);
  padding:5px 5px;
  border-radius: 5px;
  transform: translateY(-50%);
  right: 100px;
  top: 50%;
  cursor:pointer;
}
.fa {
  position: absolute;
  transform: translateY(-50%);
  left: 75px;
  top: 50%;
}
label {
  position: absolute;
  transform: translateY(-50%);
  left: 100px;
  font-weight: 600;
  top: 50%;
  transition: 1s;
  color: black;
  cursor: text;
}
input:focus + label {
  color: rgb(105, 105, 116);
  top: 10px;
}
</style>