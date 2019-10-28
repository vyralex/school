; 1
; fci nelze prepsat - dojde k zacykleni


; 2
(defun power2 (a) (* a a))

(defun fast-power-iter (a n result)
  (cond ((= n 0) result)
        ((evenp n) (fast-power-iter (* a a) (/ n 2) result))
        (t (fast-power-iter a (- n 1) (* a result)))))

(defun fast-power (a n)
  (fast-power-iter a n 1))


; 3
(defun dividesp (a b)
  (cond ((= a 0) t)
        ((< a 0) nil)
        (t (dividesp (- a b) b))))

; 4
(defun remainder (a b)
  (if (< a b)
      a
    (remainder (- a b) b)))

; 5
(defun primep-iter (a n)
  (cond ((= a n) t)
        ((= (remainder a n) 0) nil)
        (t (primep-iter a (+ n 1)))))

(defun primep (a)
  (if (> a 1)
      (primep-iter a 2)
    nil))

; 6
(defun soucet-delitelu-rec (a n)
  (if (= a n)
      0
    (if (dividesp n a)
        (+ n (soucet-delitelu-rec a (+ n 1)))
      (soucet-delitelu-rec a (+ n 1)))))

(defun perfectp (a)
  (= (soucet-delitelu-rec a 1) a))

; 7
(defun pascal (x y)
  (cond ((= y 0) 1)
        ((= x y) 1)
        (t (+ (pascal (- x 1) y)
              (pascal (- x 1) (- y 1))))))