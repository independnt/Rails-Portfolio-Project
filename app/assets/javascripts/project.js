$(document).ready(() => {
  attachProjectListeners();
})

function attachProjectListeners(){
  indexListener();
  nextProjectListener();
  showCommentsListener();
}


function indexListener(){
  $(".js-more").on("click", function(){
    let project_id = $(this).data("id");
    let user_id = $(this).data("uid");
    $.getJSON("/users/" + user_id + "/projects/" + project_id + ".json", data => {
      $("#project-display").html(
        `<h3>${data.name}</h3>
        <p>${data.description}</p>`
      )
    })
  })
}

function nextProjectListener(){
  let allProjects = []
  let currentId = parseInt($(".js-next").attr("data-uid"))

  //get all project Id's for the current user
  $.get("/users/" + currentId + ".json").done(resp => {
    resp["projects"].forEach(function(project){
      allProjects.push(project.id)
    })
  })

  $(".js-next").on('click', () => {
    let projectId = parseInt($(".js-next").attr("data-id"))
    let currentIndex = allProjects.indexOf(projectId)
    let nextIndex = currentIndex + 1
    let next = projectId

    if(allProjects.length === 1){
      alert("This user only has one project")
    }else if(nextIndex === allProjects.length){
      next = allProjects[0]
    }else{
      next = allProjects[nextIndex]
    }

    let nextURL = `/users/${currentId}/projects/${next}.json`

     $.get(nextURL).done(resp => {
       $('.title').html(`<h1>${resp.name}</h1>`)
       $('.details').html(`
       <h4>Project location: ${resp.city}, ${resp.state}</h4>
       <h3>Description:</h3>
       <p>${resp.description}</p>`)
       $('.button_to').attr('action', `/back_project/${resp.id}`)
       $('#edit-project').attr('href', `/users/${currentId}/projects/${resp.id}/edit`)
       $('#delete-project').attr('href', `/users/${currentId}/projects/${resp.id}`)
       $('.categories').html(`${categoryDisplay(resp.categories)}`)
       $('.js-next').attr('data-id', resp.id)
    })
  })
}

function categoryDisplay(categoryArray){
  let response = ""
  for(let category of categoryArray){
    response += `<li><a href="/categories/${category.id}">${category.name}</a></li>`
  }
  return response
}

function showCommentsListener(){
  $('.show-comments').on('click', function(e){
    e.preventDefault();
    let projectId = parseInt($(".js-next").attr("data-id"))
    let userId = parseInt($(".js-next").attr("data-uid"))
    $.getJSON(`/users/${userId}/projects/${projectId}/comments`, function(resp){
      $('.comment-list').append(`${listComments(resp)}`)
    })
  })
}

function listComments(commentArray){
  let comments = ""
  for(let comment of commentArray){
    comments += `<li class="comment"> ${comment.user.username} says: ${comment.comment}</li>`
  }
  return comments
}

// function userProjects(user_id){
//   $.getJSON("/users/" + user_id + ".json").done(data => {
//     let projectObj = (data.projects)
//     return projectObj
//   })
// }
