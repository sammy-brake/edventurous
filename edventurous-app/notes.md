###Issues###



Need To Do:

I created the form, route, and controller actions for creating a new Field experience

- need to add model validations for creating the field experience
-need to add links to views so users can create field experience
-add "created by" to field experience, so users can see who created a particular experience



I've done: 
1. Created App
2. Added Gems - ran bundle install 
3. add welcome root
4. Tried and failed to use a bootstrap template
5. add about page
6. Use rails generate User to create a user with a name, password digest, subject, grade, and admin boolean. 
7. Use rails generate FieldExperience to create field experience with title, grade, subject, location, summary
8. Created ability for user to sign up and sign in. 
9. Created ability for user to signup and sign in with facebook account
10. I made my field experience index and show pages
11. I styled all of my current pages
12. Fixed mistake - in my booking controller, an error was leading to the first field
experience in my data base to be the one pulled for every booking.
13. Created nested index page  - bookings that are nested under a field exp 






Other Notes:

Don't forget to make commits
Run rake routes to see what the names of my routes are in the left most column - this provides post_path(post). The right most column will show the controller action needed
to link to a route - ex link_to "Display Text", post_path(post)

To do far in the future:
1. Use Geocoder to implement map with address feature 
2. Use a bootstrap template
3. How to give a user a profile picture
4. Study group suggested using 4 models to make implementing JS easier in the future. What would my 4th be?
5. Create a nested form so that when teachers create new bookings, they can select from an existing field experience or they can create a new one. 