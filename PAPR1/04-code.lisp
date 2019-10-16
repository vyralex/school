; Při volání (percentage-2 100000 t)
; Máme globální prostředí (1), v něm není žádná námi definovaná proměnná
; Vytvoří se prostředí při aplikaci fce percentage-2 (2), kde máme definováno (part 100000; whole T)
; Zavolá se fce let, která vyhodnotí (eql whole T) v prostředí (2) a vytvoří se nové prostředí (3) s proměnými (whole = 1066841)
; V prostředí (3) se vypočítá (* (/ part whole) 100.0)))


(defun percentage-2 (part whole)
  (let ((whole (if (eql whole t)
                   10668641
                 whole)))
    (* (/ part whole) 100.0)))


;;;  5
(defun ellipse-area (a b)
  (* pi a b))

(defun ellipse-area-2 (a b)
  (let ((b (if (eql b t)
               a
             b)))
    (* a b pi)))

(defun ellipse-area-3 (a b)
  (ellipse-area a (if (eql b t) a b)))


(defun  ellipse-area-4 (a b)
  (if (eql b t)
      (ellipse-area-4 a a)
    (* a b pi))) 

;;; 6
(defun squarep (n)
  (= (round (sqrt n))  (sqrt n)))

;;; 8
(defun fce (x)
  (/ (+ x (/ 1 x)) 2))

(defun foo (x)
  (let ((y (fce x)))
    (if (and (> x (- y 0.0001)) (< x (+ y 0.0001)))
        (* x 1.0)
      (foo y))))

;;; 9
(defun sum-all (a b)
  (if (> a b)
      0      
    (+ a (sum-all (+ a 1) b)))) 


;;; 10
(defun sum-all-iter (a b result)
  (if (= a b)
      (+ result a)
    (sum-all-iter (+ a 1) b (+ result a))))

(defun sum-all-1 (a b)
  (sum-all-iter a b 0))

;;; 11
(defun power-iter (a n result)
    (if (= n 0)
        result
        (power-rec a (- n 1) (* result a))))

(defun power (a n)
    (power-rec a n 1))

;;; 12
(defun pi-iter (a i result)
  (if (= i 0)
      result
    (pi-iter (if (< a 0)
                 (* (- a 2) -1)
               (* (+ a 2) -1))
             (- i 1)
             (+ result (/ 1 a)))))

(defun pi-lebn (n)
  (* (pi-iter -3 (- n 1) 1) 4.0))