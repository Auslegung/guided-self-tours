# guided-self-tours
Create guided tours of history, nature, art, and more.

## 1. Technologies Used
- Paperclip

- AWS

- Ruby on Rails

- AngularJS

- Postgres

- PostGIS

## 2. My Approach
Version 1 has no geolocation, and user uploads their own audio file instead of
recording it in-app.  Version 2 adds geolocation but user uploads their own
audio file.  Version 3 restricts audio from playing unless the user is within 5
meters of the marker.  Version 4 allows users to record audio into the app.

## 3. Unsolved Problems

## 4. Notes to Self / Thoughts
### Database Stuff

##### User has:
- many markers
- username
- password

##### Marker has:
- belongs to user
- belongs to location
- title (limited to 20 characters)
- description (limited to ~160 characters)
- audio
- category

##### Location has:
- many markers
- latitude?
- longitude?

### Misc Thoughts
- How to put audio recording in markers table under audio column?  Put a link in
the table that points to where the audio is hosted?  How will that work?

- How to prevent the marker from being deleted if a user's account is deleted?
Don't really delete the user account, just archive it?  I'll still have full
CRUD on markers.

- What happens if a user deletes a marker?  What happens to the location?  Will
the marker still show up?  Should it be grayed out?  I think the location should
be removed from the map when there are no other markers associated with that
location.  But maybe not. Consider how to inspire other users to create another
marker in that location.

- how does the app get audio? Via app or uploaded files?

- if user moves more than x meters, update again.

- postgres has a gis feature probably, and might have a location-based query.
It's postgis.net

- What to do if user doesn't have GM on their phone?  Don't worry about this Q
on this project.

- How to create a server that my iPhone can get on and test out the app?
https://ngrok.com/

### Instructor feedback:
Getting AWS and paperclip may take a long time.  Assume it'll take 3 times
longer than expected, same with google maps API.  Talk to Sean re AWS and audio.


## 5. User Stories

###### As a [role] I want to [goal] so I can [motivation].

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
- ~~As a logged in user I want to search for other users so I can be notified when
they add a new marker.~~


A user creates their account, logs in, chooses a location on the google map,
creates a marker which involves making an audio recording (limit ~2 mins) that
gets associated with that location, choosing a category (art, history,
architecture, music, nature, tech, etc) and creating a title, description
(limit 160ish chars), and ~~photo~~ (?).  

User can see all markers on the map, and can click on any marker to reveal
an info window with the marker info (title, category, and description), but can
only listen to the audio if they are within 5 meters of the location.  This
encourages them to visit the locations in person.  (implement this sooner, then
remove it for testing, then put it back in at the end).

Markers are colored green if they haven't been visited, yellow if that user
created that marker, and blue if they have been visited.  Clicking on a blue
marker plays audio regardless of their geolocation (?).  Clicking on a yellow
marker asks if they want to edit it.  If yes, they can edit the title, category,
and description.  If they want to edit the audio, they have to delete it first
and re-record.  They can also delete a marker altogether.
