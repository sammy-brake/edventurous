// hijack the "schedule" button on user show page to display the user's bookings
$(document).ready(function() {
    $("#schedule").on("click", function(e){
       $("#schedule").hide();
       $.get(this.href + ".json").done(function(json){
        $("div.bookings").append("<h1 class='break'> Scheduled Bookings </h1>")
        $("div.bookings").append("<div class='booking'>")
        // create a new booking instance by passing json
            json.bookings.forEach(function(info){
                let newBooking = new Booking(info);
                newBooking.date = newBooking.formatDate();
                let options = { weekday: 'long', year: 'numeric', month: 'long', day: 'numeric' };
                let shortDate = newBooking.date.toLocaleDateString("en-US", options);
                
                $('div.booking').append(
                    `<a id="hijack" href='/field_experiences/${newBooking.field_experience_id}/bookings/${newBooking.id}'>${shortDate}</a><br/>`
                )
            })
       })
       e.preventDefault()
    })

})

function Booking(info) {
    this.id = info.id;
    this.date = info.date;
    this.field_experience_id = info.field_experience_id
    
}

Booking.prototype.formatDate = function() {
    this.date = new Date(this.date);
    return this.date 
};


