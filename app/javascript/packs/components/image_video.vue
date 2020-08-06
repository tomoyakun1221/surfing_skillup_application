<template>
    <div>
        <div class="container">
            <form>
                <div class="form-group">
                    <label for="form_title">質問名</label>
                    <input type="text" name="question[content]" class="form-control" id="content">
                    <button type="button" class="btn btn-primary" v-on:click="postQuestion">作成する</button>
                </div>
            </form>
        </div>
    </div>
</template>

<script>
    import axios from 'axios'

    export default {
        data: function () {
            return {
                question: {
                    content: null,
                },
              question_id: null
            }
        },
        methods: {
         postQuestion: function(){
           axios.post('/api/quetion', {
             content: this.question.content,
           }).then(function(res) {
             this.question_id = res.data._id
           });
         }
       }
    }
</script>