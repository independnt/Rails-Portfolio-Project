$(document).ready(() => {
  attachProjectListeners();
})

function attachProjectListeners(){
  indexListener();
  nextProjectListener();
}


function indexListener(){
  $(".js-more").on("click", function(){
    let project_id = $(this).data("id");
    let user_id = $(this).data("uid")
    $.getJSON("/users/" + user_id + "/projects/" + project_id + ".json", data => {
      console.log(data)
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
      $('.categories').html(`${categoryDisplay(resp.categories)}`)
      $('.js-next').attr('data-id', resp.id)
    })

    console.log(allProjects)
    console.log(`current index is ${currentIndex}`)
    console.log(`next index is ${nextIndex}`)
    console.log(`next is ${next}`)
  })
}

function categoryDisplay(categoryArray){
  for(let category of categoryArray){
    return `<li><a href="/categories/${category.id}">${category.name}</a></li>`
  }
}

function userProjects(user_id){
  $.getJSON("/users/" + user_id + ".json").done(data => {
    let projectObj = (data.projects)
    return projectObj
  })
}

// function createProject(project){
//   let jsProject = new Project(project.id, project.name, project.description, project.categories, project.city, project.state)
//   return jsProject
// }

// class Project {
//   constructor(id, name, description, categories, city, state){
//     this.id = id;
//     this.name = name;
//     this.description = description;
//     this.categories = categories;
//     this.city = city;
//     this.state = state;
//   }
//
//   getId(){
//     return this.id
//   }
//
//   getName(){
//     return this.name
//   }
//
//   getDescription(){
//     return this.description
//   }
//
//   getCategories(){
//     return this.categories
//   }
//
//   getCity(){
//     return this.city
//   }
//
//   getState(){
//     return this.state
//   }
// }

//$(function(){
//  $("#test").on('click', function(){
//    $.getJSON("/active_projects", data => {
//      for(let x in data){
//        console.log(x)
//      }
//    })
//  })
//})
