(defmacro test-number (number minus zero plus)
  (let ((foo (gensym)))
    `(let ((,foo ,number))
       (cond ((< ,foo 0) ,minus)
             ((= ,foo 0) ,zero)
             ((> ,foo 0) ,plus)))))



(defmacro my-or (&rest args)
  (when args
    `(if ,(car args) T (my-or ,@(cdr args)))))


(defmacro my-or2 (&rest args)
  (when args
    (let ((symbol (gensym "ARGUMENT")))
      `(let ((,symbol ,(car args)))
         (if ,symbol ,symbol (my-or ,@(cdr args)))))))

(defmacro awhen (condition &rest result)
  `(let ((it ,condition))
     (when it ,@result)))

(defmacro test (expr)
  `(format "Vyhodnocováný výraz: ~A" ',expr)
  `(terpri)
  `(print "Hodnota výrazu ~A")
  `(print ,expr))