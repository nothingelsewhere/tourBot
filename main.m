\ NLB - AI4IMPACT Smart City Chatbot Challenge
\ YouTube: https://youtu.be/h_dbTS_gd9s?t=4330
\ Date: 27 November 2021

terra/chat
terra/chat/app
terra/chat/log
terra/chat/test

include ./topics/email.m
include ./topics/resources.m
include ./topics/uiux.m

include ./topics/bad-language.m

\ Find out more
include ./topics/discover-egypt.m
include ./topics/tips-for-travellers.m
include ./topics/nile-tour.m
include ./topics/pyramid-tour.m
include ./topics/temple-tour.m

\ Quiz 
include ./topics/quiz-helper.m
include ./topics/questions.m
include ./topics/quiz.m

\ Booking
include ./topics/booking.m

\ First page 
include ./topics/start.m

\ Unhandled questions.
include ./topics/unhandled.m


idk: I don't understand the question.

: test 
  \ NOTE: Add your questions to test here.
  % Quiz
  % Rambutan
  % Next Question
  % Lima
  % Next Question
;

: update-log 
  \ this name needs to match the name in publish:
  log: tourBot
;

: publish 
  
  \ IMPORTANT - edit this part. It's the name of your bot.
  publish: tourBot
  
  \ What your bot says at first. 
  \ see ${welcome} in "start.m"
  init: ${welcome}
  
  \ ------ PROPERTIES OF THE CHATBOT USER INTERFACE --------
  
  \ The background image. Should be tileable/repeatable. 
  \ Or you can use a HTML color (see https://www.w3schools.com/colors/colors_picker.asp)
  \ background: https://live.staticflickr.com/4135/4915115384_ca7b1df603_b.jpg
  background: white
  \ Image of the avatar to use. 
  avatar: none
  \ Optional border on avatar
  \ avatar-border: solid #AAA 1px
  avatar-border: none
  
  \ Google font to import.
  import-font: Open+Sans:wght@300
  \ Font to use in bubbles
  bubble-font: 'Open Sans', sans-serif
  \ Font Color & Background of bot bubble
  bubble-bot-color: #333
  bubble-bot-background: #EEE
  \ Font Color & Background for user bubble
  bubble-user-color: white
  bubble-user-background: #3366cc
  \ Other bubble properties
  \ bubble-border: solid blue 1px
  bubble-border: none
  bubble-radius: 16
  bubble-font-size: 14
  
  \ Max Width of bot bubble, in pixels
  bot-bubble-width: 480
  
  \ You can limit the number of responses displayed in the chatbot window
  \ think of the speech bubbles in whatsapp between friends
  \ limit to "5" maximum bubbles
  limit: 5
  
  \ Optional properties of the "send" button.
  \ Here's a sample from flaticon.com
  \ <div>Icons made by <a href="https://www.flaticon.com/authors/freepik" title="Freepik">Freepik</a> from <a href="https://www.flaticon.com/" title="Flaticon">www.flaticon.com</a></div>
  \ send-button-image-url: https://www.flaticon.com/svg/static/icons/svg/3652/3652532.svg
  \ send-button-image-style: padding-left:10px;
  send-button-image-url: https://smojo.ai/play.png
  send-button-image-style: none
  

  \ ----- PROPERTIES OF THE URL LINK FOR SOCIAL MEDIA --------
  \ These will be visible when you share the link to your bot.
  title: Magical Egypt Tours
  description: Come and discover Egypt with us!
  thumbnail: https://cdn.pixabay.com/photo/2016/02/27/00/13/ramses-2-1224938_1280.jpg
  
;
