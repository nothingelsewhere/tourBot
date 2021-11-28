: pyramid-menu ( -- "s" ) 
    {{
        "Pyramids of Giza" 
        "Djoser Step Pyramid"
        "Back to Main Menu"
    }} mk-menu
;

: discoverPyramid ( -- "s" ) 
    pyramid-menu ctx{ Pyramid }
    q{  
        <img 
            src="https://cdn.pixabay.com/photo/2017/04/28/00/44/egypt-2267089_960_720.jpg"
            width="480px"
            style="border-rTHREE-TEMPLE-THINGSdius:6px;border:1px solid #AAA"
        >
        <h1>Pyramid Tour</h1>
        <p>
            <b>Magical Egypt tours brings you to see the magnificant pyramids of Egypt!</b>
        </p>
        #{Pyramid}
    }q
;


\ Use a template to trigger "pyramid-tour.m"
Q: pyramid tour
A: ${ discoverPyramid }
K: $clear pyramidKey
--

\ To return to the Main Menu
Q: Back to Main Menu
A: ${ main-menu }
K: $clear
-- 

\ keep all the responses here
room: pyramidKey
    Q: Pyramids of Giza
    MM https://as2.ftcdn.net/v2/jpg/01/88/96/13/500_F_188961396_0E2rfESXuSGIppetXBkNKgDldxPpOvyF.jpg
    MM <b>Pyramids of Giza</b> <br>
    MM The designations of the pyramids (Khufu, Khafre, and Menkaure) correspond to the kings for whom they were built for. 
    M. ${ pyramid-menu }
    --
    
    Q: Djoser Step Pyramid
    MM https://as1.ftcdn.net/v2/jpg/03/98/34/04/500_F_398340451_YtlpogjLu2FbOIYw29Nx7Uywh902RXbq.jpg
    MM <b>Djoser Step Pyramid</b> <br>
    MM The Step Pyramid of Djoser is the oldest pyramid in Egypt. It was built about 4,700 years ago
    M. ${ pyramid-menu }
    --
end-room

