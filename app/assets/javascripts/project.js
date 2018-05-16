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
  $(".js-next").on('click', function(){
    let currentId = parseInt($(".js-next").attr("data-uid"))
    console.log(currentId)
  })
}

function userProjects(user_id){
  $.getJSON("/users/" + user_id + ".json", data => {
    let projectsObj = data.projects
    console.log(projectsObj)
  })
}

function createProject(project){
  let jsProject = new Project(project.id, project.name, project.description, project.categories, project.city, project.state)
  return jsProject
}

class Project {
  constructor(id, name, description, categories, city, state){
    this.id = id;
    this.name = name;
    this.description = description;
    this.categories = categories;
    this.city = city;
    this.state = state;
  }

  getId(){
    return this.id
  }

  getName(){
    return this.name
  }

  getDescription(){
    return this.description
  }

  getCategories(){
    return this.categories
  }

  getCity(){
    return this.city
  }

  getState(){
    return this.state
  }
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
