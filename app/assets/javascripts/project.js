$(function(){
  $(".js-more").on("click", function(){
    let project_id = $(this).data("id");
    let user_id = $(this).data("uid")
    $.get("/users/" + user_id + "/projects/" + project_id + ".json", data =>{
      $("#project-display").html(
        `<h3>${data["name"]}</h3>
        <p>${data["description"]}</p>`
      )
    })
  })
})
