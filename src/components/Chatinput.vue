<template>
  <div class="inputcontent">
    <div class="text-input">
      <div class="tool">
        <span class="icon">
          <i class="fa fa-microphone fa-2x"></i>
        </span>
      </div>
      <div contenteditable="true" class="text-editor" ref="text" @drop="imgdrop" ></div>
    </div>
    <div class="audio-input">
      <img
        src="../assets/img/recorder.svg"
        alt
        width="100px"
        height="100px"
        v-if="isrecording"
        @click="start"
      />
      <img 
        src="../assets/img/214声波、语音消息.svg" 
        alt 
        width="100px" 
        height="100px" 
        v-else 
      />
      <audio ref=audio :src="src" style='visiable:hidden'></audio>
      <div class="process" v-show='!isrecording'>
          <span><i class='fa fa-play' @click="play"></i></span>
          <span><i class="fa fa-pause" @click="stop"></i></span>
          <span><i class='fa fa-close fa-lg error' @click="cancel"></i></span>
      </div>
      <div class="btn" @click="send">发送</div>
    </div>
  </div>
</template>

<script>
import Recorderx, { ENCODE_TYPE } from "recorderx";
export default {
  data() {
    return {
      rc: null,
      audio: "",
      src:'',
      state: false,
      isrecording: true
    };
  },
  mounted() {
    this.$refs.text.focus();
  },
  methods: {
    send() {
        let data=this.$refs.text.innerText
        if(data)
        {
            let content={ type: 'text', msg: data };
            this.$emit("sendmsg", content);
        }
        if(this.audio){
             let content={ type: 'audio', msg: this.audio };
            this.$emit("sendmsg", content);
        }
      
     
    },
    play() {
      this.$refs.audio.play();
    },
    stop(){
        this.$refs.audio.pause();
    },
    start() {
      this.state = !this.state;
      if (this.state == true) {
        this.record();
      } else {
        this.pause();
      }
    },
    record() {
      if (!this.rc) {
        this.rc = new Recorderx();
      } else {
        this.rc = null;
        this.rc = new Recorderx();
      }
      this.rc
        .start()
        .then(() => {})
        .catch(e => {
          console.log(e);
        });
    },
    pause() {
      if (!this.rc) return;
      this.rc.pause();
      this.audio = this.rc.getRecord({
        encodeTo: ENCODE_TYPE.WAV,
        compressible: true
      });
      this.isrecording = false;
      this.src = URL.createObjectURL(this.audio);
    },
    cancel() {
      this.clear();
      this.isrecording = true;
    },
    clear() {
      if (!this.rc) return;
      this.rc.clear();
    },
    imgdrop(e){
      e.preventDefault();
      console.log(e.dataTransfer)
      console.log(URL.createObjectURL(e.dataTransfer.files[0]))
    }
  }
};
</script>
<style>
.inputcontent {
  display: flex;
  height: 100%;
  width: 100%;
}

.tool {
  padding: 5px 20px;
}
.icon {
  margin-right: 20px;
}
.btn {
  position: absolute;
  bottom: 0;
  left: 0;
  transform: translate(-50%);
  width: 100px;
  height: 50px;
  background-color: skyblue;
  border-radius: 100px 100px 0 0;
  display: flex;
  justify-content: center;
  align-items: center;
  color: white;
  font-size: 1.25rem;
}
.process{
    margin-top:20px;
    width: 100px;
    display: flex;
    justify-content: space-between;
}
.error{
    color:red;
}
.text-input {
  flex: 2;
  display: flex;
  height:100%;
  flex-direction: column;
  border-right: 1px solid purple;
}
.text-editor {
  border: none;
  flex: 1;
  height:100%;
  overflow: auto;
  outline: none;
  padding: 10px 20px;
}
.text-editor img {
  width: 50%;
  height: auto;
  display: block;
}
.audio-input {
  flex: 1;
  display: flex;
  flex-direction: column;
  align-items: center;
  justify-content: center;
  position: relative;
}
</style>