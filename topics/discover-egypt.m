\ by kyyeo
\ https://github.com/kyyeo/
\

\ First, draft the content
\ https://www.natgeokids.com/uk/discover/history/egypt/ten-facts-about-ancient-egypt/
\ list of interesting prompts
: three-things ( -- "s" ) 
    {{
        "How many pyramids are there?" 
        "Which is the largest pyramid?"
        "Was toothpaste invented by the Egyptians?"
        "Back to Main Menu"
    }} mk-menu
    \ "mk-menu" function is referenced in uiux.m
;


\ introductory picture
: img-discover-egypt "https://cdn.pixabay.com/photo/2021/06/12/12/10/fantasy-6330791_960_720.jpg" ;

\ introduction to Discover Egypt room
: discoverEgypt ( -- "s" ) 
    three-things ctx{ three }
    
    {{
        img-discover-egypt
    }} randomize head ctx{ discoverEgypt }
    
    q{  
        <img 
            src="#{discoverEgypt}"
            width="480px"
            style="border-radius:6px;border:1px solid #AAA"
        >
        <h1>It's time to learn about Egypt</h1>
        <p>
            <b>Magical Egypt Tours</b> wants to share magical facts about Egypt with you.
        </p>
        #{three}
    }q
;


\ Second, use a template to trigger "discover-egypt.m"
Q: discover egypt
A: ${discoverEgypt}
K: $clear discoverKey
--

\ Thirdly, a way to return to the Main Menu
Q: Back to Main Menu
A: ${main-menu}
K: $clear
-- 

\ keep all the responses here
room: discoverKey
    \ remember to remove punctuation (peculiarity of Smojo)
    Q: How many pyramids are there
    MM Most Ancient Egyptian pyramids were built as tombs for pharaohs (rulers of Ancient Egypt) and their families. 
    MM To date, over 130 pyramids have been discovered in Egypt.
    \ always show the user all questions
    M. ${three-things}
    --
    
    Q: Which is the largest pyramid
    MM The Pyramid of Khufu at Giza is the largest Egyptian pyramid. 
    MM This incredible structure weighs as much as 16 Empire State buildings!
    M. ${three-things}
    --
    
    Q: Was toothpaste invented by the Egyptians
    MM Yes!
    MM Ancient Egyptians invented lots of things including paper, pens, locks and keys.
    M. ${three-things}
    --
end-room

