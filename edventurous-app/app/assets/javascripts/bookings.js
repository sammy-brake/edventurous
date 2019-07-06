// hijack the "schedule" button on user show page to display the user's bookings


// make a constructor for booking 

$(document).ready(function() {
    $("#schedule").on("click", function(e){
       $("#schedule").hide();
       $.get("/bookings.json").done(function(json){
        // create a new booking instance by passing json
        $("div.bookings").append("<h1 class='break'> Scheduled Bookings </h1>")
        $("div.bookings").append("<div class='booking'>")
           json.forEach(function(info){
            debugger 
            //under here there is an issue
               let newBooking = new Booking(info);
               newBooking.date = newBooking.formatDate();
                let bookingHtml = newBooking.formatIndex();
                $('div.booking').append(bookingHtml);
            })
       })
       e.preventDefault()

        
    })
})

function Booking(info) {
    this.id = info.id;
    this.date = info.date;
    this.field_experience_id = info.field_experience.id;
    this.field_experience_title = info.field_experience.title;
}

Booking.prototype.formatDate = function() {
    this.date = new Date(this.date);
    return this.date 
};

Booking.prototype.formatIndex = function() {
    let bookingHtml = `
    <h2>${this.field_experience_title}</h2>
    <h3>${this.date}</h3>
    `
    return bookingHtml;
};
