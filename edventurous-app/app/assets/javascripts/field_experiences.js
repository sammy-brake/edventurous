
$(document).ready(function() {
    // hijack submit button for new field experiences so we can submit and display without refresh
    $('form.new_field_experience').submit(function(e) {
        e.preventDefault();
        let values = $(this).serialize();
 
        let posting = $.post('/field_experiences', values);
        posting.done(function(experience) {
            
           let newExperience = new FieldExperience(experience)
           let experienceHtml = newExperience.formatShow();
           $('div.experience').append(experienceHtml);

          });
    })


// //display index on homepage 
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
