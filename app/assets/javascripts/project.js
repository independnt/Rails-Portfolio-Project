$(document).ready(() => {
  attachProjectListeners();
})

function attachProjectListeners(){
  indexListener();
}


function indexListener(){
  $(".js-more").on("click", function(){
    let project_id = $(this).data("id");
    let user_id = $(this).data("uid")
    $.getJSON("/users/" + user_id + "/projects/" + project_id + ".json", data =>{
      $("#project-display").html(
        `<h3>${data.name}</h3>
        <p>${data.description}</p>`
      )
    })
  })
}


//$(function(){
//  $("#test").on('click', function(){
//    $.getJSON("/active_projects", data => {
//      for(let x in data){
//        console.log(x)
//      }
//    })
//  })
//})
