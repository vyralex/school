(defun point (x y)
  (cons x y))

(defun point-x (pt)
  (car pt))

(defun point-y (pt)
  (cdr pt))

(defun point-distance (A B)
  (sqrt (+ (expt (- (point-x A) (point-x B)) 2)
           (expt (- (point-y A) (point-y B)) 2))))

(defun right-triangle-p (A B C)
  (let ((a (point-distance B C))
        (b (point-distance C A))
        (c (point-distance A B)))
    (cond ((OR (> a b c) (> a c b))
           (= (expt a 2) (+ (expt b 2) (expt c 2))))
          ((OR (> c b a) (> c a b))
           (= (expt c 2) (+ (expt b 2) (expt a 2))))
          ((OR (> b a c) (> b c a))
           (= (expt b 2) (+ (expt a 2) (expt c 2))))
          (t nil))))

(defun op-vertex (A B)
  (point (/ (+ (point-x A) (point-x B)) 2)
         (/ (+ (point-y A) (point-x B)) 2)))

(defun sum-list (A)
  (if (car A)
      (+ (car A) (sum-list (cdr A)))
    0))

(defun sum-list-iter (A result)
  (if (car A)
      (sum-list-iter (cdr A) (+ result (car A)))
    result))

(defun sum-list-ir (A) (sum-list-iter A 0))

(defun multiply-by (A n)
  (if (car A)
      (cons (* (car A) n)
            (multiply-by (cdr A) n))
    ()))

; z materialu
; 2
(defun op-vertex2 (A B)
  (point (+ (* (point-x B) 2) (point-x A))
         (+ (* (point-y B) 2) (point-y A))))

; 3
;; Struktura ukradnuta z meterialu
(defun fraction (n d)
  (let ((div (gcd n d)))
    (cons (/ n div) (/ d div))))
(defun numer (frac)
  (car frac))
(defun denom (frac)
  (cdr frac))

(defun rozdil (z1 z2)
  (fraction (- (* (numer z1) (denom z2)) (* (numer z2) (denom z1)))
            (* (denom z1) (denom z2))))

; 4
; TODO

; 5
; Konstruktor
(defun interval (a b)
  (cons a b))
; Selektor horni hranice
(defun lower-bound (I)
  (car I))
; Selektor dolni hranice
(defun upper-bound (I)
  (cdr I))
; Je cislo c intervalu
(defun number-in-interval-p (I n)
  (AND (>= n (car I)) (<= n (cdr I)))) 
; prunik
(defun interval-intersection (I J)
  (let ((low (if (> (lower-bound I) (lower-bound J))
                 (lower-bound I)
               (lower-bound J)))
        (up (if (< (upper-bound I) (upper-bound J))
                (upper-bound I)
              (upper-bound J))))
    (if (<= low up)
        (interval low up)
      nil)))
; 6
(defun proper-list-p (A)
  (cond ((consp A) (proper-list-p (cdr A)))
        ((eql A nil) T)
    nil))

; 7
(defun my-make-list-iter (n elem result)
  (if (= n 0)
      result
    (my-make-list-iter (- n 1) elem (cons elem result))))

(defun my-make-list (n elem)
  (my-make-list-iter n elem nil))

; 8
(defun make-ar-seq-list (a d n)
  (if (= n 0)
      ()
    (cons a (make-ar-seq-list (+ a d) d (- n 1)))))

; 9
(defun make-ar-seq-list-iter (a d n result)
  (if (= n 0)
      result
    (make-ar-seq-list-iter (- a d) d (- n 1) (cons a result))))

(defun make-ar-seq-list-ir (a d n)
  (make-ar-seq-list-iter (+ a (* d (- n 1))) d n nil))

; 10
(defun make-geom-seq-list (a q n)
  (if (= n 0)
      ()
    (cons a (make-geom-seq-list (* a q) q (- n 1)))))

; 11
(defun make-geom-seq-list-iter (a q n result)
  (if (= n 0)
      result
    (make-geom-seq-list-iter (/ a q) q (- n 1) (cons a result))))

(defun make-geom-seq-list-ir (a q n)
  (make-geom-seq-list-iter (* a (expt q (- n 1))) q n nil))