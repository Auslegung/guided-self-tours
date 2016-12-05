# guided-self-tours
Create guided tours of history, nature, art, and more.  https://protected-retreat-87097.herokuapp.com/#/

## 1. Technologies Used
- Ruby on Rails
- AngularJS
- Google Maps Javascript API

## 2. My Approach

## 3. Future Features
#### User Experience:
- Allow user to record short audio clips to associate with markers.
- Users can listen to the audio only if they're within 10 meters of the marker.
- Allow user to group markers together into tours that must be visited in a
specific order for audio to play.
- Allow user to search for markers by category, title, description, or tour name.
- Clicking 'Save & Close' on an infowindow will also close the infowindow.
- Clicking on a recently-created marker will show the information not inside
input fields.
- Add username to each marker that a user creates.
- Clicking on a username takes a user to that user's page, where they can see
all of the markers created by that user.

#### Database optimization:
- Change primary key to username and make username the foreign key on markers,
that way adding the username to each marker's infowindow is faster.
- Load all markers when the map loads, but only load infowindow content when
the user clicks on the marker.

#### UI Feature:
- Add styling to signup/login form.
- Add background video to landing page.
- Add navigation menu to all pages.
- Give user the option to change their password and username
- Change marker colors:
 - Green if user hasn't visited the marker.
 - Blue if user has visited the marker.
 - Yellow if user created the marker.
 - Red if the user has clicked on the marker but has not visited it.
- Add Google StreeView image to each marker's infowindow

## 4. Unsolved Problems
- Delete and update markers are not working.
- Login is broken and doesn't require a username or password.
- JSON.parse is asynchronous, so every attempt to use that needs to be added
to a promise chain.


## 5. User Stories

#### Version 1

- As an unregistered or logged out user I want to search for a spot on the
map (address, coordinates, place name, marker title, marker description, marker
  category) so I can click on markers so I can see (but not hear) the title,
  description, category, and user that created the marker.
- As an unregistered user I want to create an account so I can log in.
- As a logged out user I want to log in so I can use the app.
- As a logged in user I want to search for a spot on the map (address,
  coordinates, place name, marker title, marker description, marker category)
  to find a location to:
  - create a new marker.
  - edit my markers.
  - delete my markers.
  - view and listen to markers that others made.
- As a logged in user I want to search for other users so I can be notified when
they add a new marker.
