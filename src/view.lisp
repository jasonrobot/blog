(in-package :cl-user)
(defpackage jasonrobot.view
  (:use :cl
        :cl-markup)
  (:import-from :jasonrobot.config
                :*template-directory*)
  (:import-from :caveman2
                :*response*
                :response-headers)
  (:import-from :datafly
                :encode-json)
  (:export :render-page
           :render-json
           :render-cl-markup
           :render-post-directory))
(in-package :jasonrobot.view)

(defvar head
  '(:head
    (:link :rel "stylesheet" :href "/css/main.css")))

(defvar header
  '(:div :id "header"
    (:div :class "title" "test page!")
    "is this thing on?"))

(defun render-page (content)
  "Render a page with CONTENT after a header."
  (markup*
   head
   (list
    :body
    header
    (render-post-directory)
    content)))

(defun render-post-directory ()
  (let ((links (mapcar (lambda (x) `(:li (:a :href ,(pathname-name x) ,(pathname-name x))))
                       (directory "../posts/*.lisp"))))
    `(:ul
      ,@links)))
  ;; (print (directory "../posts/*.lisp"))
  ;; '(:div "done"))

(defun render-json (object)
  (setf (getf (response-headers *response*) :content-type) "application/json")
  (encode-json object))

(defun render-cl-markup (filepath)
  "Take cl-markup input from a file."
  ;; load the file to lisp object
  (with-open-file (markup-file filepath)
    (let ((cl-markup (read markup-file)))
      ;; pass it along to markup
      (render-page cl-markup))))

;;
;; Execute package definition
