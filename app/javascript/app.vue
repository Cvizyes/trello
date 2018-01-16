<template>
  <div id="app" class="row">
    <div v-for="list in original_lists" class="col-md-3">
      {{ list.name }}
    </div>
  </div>
</template>

<script>
  console.log("hola soy el app.vue file")

  export default {
    props: ["original_lists"],
  }
</script>


<style scoped>
p {
  font-size: 2em;
  text-align: center;
}
</style>
