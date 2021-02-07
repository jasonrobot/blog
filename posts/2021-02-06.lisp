;; This makes it easier to define the macro/function thatll load things

(post
 :title "Testing a lisp-based post format"
 :date "2021-02-06"
 :tags '(testing)
 :body '("Testing, this time writing my posts in lisp because why not, right?"))


; Kinda like this a bit better, but only barely

(post
 (title "Testing a lisp-based post format")
 (date "2021-02-06")
 (tags '(testing))
 '("Testing, this time writing my posts in lisp because why not, right?"))

