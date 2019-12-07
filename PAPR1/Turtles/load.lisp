(in-package "CL-USER")

(defsystem turtles ()
  :members ("package" "constants" "turtles")
  :rules ((:compile :all 
           (:requires (:load :previous)))))

(compile-system 'turtles :load t)