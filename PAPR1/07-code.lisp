; Odevzdat do 12.11.
; 01
(defun last-pair (list)
  (if (cdr list)
      (last-pair (cdr list))
    list))

; 02
(defun my-copy-list (list)
  (if (null (car list))
      ()
    (cons (car list) (my-copy-list (cdr list)))))

; 03
(defun equal-lists-p (list1 list2)
  (OR (not (car list1))
      (not (car list2))
      (and (eql (car list1) (car list2))
           (equal-lists-p (cdr list1) (cdr list2)))))

; 04
(defun my-remove (list x)
  (if (car list)
      (if (eql (car list) x)
          (my-remove (cdr list) x)
        (cons (car list) (my-remove (cdr list) x)))
    ()))

; 05 ----- Poznamka: 0 vrati puvodni list
(defun remove-nthcdr (list n)
  (if (OR (= n 0) (not (car list)))
      ()
    (cons (car list) (remove-nthcdr (cdr list) (- n 1)))))

; 06
(defun each-other-rec (list return)
  (if (car list)
      (if return
          (cons (car list) (each-other-rec (cdr list) (not return)))
        (each-other-rec (cdr list) (not return)))))
;  (AND (car list)
;       (OR return
;           (each-other-rec (cdr list) (not return)))
;       (cons (car list) (each-other-rec (cdr list) (not return)))))

(defun each-other (list)
  (each-other-rec list t))

; 07

;(defun factorials-iret (a n result)
;  (if (= n 0)
;      (cons 0 result)
;    (factorials-iret (/ a (- n 1)) (- n 1) (cons a result))))


(defun factorials-rec (a n stop)
  (if (= n stop)
      ()
    (cons (* a n) (factorials-rec (* a n) (+ n 1) stop))))

(defun factorials (n)
  (cons 1 (factorials-rec 1 1 n)))

; 08
(defun fib-list-rec (a b n)
  (if (= n 0)
      ()
    (cons (+ a b) (fib-list-rec b (+ a b) (- n 1)))))

(defun fib-list (n)
  (if (<= n 0)
      ()
    (fib-list-rec 1 0 n)))

; 09
(defun list-tails (list)
  (if (car list)
      (cons list (list-tails (cdr list)))
    (cons nil nil)))

; 10
(defun list-sum-iter (list sum)
  (if (car list)
      (list-sum-iter (cdr list) (+ sum (car list)))
    sum))

(defun list-sum (list)
  (list-sum-iter list 0))

; 11
(defun subtract-lists-2 (list1 list2)
  (if (car list1)
      (cons (- list1 list2) (subtract-list2 (cdr list1) (cdr list2)))))

; 12
(defun scalar-product (list1 list2)
  (if (car list1)
      (cons (* (car list1) (car list2))
            (scalar-product (cdr list1) (cdr list2)))
    ()))

; 13
(defun vector-length-iter (list result)
  (if (car list)
      (vector-length-iter (cdr list)
                          (sqrt (+ (expt (car list) 2)
                                   (expt result 2))))
    result))

(defun vector-length (list)
  (vector-length-iter list 1))

; 14
(defun elem (a list)
  (if (car list)
      (if (= a (car list))
          t
        (elem a (cdr list)))
    nil))

(defun my-remove-duplicates (list)
  (if (car list)
      (if (elem (car list) (cdr list))
          (my-remove-duplicates (cdr list))
          (cons (car list) (my-remove-duplicates (cdr list))))
    ()))

; 15
(defun my-union (list1 list2)
  (if (car list1)
      (cons (car list1) (my-union (cdr list1) list2))
    list2))

; 16 - kdyz seznamy nejprve setridim tak je pak budu moct porovnat prvek po prvku
; tim padem ziskam ze slozitosti O(n^2) slozitost O(n*log(n))
; Toto neni exektivni pro male seznamy
(defun merge-lists (l1 l2)
  (cond ((null l1) l2)
        ((null l2) l1)
        ((<= (car l1) (car l2))
         (cons (car l1) (merge-lists (cdr l1) l2)))
        (t (cons (car l2) (merge-lists l1 (cdr l2))))))

(defun merge-sort (list)
  (let* ((len (length list))
         (len/2 (floor (/ len 2)))
         (list2 (nthcdr len/2 list))
         (list1 (ldiff list list2)))
    (if (<= len 1)
        list
      (merge-lists (merge-sort list1) (merge-sort list2)))))

(defun  equal-sets-p-rec (list1 list2)
  (or (and (null (car list1))
           (null (car list2)))
      (and (eql (car list1) (car list2))
           (equal-sets-p-rec (cdr list1) (cdr list2)))))

(defun  equal-sets-p (list1 list2)
  (equal-sets-p-rec (merge-sort list1) (merge-sort list2)))

; 17
(defun proper-list-p (x)
  (or (null x)
      (and (consp x)
           (proper-list-p (cdr x)))))

(defun flatten-iter (list result)
  (if (car list)
      (if (proper-list-p (car list))
          (flatten-iter (cdr list) (my-union (flatten-iter (car list) nil) result))
        (flatten-iter (cdr list) (cons (car list) result)))
    result))

(defun flatten (list)
  (reverse (flatten-iter list nil)))

; 18
(defun deep-reverse-iter (list result)
  (if (car list)
      (if (proper-list-p (car list))
          (deep-reverse-iter (cdr list) (cons (deep-reverse-iter (car list) nil) result))
        (deep-reverse-iter (cdr list) (cons (car list) result)))
    result))

(defun deep-reverse (list)
  (deep-reverse-iter list nil))



