\ new function that takes no arguments --, and returns a string "s"
: welcome ( -- "s" ) 
    \ ctx{} stands for a CONTEXT VARIABLE
    \ store in "menu" the outcome from "main-menu" in uiux.m
    main-menu ctx{ menu }
    
    \ randomly retrieve 1 of 3 images, as listed in resources.m
    \ referred with a context variable called "url"
    {{
        img-lantern
        img-walking
        img-jumping
        img-thebes
    }} randomize head ctx{ url }

    \ a quote ("q {}") can incorporate HTML elements with CSS formatting  
    \ #{url} refer to variable "url"
    q{  
        <img 
            src="#{url}"
            width="600px"
            style="border-radius:6px;border:1px solid #AAA"
        >
        <h1>Magical Egypt Tours</h1>
        <p>
            Welcome to <b>Magical Egypt Tours</b>. 
            We invite you to explore through this chatbot our beautiful country of Egypt
            and our premium tour services.
        </p>
        #{menu}
    }q
    \ #{menu} to "menu" variable, as declared above
    
;

