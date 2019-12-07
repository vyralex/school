 

(defun nth-power (a n)
  (labels ((iter (a n result)
             (if (= n 0)
                 result
               (power-iter a (- n 1) (* a result)))))
    (iter a n 1)))


#|
(defun my-make-list-iter (n elem result)
  (if (= n 0)
      result
    (my-make-list-iter (- n 1) elem (cons elem result))))

(defun my-make-list (n elem)
  (my-make-list-iter n elem nil))
|#

(defun my-make-list (n elem)
  (labels ((iter (n elem result)
             (if (= n 0)
                 result
               (iter (- n 1) elem (cons elem result)))))
    (iter n elem nil)))

(defun foldr (fun list init)
  (if (null list)
      init
    (funcall fun (car list) (foldr fun (cdr list) init))))

(defun my-length (list)
  (labels ((new-fun (param result) (+ 1 result)))
    (foldl #'new-fun list 0)))

(defun divide-by-2 (list)
  (labels ((new-fun (param)
             (/ param 2)))
    (mapcar #'new-fun list)))

(defun sum-pairs (list)
  (if list
      (cons (+ (caar list) (cdar list)) (sum-pairs (cdr list)))
    nil))

; member-t
(defun member-t (x list test)
  (cond ((null list) nil)
        ((funcall test x (car list)) list)
        (t (member-t x (cdr list) test))))
; member-f
(defun member-f (pred list)
  (cond ((null list) nil)
        ((funcall pred (car list)) list)
        (t (member-f pred (cdr list)))))

#|
(defun my-mapcar (fun list)
  (if (null list)
      '()
    (cons (funcall fun (car list))
          (my-mapcar fun (cdr list)))))
|#

(defun my-mapcar (fun list)
  (labels ((in-fold (param result)
             (cons (funcall fun param) result)))
    (foldr #'in-fold list nil)))

(defun power2 (a)
  (* a a))

(defun foldl (fun list init)
  (labels ((iter (fun list result)
             (if list
                 (iter fun (cdr list) (funcall fun (car list) result))
               result)))
    (iter fun list init)))

(defun foldl2 (fun list init)
  (foldl2 fun (cdr list) (funcall fun (car list) init)))