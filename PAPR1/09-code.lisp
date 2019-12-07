; 3
(defun printing-fact (n)
  (terpri)
  (princ "printing-fact aplikován na ")
  (princ n)
  (if (= n 0)
      (progn
        (terpri)
        (princ "printing-fact vrátil ")
        (princ 1))
      (let ((x (* n (printing-fact (- n 1)))))
        (progn
          (terpri)
          (princ "printing-fact vrátil ")
          (princ x)))))

; 4
(defun print-spaces (n)
  (if (not (= n 0))
      (progn
        (princ " ")
        (print-spaces (- n 1)))))

(defun printing-fact-struct-rec (n spaces)
  (progn
    (terpri)
    (print-spaces spaces)
    (princ "printing-fact aplikován na ")
    (princ n)
  (if (= n 0)
      (progn
        (terpri)
        (print-spaces spaces)
        (princ "printing-fact vrátil ")
        (princ 1))
      (let ((x (* n (printing-fact-struct-rec (- n 1) (+ spaces 2)))))
        (progn
          (terpri)
          (print-spaces spaces)
          (princ "printing-fact vrátil ")
          (princ x))))))

(defun printing-fact-struct (n)
  (printing-fact-struct-rec n 0))

; 5
(defun polygon (i n size)
  (if (not (= i n))
      (progn
        (turtle:draw size)
        (turtle:turn (/ (* 2 pi) n))
        (polygon (+ i 1) n size))))

(defun square1 (n size)
  (if (not (= n 0))
      (progn
        (polygon 0 4 size)
        (turtle:draw (/ size 2))
        (turtle:turn pi/4)
        (square1 (- n 1) (/ size (sqrt 2))))))

; 6
(defun binary-tree-node (val left-child right-child)
  (list val left-child right-child))

(defun left-child (node)
  (car (cdr node)))

(defun right-child (node)
  (car (cdr (cdr node))))

(defun create-tree (n)
  (if (> 0 n)
      nil
    (binary-tree-node T (create-tree (- n 1)) (create-tree (- n 1)))))

(defun print-tree-rec (tree size space)
  (let ((length (sqrt (+ (expt size 2)
                         (expt space 2))))
        (angle (atan (/ space size))))
    (progn
      (if (left-child tree)
          (turtle:excursion
            (turtle:turn angle)
            (turtle:draw length)
            (turtle:turn (- angle))
            (print-tree-rec (left-child tree) size (/ space 2))))
      (if (right-child tree)
          (turtle:excursion
            (turtle:turn (- angle))
            (turtle:draw length)
            (turtle:turn angle)
            (print-tree-rec (right-child tree) size (/ space 2)))))))

(defun print-tree2 (tree size)
    (if (left-child tree)
         (turtle:excursion
           (turtle:turn pi/4)
           (turtle:draw size)
           (turtle:turn -pi/4)
           (print-tree2 (left-child tree) (* 3/4 size))))
     (if (right-child tree)
         (turtle:excursion
           (turtle:turn -pi/4)
           (turtle:draw size)
           (turtle:turn pi/4)
           (print-tree2 (right-child tree) (* 3/4 size)))))

(defun print-tree (tree)
  (turtle:turn pi/2)
  (turtle:move 450)
  (turtle:turn pi)
  (print-tree-rec tree 100 430))

;(turtle:start)
;(print-tree '(T (T (T NIL NIL) (T NIL NIL)) (T (T NIL NIL) (T NIL NIL))))

;(print-tree (create-tree 6) 100)