$(function(){
  $('#new_project_comment').on('submit', function(event){
    event.preventDefault();
    let url = this.action;
    let data = $(this).serialize();
    $.post(url, data).done(function(resp){
      console.log(resp.comment)
    })
  })
})

function createComment(commentJson){
  this.id = commentJson.id
  this.user_id = commentJson.user_id
  this.project_id = commentJson.project_id
  this.comment = commentJson.comment
}
