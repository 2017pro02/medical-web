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
        <template v-if="message">
          <h4 class="card-title">{{ from }}様からメッセージです</h4>
          <p class="card-text">{{ message }}</p>
        </template>
        <template v-else>
          <h4>メッセージはありません</h4>
        </template>
      </div>
    </div>
  </div>
</template>

<script>
export default {
  created: function() {
    window.componentComment = this
  },
  data: function () {
    return {
      recommend_img: "https://i.imgur.com/HS91twq.jpg",
      recommend_name: "蕎麦",
      from: "",
      message: ""
    }
  },
  methods: {
    addComment: function(from, message) {
      this.from = from
      this.message = message
    }
  }
}
</script>

<style scoped>
#sugguest, #comment {
  height: 45vh;
}

img {
  max-height: 30vh;
}
</style>
