<template>
  <draggable class="row"> 
    <div v-for="list in original_lisls" class="col-md-3"> 
      <h3> {{ list.name }} </h3>
      <hr>
      <draggable v-model="list.cards" :options="{group:'cards'}">
        <div v-for= "(card, index) in list.cards" class="card card-body">
          {{ card.name }}
        </div>
      </draggable> 
      <div class=" card card-body">
        <textarea  class="form-control"></textarea>
        <button  class="btn btn-primary"> add </button>
      </div>
    </div>
  </draggable>
</template>

<script>
import draggable from 'vuedraggable'
export default {
  components: {draggable},
  props: ["original_lisls"],
  data: function () {
    return {
      message: "Hello Vue!"
    }
  }
}
</script>

<style scoped>
p {
  font-size: 2em;
  text-align: center;
}
</style>
