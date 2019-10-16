;; Obsah trojuhelniku = (a * v) / 2
(defun STriangle (a v) (* 1/2 a v))
;; TEST
;(= (STriangle 0 10) 0)
;(= (STriangle 1 10) 5)
;(= (STriangle 2 10) 10)
;(= (STriangle 3 10) 15)
;(= (STriangle 4 10) 20)
;(= (STriangle 5 10) 25)
;(= (STriangle 6 10) 30)
;(= (STriangle 7 10) 35)
;(= (STriangle 8 10) 40)
;(= (STriangle 9 10) 45)



(defun powerRec (a n result)
  (if (> n 0)
      (powerRec a (- n 1) (* result a))
      result))

(defun power (a n)
  (powerRec a n 1))




(defun sqrtRec (a n result x) 
  (if (> n 0)
      (if (= (* result result) a)
          result
          (if (> (* result result) a)
              (sqrtRec a (- n 1) (- result x) (/ x 2))
                                      (sqrtRec a (- n 1) (+ result x) (/ x 2))))
                            result))
    
(defun sqr (a) (sqrtRec a 100 (/ a 2) (/ a 4)))

(defun hypotenuse (a b) (sqr (+ (* a a) (* b b))))

(defun signuma (a) (if (= a 0) 0 (if (> a 0) 1 -1)))

(defun findMinRec (arr n i minimum) (if (= i n) minimum
                                                (if (< (aref arr i) minimum) (findMinRec arr n (+ i 1) (aref arr i))
                                                                             (findMinRec arr n (+ i 1) minimum))))

(defun findMin (arr n) (if (= n 0) nil (findMinRec arr n 1 (aref arr 0))))

(defun my-positive (a) (> a 0))

