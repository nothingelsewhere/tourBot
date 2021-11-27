\ NLB - AI4IMPACT Smart City Chatbot Challenge
\ 44m 14s
\ https://youtu.be/h_dbTS_gd9s?t=2654

\ TYPE called 'cancel', that has THINGS called 'Cancel' and 'Menu' 
@: cancel 
cancel: Cancel Menu

\ mem makes the bot STATEFUL
\ think back to earlier labs using ids as a counter
\ intent is to collect 4 pieces of information
mem: tour-type tour-date customer-name customer-email



\ function to format memory variable for logging, which is called at the bottom in booking.m
: booking ( -- "s" ) 
   tour-type tour-date customer-name customer-email
   \ bind the mem to abbreviations
   ctx{ tt td cn ce }
    
   
   q{   
        type:#{tt}, 
        date:#{td},
        name:#{cn},
        email:#{ce},
   }q
;


\ to show a tour menu for selection
\ "mk-menu" is a function referenced in "uiux.m"
: tour-menu ( -- "s" ) 
    {{
        "Nile Tour"
        "Temple Tour"
        "Pyramid Tour"
        "Custom Tour"
    }} mk-menu
;


\ if either Q: matches, then template is triggered
Q: Book a Tour
Q: No change my booking
\ "MM" is equivalent to a HTML line break
\ it is a Multi-Line Answer (vs A: with a long answer)
MM What kind of tour would you like to book? 
MM
MM ${ tour-menu } 
\ What is a "M."? it signifies the end of a multi-line answer.
M. 
\ clear other keys and give the "tour-type" key
K: $clear tour-type
-- 

\ scroll up to see TYPE "things"
\ if "Q:" equals 'Menu' or 'Cancel'
\ then show ${main-menu}, which is referenced from "uiux.m" 
Q: @cancel
A: ${ main-menu }
\ clear all keys
K: $clear
--

\ 
room: tour-type
    
    \ recall Q: and A: templates in Smojo language
    \ therefore, "$x Tour" just means look for an input matching to "{something} plus Tour"
    \ which would be the result of clicking a button
    Q: $x Tour
    \ save the $x variable into "tour-type" memory
    B: $x tour-type!
    \ ask the next question, and give the next key
    A: What dates are you looking at?
    \ e.g. K: -tour-type tour-date
    \ -tour-type discards tour-type key
    \ tour-date adds a new key
    K: $back tour-date
    --
    
    \ catch all if user does anything else
    Q: $_
    MM Sorry, I don't understand. Which kind of tour do you want?
    MM
    MM ${ tour-menu }
    M. ${ "Menu" button }
    --
    
end-room

\ 
room: tour-date
    
    \ note that the date question was actually posed within the tour-type room 
    \ $_ means to accept any input (think of varying date formats)
    Q: $_
    \ store response into tour-date mem
    B: last-question tour-date!
    \ show a new question
    A: Can I have your name? 
    \ $back drops previous key, then give the next key
    K: $back customer-name
    --
    
end-room

\ 
room: customer-name
    
    \ see tour-date room above for further explanation
    Q: $_
    B: last-question customer-name!
    A: Can I have your email address?
    \ pass to customer-email room
    K: $back customer-email
    --
    
end-room

\ 
room: customer-email
    
    \ @email type is a "programmatic type" defined in "email.m"
    \ https://youtu.be/h_dbTS_gd9s?t=3314
    \ helps to check if user input is indeed an email
    Q: $x.@email
    \ store to mem
    B: $x customer-email!
    MM Great! ${ customer-name }, to confirm, you want to go on a 
    MM <b>${ tour-type }</b> Tour, on <b>${ tour-date }</b>
    MM and your email is <b>${ customer-email }</b>.
    MM 
    MM
    MM Is this correct? 
    MM ${ "Yes, confirmed!" button-highlighted } 
    MM ${ "No, change my booking" button }
    MM ${ "Cancel" button }
    M. 
    K: $clear
    --
    
    \ general catch all within "customer-email" room
    Q: $_
    MM Oops, that doesn't look like an email address. 
    MM Please try again. 
    MM Is this correct? 
    MM
    M. ${ "Menu" button }
    --
    
end-room

\ note Q: is taken from "customer-email" room
Q: Yes confirmed
MM We have received your booking and will contact you shortly.
\ show the main menu
M. ${ main-menu }
\ log the booking function, while is declared at the top of booking.m
L: ${ booking }
--


