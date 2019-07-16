// wrap in document ready function so js will load after DOM

$(document).ready(function() {
    // hijack submit button for new field experiences so we can submit and display without refresh
    $('form.new_field_experience').submit(function(e) {
        e.preventDefault();
        // serialize the values posted by the form
        let values = $(this).serialize();
        let posting = $.post('/field_experiences', values);
        posting.done(function(experience) {
           let newExperience = new FieldExperience(experience)
           let experienceHtml = newExperience.formatShow();
           $('div.experience').append(experienceHtml);
          });
    })


// //display index on homepage.
    $("#auto").on("click", function(e){
        $("#auto").hide();
       $.get("/field_experiences.json").done(function(json){
            json.forEach(function(experience){
                $("div.experience").append("<h2 class='new'>" + experience["title"] + "</h2>")
                .append("<h3>" + experience["location"] + "</h3>")
                .append("<h5>" + experience["subject"] + "</h5>")
                .append("<h5> Grade Levels: " + experience["gradelevels"] + "</h5>")
                .append("<p>" + experience["summary"] + "</p>")
             })
         })
        e.preventDefault()
    });

// display education experiences and sort 
$("#sort").on("click", function(e){
    $("#sort").hide();
   $.get("/field_experiences.json").done(function(json){
       json.sort(function(a, b){
        var titleA = a.title.toUpperCase(); 
        var titleB = b.title.toUpperCase(); 
        if (titleA < titleB) {
          return -1;
        }
        if (titleA > titleB) {
          return 1;
        }
      
        return 0;
       })
  
        json.forEach(function(experience){
            debugger
            $("div.experience").append("<h2 class='new'>" + experience["title"] + "</h2>")
            .append("<h3>" + experience["location"] + "</h3>")
            .append("<h5>" + experience["subject"] + "</h5>")
            .append("<h5> Grade Levels: " + experience["gradelevels"] + "</h5>")
            .append("<p>" + experience["summary"] + "</p>")
         })
     })
    e.preventDefault()
});

    //show json from a single object

    $("div.attach a").on("click", function(e){
        $.get(this.href + ".json").done(function(json){
            let appendDiv = document.getElementById("show" + json.id);
           $(appendDiv).append(`<p class='experience' style='font-size: 15px'>${json.summary}</p>`)
        })

        e.preventDefault();
    })
  
   
// })

// // make a consructor for field experience 

function FieldExperience(experience) {
    this.id = experience.id;
    this.title = experience.title;
    this.subject = experience.subject; 
    this.gradeLevels = experience.gradelevels; 
    this.location = experience.location; 
    this.summary = experience.summary; 
}

FieldExperience.prototype.formatShow = function(){
    let experienceHtml = `
    <h2>${this.title}</h2>
    <h3>${this.subject}</h3>
    <h3>${this.location}</h3>
    <h3>${this.gradeLevels}</h3>
    <p>${this.summary}</p>
    `
    return experienceHtml;
};

});

