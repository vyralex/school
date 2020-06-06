; Opakovani z podzimniho semestru
;; Stromova rekurze
;;; Zakladni funkce
(defun build-tree (value children)
  (cons value children))

(defun value (tree)
  (car tree))

(defun children (tree)
  (cdr tree))

;;; Nejdelsi cesta ve stromu (obecny)
(defun longest-path (tree)
  (if tree
      (cons (value tree)
            (reduce (lambda (a b) (if (> (length b) (length a)) b a))
                    (mapcar #'longest-path (children tree))
                    :from-end t :initial-value nil))
    '()))

;;; Vratit cele patro stromu (2 argumenty: Strom, index pratra)

(defun get-children-values-by-level (tree index)
  (cond ((null tree)
         '())
        ((<= index 0)
         (cons (value tree) nil))
        (t
         (reduce #'append
                 (mapcar (lambda (trie) (get-children-values-by-level trie (- index 1)))
                         (children tree))))))

; (get-children-values-by-index '(1 (2) (3 (4 (5) (6 (7)))) (8)) 1)

(defun my-find (list elem &key (test #'equal))
  (if list
      (if (funcall test elem (car list))
          elem
        (my-find (cdr list) elem :test test))
    nil))










