\ file contains uiux styling and content


\ style different buttons using CSS
: button-normal ( "s" -- "s" )
    q{
        padding:10px;
    }q (button)
;

: button-highlighted ( "s" -- "s" )
    \ https://www.w3schools.com/colors/colors_picker.asp
    q{
        padding:10px;
        background:#ffcc00;
    }q (button)
    \ avoid placing comments or irrelevant code between q{}
    \ smojo is not smart enough
    \ yet another bug
;

\ "f" stands for flag, which is a boolean value
\ wherever there's input of "Book"
: booking? ( "s" -- f ) "Book" indexof 0 >= ; 

\ boolean test for text of "Back to Main Menu"
: mainMenu? ( "s" -- f ) "Back to Main Menu" indexof 0 >= ;

: button ( "s" -- "s" ) 
    \ idiomatic way to write this function
    \ "dup" means duplicating the variable, which was passed as an argument
    
    \ with duplicated variable, test with "booking?" 
    \ if true, then highlight
    \ else, normal
    dup booking? -> button-highlighted exit |
    \ highlight buttons that are "Back to Main Menu"
    dup mainMenu? -> button-highlighted exit |.
    button-normal
    
;

\ function takes a sequence and returns a string
: mk-menu ( seq -- "s" ) { ss }
    \ ss is a local variable
    
    \ blank screen?
    ""
    
    \ append "button concat" to every element in the list
    ss [: button concat ;] reduce 
;

\ referred to in start.m
\ applies "mk-menu" function to the list
: main-menu ( -- "s" ) 
    {{
        "Tips for Visitors" 
        "Discover Egypt"
        "Nile Tour"
        "Temple Tour"
        "Pyramid Tour"
        "Quiz"
        "Book a Tour"
    }} mk-menu
;


