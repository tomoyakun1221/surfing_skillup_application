import Vue from 'vue/dist/vue.esm'
import router from './routes.js';

document.addEventListener('DOMContentLoaded', () => {
  const app = new Vue({
    el: '#app',
    router
  })
});