<template>
  <div>
    <form>
      <div class="box">
        <i class="fa fa-user fa-lg"></i>
        <input id="name" type="text" v-model="name" />
        <label v-show="nameshow" id="namelabel" for="name">Username</label>
      </div>
      <div class="box">
        <i class="fa fa-lock fa-lg"></i>
        <input id="pass" type="password" v-model="pass" />
        <label v-show="passshow" for="pass">Password</label>
      </div>
    </form>
    <button class="active" @click="login">登录</button>
    <button @click="change">注册</button>
  </div>
</template>
<script>
export default {
  data() {
    return {
      time: 1000,
      name: "",
      pass: "",
      nameshow: true,
      passshow: true
    };
  },
  // sockets: {
  //   connection: function() {
  //     console.log(1);
  //   }
  // },
  methods: {
    change() {
      this.$emit("change", "register");
    },
    login() {
      let data = { name: this.name, pass: this.pass };
      this.$axios
        .post("http://localhost:3000/log", data)
        .then(res => {
          console.log(res);
          this.alert = true;
          if (res.data.code == 1) {
            window.sessionStorage.setItem('id',res.data._id)
            window.sessionStorage.setItem('name',res.data.name)
            window.sessionStorage.setItem('imgsrc',res.data.headimg)
            window.sessionStorage.setItem('token',res.data.token)
            setTimeout(() => {
              this.$router.push('/home')
            }, this.time);
          }
        })
        .catch(err => {
          console.log(err);
        });
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
.active {
  background-color: rgb(37, 248, 37) !important;
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
.box {
  position: relative;
  text-align: center;
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