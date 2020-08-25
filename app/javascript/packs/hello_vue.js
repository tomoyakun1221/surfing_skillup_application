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
          photograph_day_on: null,
          title: null,
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

//= require jquery3
//= require popper
//= require bootstrap-sprockets