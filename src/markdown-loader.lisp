(in-package :cl21-user)
(defpackage jasonrobot.markdown
  (:use :cl
        :cl-markdown)
  (:import-from :cl-markdown
                :markdown)
  (:export :render-md))
(in-package :jasonrobot.view)


(defun render-md (path)
  (multiple-value-bind
        (--doc html-string)
      (cl-markdown:markdown (merge-pathnames *default-pathname-defaults* path) :stream nil)
    html-string))
