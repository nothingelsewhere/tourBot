\ Words to help develop quizzes
\ 

module *private

1 => QUESTION-NUMBER
# => QUESTION-DATA
# => ALL-QUESTIONS
# => ALL-ANSWERS

\ Wraps the image, if it exists.
: mk-img ( "img-url" -- "s" )
    trim dup length 0 <= -> exit |. ctx{ url }
    q{
        <img style="width: 95%" src="#{url}"</img>
    }q
;

\ Formats the question.
: mk-question-body ( "msg" "img-url" -- "s" )
    QUESTION-NUMBER ctx{ num }
    mk-img ctx{ msg img } q{
        <h5 style="background: #FFFACF; border: 1px solid #FFFACF; display: inline; padding: .5rem .9rem; border-radius: 50%; color: #8190C7;">#{num}</h5>
        <p style="margin-top: 1rem; text-align: justify;">#{msg}</p>
        #{img}
    }q
;

: mk-question-body ( # -- "s" ) { h }
    "question" h #@ 
    "img" h #@ dup null? -> drop "" |.
        mk-question-body
;

: mk-question-ans ( seq -- "s" ) 
    "" swap [: button concat  " " concat ;] reduce 
;

: mk-question-ans ( # -- "s" )
    "answer" swap #@ reverse mk-question-ans
;

: mk-question ( # -- "s" ) { h }
    h mk-question-body 
    h mk-question-ans
        ctx{ body ans }
    q{
        <div>#{body}</div>
        <div style="display:grid;grid-template-columns:100%;">#{ans}</div>
    }q
;

: mk-question ( n # -- ) { n h }
    n 
    h mk-question
        ALL-QUESTIONS #!
;

: mk-correct-answer ( n # -- )
    "correct" swap #@ dup null? if
        drop 
        "Warning: Question" . . "has no answer" . cr 
        exit
    then
    ALL-ANSWERS #!
;

: line ( |s -- "s" ) 
    [char] \n parse trim
;

: qdata ( "s" -- ) 
    line QUESTION-DATA #!
;

\ ---------------------------  Exported words

: IMG: ( |s -- ) "img" qdata ;

\ Questions can be multi-line
: QQ ( |s -- )
    line { l } 
    "question" QUESTION-DATA #@ dup null? -> drop "" |. 
    bl concat l concat trim 
    "question" swap QUESTION-DATA #!
;

: (AA) ( "s" --  ) { l }
    "answer" QUESTION-DATA #@ dup null? -> drop nil |.
    l cons 
    "answer" swap QUESTION-DATA #!
;

\ Answers are single line!
: AA ( |s --  ) 
    line (AA)
;

\ The correct answer. Only one is allowed! 
: AA) ( |s -- ) 
    line { l } 
    l (AA)
    "correct" l QUESTION-DATA #!
;

\ Completes a question.
: ***
    QUESTION-NUMBER QUESTION-DATA mk-question
    QUESTION-NUMBER QUESTION-DATA mk-correct-answer
    \ increment the question number
    QUESTION-NUMBER 1+ ['] QUESTION-NUMBER !  
    \ reset the question data
    # ['] QUESTION-DATA !
;

: question ( n -- "s" ) 
    ALL-QUESTIONS #@
;

: correct? ( n "s" -- f ) ucase { n a } 
    n ALL-ANSWERS #@ dup null? -> drop false exit |. ucase
    a same? 
;

: num-questions ( -- n ) 
    ALL-QUESTIONS #size
;

: answer-for ( n -- "s" ) 
   ALL-ANSWERS #@ dup null? -> drop "No such question" exit |.
;

end-module


\ -------------------- Exported Words ---------------------
with *private 
' QQ alias QQ
' AA alias AA
' *** alias ***
' IMG: alias IMG: 
' question alias question
' AA) alias AA)
' correct? alias correct?
' num-questions alias num-questions
' answer-for alias answer-for
end-with 
forget *private
