// This file is automatically compiled by Webpack, along with any other files
// present in this directory. You're encouraged to place your actual application logic in
// a relevant structure within app/javascript and only use these pack files to reference
// that code so it'll be compiled.

import Vue from 'vue/dist/vue.esm'
import router from './routes.js';
import Vuex from 'vuex';
import VueRouter from 'vue-router';
import axios from 'axios'
import Qs from 'qs'
import ElementUI from 'element-ui'
import locale from 'element-ui/lib/locale/lang/ja'

Vue.config.productionTip = false

Vue.prototype.$axios = axios

Vue.use(ElementUI, { locale })
Vue.use(Vuex);
Vue.use(VueRouter);

document.addEventListener('DOMContentLoaded', () => {
  new Vue({
    el: '#application',
    store: new Vuex.Store(store),
    router,
    render: (h) => h(App),
  });
});

document.addEventListener('DOMContentLoaded', () => {
  const app = new Vue({
    el: '#el-index',
    data: function(){
      return {
        staffs: [],
        query: {
          photograph_day_on_year: Date.today.year,
          photograph_day_on_month: Date.today.month,
          title_cont: null,
        }
      }
    },
    created: function(){
      this.search()
    },
    methods:{
      notify: function(msg){
          this.$notify({
            type: 'error',
            title: 'Error',
            message: msg
          });
      },
      search: function(){
        axios.get('/api/image_videos/search',{
          params:{
            q: this.query
          },
          paramsSerializer: function(params) {
            return Qs.stringify(params, {arrayFormat: 'brackets'})
          }
        })
        .then((response) => {
          console.log(response);
          this.image_videos = response.data.image_videos;
        })
        .catch((error) => {
          console.log(error);
          this.notify(error.message);
        })
      }
    }
  })
})

require("@rails/ujs").start()
require("turbolinks").start()
require("@rails/activestorage").start()
require("channels")

//= require jquery3
//= require popper
//= require bootstrap-sprockets


// Uncomment to copy all static images under ../images to the output folder and reference
// them with the image_pack_tag helper in views (e.g <%= image_pack_tag 'rails.png' %>)
// or the `imagePath` JavaScript helper below.
//
// const images = require.context('../images', true)
// const imagePath = (name) => images(name, true)
