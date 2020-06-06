; 1
; makro setf meni aktualni vazbu,
; proto pri zavolani "(test2 1)" se meni vazba jen v prostredi funkce "test1
; a hodnota 2 se vrati pri zavolani "(test1 a)", ale a je porad 1
; pak se vrati a, coz je 1
#|
(defun test1 (a)
  (setf a 2))

(defun test2 (a)
  (test1 a)
  a)
|#

; 2
; v pripade (test4 (list 1)) tomto pripade dojde k podsunuti hodny 2 do prvniho prvku 
; takze vysledek bude (2)
#|
(defun test3 (a)
  (setf (car a) 2))

(defun test4 (a)
  (test3 a)
  a)
|#

; 3
(defun add-val (value list)
  (when list
      (let ((car-val (car list)))
        (if (<= value car-val)
            (setf (car list) value
                  (cdr list) (cons car-val (cdr list)))
          (if (cdr list)
              (add-val value (cdr list))
            (setf (cdr list) (cons value nil))))))
  list)

(defun eql-list (l1 l2)
  (or (not (or l1 l2))
      (and (and l1 l2)
           (eql (car l1) (car l2))
           (eql-list (cdr l1) (cdr l2)))))

(defun delete-val (pair list)
  (when list
    (if (eql-list pair list)
        (setf (car list) (cadr list)
              (cdr list) (cddr list))
      (delete-val pair (cdr list))))
  list)

; 4
(defun merge-sort (list)
  (let* ((len (length list))
         (len/2 (floor (/ len 2)))
         (list2 (nthcdr len/2 list)))
    (if (<= len 1)
        list
      (progn
        (setf (cdr (nthcdr (- len/2 1) list)) nil)
        (merge-lists (merge-sort list) (merge-sort list2))))))

(defun merge-lists (l1 l2)
  (cond ((null l1) l2)
        ((null l2) l1)
        ((<= (car l1) (car l2))
         (cons (car l1) (merge-lists (cdr l1) l2)))
        (t (cons (car l2) (merge-lists l1 (cdr l2))))))

; 6
(defun circlist (&rest list)
  (let ((clist (copy-list list)))
    (setf (cdr (last clist)) clist)))

; 7
#|
(circlist 1 2 3 4) vrati strukturu:

      ┌─────────┐ ┌─────────┐ ┌─────────┐
      │         ↓ │         ↓ │         ↓ 
┌───┬───┐   ┌───┬───┐   ┌───┬───┐   ┌───┬───┐    
│ 1 │ • │   │ 2 │ • │   │ 3 │ • │   │ 4 │ • │
└───┴───┘   └───┴───┘   └───┴───┘   └───┴───┘    
    ↑                                     │
    └─────────────────────────────────────┘
|#

; 8
; '#1=(a #2=((#1# . b) . (c . #2#)))

; 9
(setf *print-circle* t)
(let* ((n2 (cons nil nil))
       (n1 (cons 'a n2))
       (n3 (cons n1 'b))
       (n4 (cons 'c n2)))
  (setf (car n2) n3
        (cdr n2) n4)
  n1)

(let ((x (cons 'a (cons (cons nil 'b) (cons 'c nil)))))
  (setf (cdddr x) (cdr x)
        (caadr x) x))

; 11
(defun circ-find (value clist)
  (labels ((rec (list)
             (when (not (eql clist list))
               (if (eql value (car list))
                   value
                 (rec (cdr list))))))
    (if (eql value (car clist))
        value
      (rec (cdr clist)))))

; 12
(defun struct-find (value clist &optional (visited nil))
  (labels ((rec (list)
             (unless (find (car list) visited)
               (or (and (eql value (car list))
                        value)
                   (and (consp (car list))
                        (struct-find value (car list) (setf visited (cons (car clist) visited))))
                   (rec (cdr list))))))
    (unless (find (car clist) visited)
      (or (and (eql value (car clist))
               value)
          (and (consp (car clist))
               (struct-find value (car clist) (setf visited (cons (car clist) visited)))
          (rec (cdr clist)))))))

; 13
(defun bidir-cons (val prev next)
  (let ((node (cons val (cons prev next))))
    (if prev (setf (cddr prev) node))
    (if next (setf (cadr next) node))
    node))

(defun val (node)
  (car node))

(defun prev (node)
  (cadr node))

(defun next (node)
  (cddr node))
