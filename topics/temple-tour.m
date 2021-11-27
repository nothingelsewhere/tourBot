\ kyyeo
\
\ First, draft the content
\ https://www.ducksters.com/history/ancient_egypt/temples_and_priests.php
\ list of interesting prompts
: temple-tour ( -- "s" ) 
    {{
        "Karnak Temple" 
        "Abu Simbel Temple"
        "Temple of Hatshepsut"
        "Back to Main Menu"
    }} mk-menu
    \ "mk-menu" function is referenced in uiux.m
;


\ introductory picture
: img-temple-egypt "https://cdn.pixabay.com/photo/2015/01/15/18/35/abu-simbel-600667_960_720.jpg" ;

\ introduction to Discover Egypt room
: discoverTemple ( -- "s" ) 
    temple-tour ctx{ threeTemple }
    
    {{
        img-temple-egypt
    }} randomize head ctx{ discoverTemple }
    
    q{  
        <img 
            src="#{discoverTemple}"
            width="480px"
            style="border-rTHREE-TEMPLE-THINGSdius:6px;border:1px solid #AAA"
        >
        <h1>Temple Fact #2347</h1>
        <p>
            <b>Magical Egypt Tours</b> wants you to see some Egyptian temples.
        </p>
        #{threeTemple}
    }q
;


\ Second, use a template to trigger "discover-egypt.m"
Q: temple tour
A: ${discoverTemple}
K: $clear templeKey
--

\ Thirdly, a way to return to the Main Menu
Q: Back to Main Menu
A: ${main-menu}
K: $clear
-- 

\ keep all the responses here
room: templeKey
    Q: karnak temple
    MM https://cdn.pixabay.com/photo/2018/04/23/11/49/egypt-3344002_960_720.jpg
    M. ${temple-tour}
    --
    
    Q: abu simbel temple
    MM https://cdn.pixabay.com/photo/2017/02/21/16/12/abu-simbel-2086498_960_720.jpg
    M. ${temple-tour}
    --
    
    Q: Temple of Hatshepsut
    MM https://cdn.pixabay.com/photo/2018/04/28/09/33/egypt-3356915_960_720.jpg
    M. ${temple-tour}
    --
end-room
