(defsystem "jasonrobot-test"
  :defsystem-depends-on ("prove-asdf")
  :author "Jason Howell"
  :license ""
  :depends-on ("jasonrobot"
               "prove")
  :components ((:module "tests"
                :components
                ((:test-file "jasonrobot"))))
  :description "Test system for jasonrobot"
  :perform (test-op (op c) (symbol-call :prove-asdf :run-test-system c)))
