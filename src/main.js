import Vue from 'vue'
import App from './App.vue'
import router from './router'
import './assets/css/main.css'
import VueSocketIO from 'vue-socket.io'
import SocketIO from "socket.io-client"
import 'font-awesome/css/font-awesome.min.css';
import axios from 'axios';
import io from 'socket.io-client';
const socket = io('http://localhost:3001');
Vue.prototype.$socket = socket;
Vue.prototype.$axios = axios;
// Vue.use(new VueSocketIO({
//     debug: true,
//     connection:SocketIO('http://localhost:3001')
// }))
axios.interceptors.request.use(config=>{
  const accessToken = window.sessionStorage.getItem('token');
  if(accessToken){
    config.headers.authorization=window.sessionStorage.getItem('token');
  }
  return config;

})
Vue.config.productionTip = false
new Vue({
  router,
  render: h => h(App)
}).$mount('#app')
