<template>
  <div id="meal" class="col-6 column-justify">
    <div class="card">
      <div class="card-header">一昨日</div>
      <div class="card-body">
        <span v-for="meal in meals[2]">
          <img :src="meal.img">
        </span>
      </div>
    </div>

    <div class="card">
      <div class="card-header">昨日</div>
      <div class="card-body">
        <span v-for="meal in meals[1]">
          <img :src="meal.img">
        </span>
      </div>
    </div>

    <div class="card">
      <div class="card-header">今日</div>
      <div class="card-body">
        <span v-for="meal in meals[0]">
          <img :src="meal.img">
        </span>
      </div>
    </div>
  </div>
</template>

<script>
var meals = [ [], [], [] ]

export default {
  created: function() {
    window.componentMeal = this
  },
  data: function () {
    return {
      meals
    }
  },
  methods: {
    addMeal: function(imgUrl) {
      meals[0].push({img: imgUrl})
    },
    dayChanged: function() {
      meals.pop()
      meals.unshift([])
    }
  }
}
</script>

<style scoped>
.card-body {
  padding: 0;
  display: flex;
  flex-wrap: nowrap;
  overflow-x: auto;
  overflow-y: hidden;
}

img {
  height: calc(30vh - 50px);
}
</style>
