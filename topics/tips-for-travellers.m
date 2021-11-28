\ @author: nothingelse
\ @date: 28 Nov 2021
\
\ credit to content - Ultimate Guide to Visiting Egypt
\ https://annaeverywhere.com/egypt-travel-guide/
\
: tips-visitor ( -- "s" ) 
    {{
        "When to Go?"
        "How Much Does it Cost?"
        "Food in Egypt"
        "Back to Main Menu"
    }} mk-menu
;
\ "mk-menu" function is referenced in uiux.m

\ intro picture
: img-tips-visitor "https://cdn.pixabay.com/photo/2019/06/26/12/25/tomb-4300251_960_720.jpg" 
;

\ intro to tips for Visitor room
: tipsVisitor ( -- "s" )
    tips-visitor ctx{ threeTips }
    
    {{
        img-tips-visitor
    }} randomize head ctx{ tipsVisitor }
    
    q{  
        <img 
            src="#{tipsVisitor}"
            width="465px"
            style="border-radius:6px;border:1px solid #AAA"
        >
        <h1>Tips for Visitors</h1>
        <p>
        <b>Here are some useful tips for visitors.</b> 
        <p>Please click on one of the following options to find out more.
        #{threeTips}
    }q
;

\ Second, use a template to trigger "tips-for-travellers.m"
Q: tips for visitors
A: ${tipsVisitor}
K: $clear tipsvisitorKey
--

\ Thirdly, a way to return to the Main Menu
Q: Back to Main Menu
A: ${main-menu}
K: $clear
--

\ keep all the responses here
room: tipsvisitorKey
    Q: When to Go?
    \ MM https://cdn.pixabay.com/photo/2017/07/13/09/04/pyramids-2499780_960_720.jpg
    MM The best time to go to Egypt is surely between October and April. The tourist high season is considered from December to February, so if you come slightly out of season you will also enjoy cheaper hotel prices and fewer crowds. Also, make sure to avoid traveling during Ramadan.
    M. ${tips-visitor}
    --
    
    Q: How Much Does it Cost?
    \ MM https://cdn.pixabay.com/photo/2016/04/21/19/10/egypt-1344318_960_720.jpg
    MM Not much. Egypt is comparatively cheap if you’re coming from a developed nation. For a bed in a dorm, you’ll usually pay about $4, guesthouse would be about $12 per night and a higher standard shouldn’t be more than $150. If you’re backpacking you could get by for $30 a day without any issues.
    M. ${tips-visitor}
    --
    
    Q: Food in Egypt
    \ MM https://cdn.pixabay.com/photo/2015/02/25/17/33/kitchen-649110_960_720.jpg
    MM The most traditional dish – Koshary. It’s a mix of rice, macaroni, and lentils topped with tomato-vinegar sauce and fried onions.
    M. ${tips-visitor}
    --
end-room

