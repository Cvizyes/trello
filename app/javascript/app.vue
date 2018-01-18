<template>
  <draggable v-model="lists" :options="{group: 'lists'}" class="board dragArea" @end="listMoved">
    <div v-for="list in original_lists" class="list">
      <h2>{{ list.name }}</h2>
      <hr>
      <draggable v-model="list.cards" :options="{group: 'cards'}"> 
        <div  v-for="(card, index) in list.cards" class="card card-body">
         {{card.name}}
        </div>
     </draggable>
      <textarea v-model="messages[list.id]" class=" form-control"></textarea>
      <button v-on:click="submitMessages(list.id)" class="btn btn-primary">Add</button>
    </div>
  </draggable>
</template>

<script>
  import draggable from 'vuedraggable'

  export default {
    components: { draggable },

    props: ["original_lists"],
    data: function() {
      return {
        messages: {},
        lists: this.original_lists,
      }
    },

    methods: {
      submitMessages: function (list_id) {
       var data = new ForData
       data.append("card[list_id]", list_id)
       data.append("card[name]", this.messages[list_id]) 

       Rails.ajax({
        url: "/cards",
        type: "POST",
        data: data,
        dataType: "Json",
        success: (data) => {
          const index = this.lists.findIndex(item.id == list_id)
          this.lists[index].cards.push(data)
          this.messages[list_id] = undefined
        }
       })
      }

    }
  }

</script>


<style scoped>
.dragArea {
  min-height: 10px;
}
.board {
  overflow-x: auto;

}
.list {
  background: #E2E4E6;
  border-radius: 3px;
  display: inline-block;
  margin-right: 20px;
  padding: 10px;
  vertical-align: top;
  width: 270px;
}
.button{
  width: 270px;
}
.card{
  height: 100px;
  border-radius: 5px;
  border:1px solid #000000;

}
</style>
