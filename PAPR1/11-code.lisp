; 5
(defun mem (seq index)
  (funcall seq index))

(defun accumulate (seq from to combiner null-val)
  (if (< to from)
      null-val
    (funcall combiner
             (mem seq from)
             (accumulate seq (1+ from) to combiner null-val))))

(defun foo ()
  (accumulate (lambda (a) (* a a)) 1 5 #'(lambda (a b) (if (> b a) b a)) -10000))

; 6
(defun constant-seq-p (fun n)
  (not (null (accumulate fun 0 (- n 2) #'(lambda (x y) (if (eql x y) x nil)) (funcall fun (- n 1))))))

; 7
(defun increasing-seq? (fun n)
  (not (null (accumulate fun 0 (- n 2) #'(lambda (x y) (if y (if (< x y) x nil) nil)) (funcall fun (- n 1))))))

; 8
(defun print-sequence (seq)
  (labels ((iter (index)
             (if (>= index 20)
                 (princ "... ")
               (progn (princ (mem seq index))
                 (princ ", ")
                 (iter (1+ index))))))
    (iter 0)
    nil))

(defun even-members (fun)
  (lambda (index) (funcall fun (* index 2))))

; 9
(defun my-print-table (tbl)
  (labels ((iter (fun row column)
             (if (> row 9)
                 nil
               (if (> column 9)
                   (progn
                     (terpri)
                     (iter fun (+ row 1) 0))
                 (progn
                   (princ (funcall fun row column))
                   (princ " ")
                   (iter fun row (+ column 1)))))))
    (iter tbl 0 0)))

(defun zero-row-p (fun row)
  (eql 0 (accumulate (lambda (column) (funcall fun row column))
                     0
                     8
                     #'(lambda (x y) (if (eql x y) x nil)) 
                     (funcall fun row 9))))

; 10
(defun transpose-table (tbl)
  (lambda (row column) (funcall tbl column row)))


