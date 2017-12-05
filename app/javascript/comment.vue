<template>
  <div class="col-6 column-justify">
    <div id="sugguest" class="card">
      <div class="card-body">
        <h4 class="card-title">オススメの料理</h4>
        <img :src="recommend_img" class="img-thumbnail">
        <p>{{ recommend_name }}を食べると良いでしょう</p>
      </div>
    </div>

    <div id="comment" class="card">
      <div class="card-body">
        <h4 class="card-title">メッセージ</h4>
        <template v-for="comment in comments">
          <div class="message">
            <h5>{{ comment.from }}さんからメッセージです</h5>
            <p class="card-text">{{ comment.message }}</p>
          </div>
          <hr>
        </template>
        <template v-if="comments.length == 0">
          <h4 class="card-title">メッセージはありません</h4>
        </template>
      </div>
    </div>
  </div>
</template>

<script>
var comments = []

export default {
  created: function() {
    window.componentComment = this
    se_receive_message = document.getElementById("se_receive_message")
    fetch("/tv.json", {credentials: "include"}).then(function(res) {
      return res.json()
    }).then(function(json) {
      console.log(json)
      for(let comment of json.comments) comments.unshift({from: comment.target_user.email, message: comment.message})
    })
  },
  data: function () {
    return {
      recommend_img: "https://i.imgur.com/HS91twq.jpg",
      recommend_name: "蕎麦",
      comments,
    }
  },
  methods: {
    addComment: function(from, message) {
      se_receive_message.play()
      comments.push({from, message})
    }
  }
}
</script>

<style scoped>
#sugguest, #comment {
  height: 45vh;
}

#comment .card-body {
  overflow-y: auto;
}

#comment .message {
  height: calc((45vh - 50px)/2)
}

img {
  max-height: 30vh;
}
</style>
