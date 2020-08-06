import Vue from 'vue/dist/vue.esm';
import VueRouter from 'vue-router';
import Image_Video from './components/image_video.vue';

Vue.use(VueRouter);

const router = new VueRouter({
  mode: 'history',
    routes: [
    { path: '/image_videos/index', component: Image_Video, name: 'image_videos_index_path' },
  ]
});

export default router;