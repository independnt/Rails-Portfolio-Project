$(function(){
  $('#new_project_comment').on('submit', function(event){
    event.preventDefault();
    let url = this.action;
    let data = $(this).serialize();
    $.post(url, data).done(function(resp){
      console.log(resp)
    })
  })
})
