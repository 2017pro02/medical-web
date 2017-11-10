<template>
  <div class="col-6 column-justify">
    <div id="sugguest" class="card">
      <div class="card-body">
        <h4 class="card-title">オススメの料理はまだ表示されません:(</h4>
        <h6 class="card-subtitle mb-2 text-muted">開発中です💦</h6>
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
</style>
