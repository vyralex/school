(defun list-len (list)
  (if list
      (+ 1 (list-len (cdr list)))
    0))

(defun koef (&rest a)
  (lambda))