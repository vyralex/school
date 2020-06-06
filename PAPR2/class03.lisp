
(defmacro impl (ant-expr cons-exp)
  (list 'if ant-expr cons-exp 't))

(defmacro impl-2 (ant-expr cons-exp)
  `(if ,ant-expr ,cons-exp t))

(defun impl-fun (ant cons)
  (if ant cons 't))

; 1
(defmacro and-2 (st nd)
  `(when ,st (when ,nd t)))

(defmacro or-2 (st nd)
  `(when ,(NULL st) (when ,nd t)))

; 2
(defmacro if-zero (condition st nd)
  `(if ,(eql 0 (eval condition)) ,st ,nd))

(defmacro if-zero-2 (condition st nd)
  (list 'if (eql 0 (eval condition)) st nd))

; 3
(defmacro my-unless (condition &rest args)
  `(when ,(null (eval condition)) ,@args))

; 4
(defmacro whenb (x condition yes)
  `(let ((x (when ,condition ,yes)))
     ,x))

; 5
(defmacro reverse-progn (&rest args)
  `(progn ,@(reverse args)))

; DEFUN

