Need To Do:

1. use template?

4. Create Bookings - user_id, experience_id, date

5. Build Relationships - Users and Experiences both have many Bookings. They also have many of each other 

6. Create a header for the site index that lets a user sign up, log in, or access about page. 
7. Nested resources for fieldexperience/1/new
    --------When I create the form_for the nested resource, pass two objects form_for([@user, @fieldexp]) - video 2, 30 minutes in - the things I pass in might be changing. 
8. Create my scope methods - A user can search to find field experiences that have to do with a certain subject, grade, or location. https://github.com/hansenjl/CRUD-Pets This app is supposed to have a good example of using the form_tag and scope methods to do a search. The search would be a get request. 

9. Displaying error messages - look for the flatiron lab "validations with form_for" for easy error message display 


I've done: 
1. Created App
2. Added Gems - ran bundle install 
3. add welcome root
4. Tried and failed to use a bootstrap template
5. add about page
6. Use rails generate User to create a user with a name, password digest, subject, grade, and admin boolean. 
7. Use rails generate FieldExperience to create field experience with title, grade, subject, location, summary





Other Notes:

Don't forget to make commits
Run rake routes to see what the names of my routes are in the left most column - this provides post_path(post). The right most column will show the controller action needed
to link to a route - ex link_to "Display Text", post_path(post)

To do far in the future:
1. Use Geocoder to implement map with address feature 
2. Use a bootstrap template
3. How to give a user a profile picture
4. Study group suggested using 4 models to make implementing JS easier in the future. What would my 4th be?