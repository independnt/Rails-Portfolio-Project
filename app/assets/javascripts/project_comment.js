$(function(){
  $('#new_project_comment').on('submit', function(event){
    alert('I STOPPED YOU')
    let url = this.action
    event.preventDefault();
  })
})
