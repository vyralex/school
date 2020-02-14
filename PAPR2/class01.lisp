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
(defun maximum (list)
  (reduce (lambda (max n) (if (> n max) n max)) list :initial-value 0))

(defun all-children (&rest childs)
  (if childs
      (cons (get-lengths (car childs)) (all-children))
    nil))

(defun get-lengths (tree)
  (if tree
      (let* ((ch (all-children (children tree)))
             (max (maximum ch)))
        (cons (+ max 1) ch))
      (build-tree 0 nil)))

;;; Vratit cele patro stromu (2 argumenty: Strom, index pratra)

(defun get-children-values-by-index (tree index)
  (cond ((null tree)
         '())
        ((= index 0)
         (value tree))
        (t
         (reduce (lambda (a b) (if a (cons a b) b))
                 (mapcar 
                  (lambda (trie) (get-children-values-by-index trie (- index 1)))
                  (children tree))
                 :from-end t :initial-value nil))))
; (get-children-values-by-index '(1 (2) (3 (4 (5) (6 (7)))) (8)) 1)










