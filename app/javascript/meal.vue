<template>
  <div id="meal" class="col-6 column-justify">
    <div class="card" id="today">
      <div class="card-header">今日</div>
      <div class="card-body">
        <span v-for="meal in meals[0]">
          <img :src="meal.img">
        </span>
      </div>
    </div>

    <div class="d-flex justify-content-between">
      <div class="card" id="yesterday">
        <div class="card-header">昨日</div>
        <div class="card-body">
          <span v-for="meal in meals[1]">
            <img :src="meal.img">
          </span>
        </div>
      </div>

      <div class="card" id="yesterday-1">
        <div class="card-header">一昨日</div>
        <div class="card-body">
          <span v-for="meal in meals[2]">
            <img :src="meal.img">
          </span>
        </div>
      </div>
    </div>
  </div>
</template>

<script>
var meals = [ [], [], [] ]

export default {
  created: function() {
    window.componentMeal = this
    fetch("/tv.json", {credentials: "include"}).then(function(res) {
      return res.json()
    }).then(function(json) {
      for(let meals2 of json.two)  meals[2].unshift({img: meals2.img.url})
      for(let meals1 of json.one)  meals[1].unshift({img: meals1.img.url})
      for(let meals0 of json.zero) meals[0].unshift({img: meals0.img.url})
    })
  },
  data: function () {
    return {
      meals
    }
  },
  methods: {
    addMeal: function(imgUrl) {
      meals[0].unshift({img: imgUrl})
    },
    dayChanged: function() {
      meals.pop()
      meals.unshift([])
    }
  }
}
</script>

<style scoped>
.card {
  height: 47vh;
}

.d-flex .card {
  width: 47%;
}

.card-body {
  padding: 0;
  overflow-y: auto;
}

#today img {
  height: calc((47vh - 49px)/2);
  max-width: 32%;
}

#yesterday img, #yesterday-1 img {
  height: calc((47vh - 49px)/2);
  max-width: 48%;
}
</style>
