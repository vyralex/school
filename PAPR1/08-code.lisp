;Implementace bin stromu
(defun binary-tree-node (val left-child right-child)
  (list val left-child right-child))

(defun left-child (node)
  (cadr node))
(defun right-child (node)
  (caddr node))

;Potomci uzlu
(defun bt-node-children (node)
  (remove nil (cdr node)))

;Funkce vraci hodnotu v uzlu bin. stromu

(defun node-value (tree)
  (car tree))

;Pridani prvku

(defun my-adjoin (elem tree)
  (if (null tree)
      (binary-tree-node elem nil nil)
    (let ((val (node-value tree))
          (left (left-child tree))
          (right (right-child tree)))
      (cond ((= elem val) tree)
            ((< elem val) (binary-tree-node val
                                            (my-adjoin elem left)
                                            right))
            (t (binary-tree-node val
                                 left
                                 (my-adjoin elem right)))))))


#|
Jak bude vypadat vysledek?
(my-adjoin 15 (my-adjoin 5 (my-adjoin 10 NIL)))
|#

#|
UKOL 1
Naprogramujte funkci (bin-tree-height tree), ktera vraci vysku binarniho stromu.
|#
(defun bin-tree-height-rec (tree)
  (if (null tree)
      0
    (let ((l (bin-tree-height-rec (left-child tree)))
          (r (bin-tree-height-rec (right-child tree))))
      (if (>= l r)
          (+ l 1)
        (+ r 1)))))

(defun bin-tree-height (tree)
  (- (bin-tree-height-rec tree) 1))
#|
(my-adjoin 15 (my-adjoin 5 (my-adjoin 10 (my-adjoin 2 NIL))))
(bin-tree-height (my-adjoin 15 (my-adjoin 5 (my-adjoin 10 (my-adjoin 2 NIL)))))
|#

#|
UKOL 1.5
Naprogramujte funkci (tree-height tree), ktera vraci vysku obecneho stromu.
|#
(defun build-tree (value list_of_children)
  (cons value list_of_children))

(defun tree-children (tree)
  (cdr tree))

(defun my-maximum (list max)
  (if list
      (let ((value (tree-height (cdr list))))
        (if (> value max)
            (my-maximum (cdr list) value)
          (my-maximum (cdr list) max)))
    max))

(defun tree-height-rec (children)
  (if children
      (let ((this (tree-height-r (car children)))
            (next (tree-height-rec (cdr children))))
        (if (> this next) this next))
    0))

(defun tree-height-r (tree)
  (if tree
      (+ 1 (tree-height-rec (tree-children tree)))
    0))

(defun tree-height (tree)
  (- (tree-height-r tree) 1))

; (9 (5) (2 (6) (7))) === 2
#|
UKOL 2
Naprogramujte funkci (tree-path tree target-value), ktera vraci cestu k prvku v binarnimu stromu, predpokladejte ze prvek je vzdy pritomen ve strome.

(tree-path (my-adjoin 15 (my-adjoin 5 (my-adjoin 10 (my-adjoin 2 NIL)))) 15)

Cesta vypada napriklad nasledovne (2 10 15)
|#
(defun tree-path (tree value)
  (let ((this_node (node-value tree)))
    (cond ((= this_node value) (cons this_node nil))
          ((> this_node value) (cons this_node (tree-path (left-child tree) value)))
          (t (cons this_node (tree-path (right-child tree) value))))))
#|
UKOL 3
Upravte binarni stromy tak, aby hodnota uzlu mohla byt dvojce hodnot klic/symbol.
|#


#|
(Tezsi ukol)
UKOL 4
Naprogramujte funkci (tree-remove tree target-value), ktera vraci novy binarni strom ze ktereho odstranila zadany prvel.
|#

#|
               a
           /       \
        b             c
      /   \          /  \
    d       e      f      g
   / \     / \    / \    / \
  h   i   j   k  l   m  n   o
|#
;Implementace bin stromu
;binary-tree-node (val left-child right-child)
;left-child (node)
;right-child (node)
;bt-node-children (node)
;node-value (tree)

(defun find-node (tree n)
  (if tree
      (let ((value (node-value tree)))
        (cond ((= value n) tree)
              ((> value n) (find-node (left-child tree) n))
              (t (find-node (right-child tree) n))))
    nil))

(defun remove-node-rec (tree)
  (if tree
      (let ((l (bin-tree-height (left-child tree)))
            (r (bin-tree-height (right-child tree))))
        (cond ((= -1 l r) nil)
              ((> l r) (binary-tree-node (node-value (left-child tree))
                                         (remove-node-rec (left-child tree))
                                         (right-child tree)))
              (t (binary-tree-node (node-value (right-child tree))
                                   (left-child tree)
                                   (remove-node-rec (right-child tree))))))
    nil))

(defun remove-node (tree value)
  (remove-node-rec (find-node tree value)))

(defun most-left-right-child (tree left)
  (if tree
      (let ((child (if left (left-child tree) (right-child tree))))
        (if child
            (most-left-right-child child left)
          tree))
    nil))

(defun remove-node-bin-rec (tree)
  (if tree
      (let ((l (bin-tree-height (left-child tree)))
            (r (bin-tree-height (right-child tree))))
        (if (> l r)
            ))
    nil))

(defun remove-node-bin (tree value)
  (remove-node-bin-rec (find-node tree value)))


#|
(Tezsi ukol)
UKOL 5
Naprogramujte funkci (tree-add-balanced tree value), ktera do vyvazeneho binarniho stromu prida prvek tak aby strom zustal vyvazen.
|#
    

#|
Mnoziny reprezentovane bin. stromem
|#

;Test na prvek
(defun elementp (el tree)
  (if (null tree)
      nil
    (let ((val (node-value tree)))
      (or (= el (node-value tree))
          (and (< el val) (elementp el (left-child tree)))
          (and (> el val) (elementp el (right-child tree)))))))

#|
UKOL 6
Naprogramujte funkci (my-intersection tree1 tree2), ktera provede mnozinovy prunik.
|#

#|
UKOL 7
Naprogramujte funkci (my-difference tree1 tree2), ktera odecte od mnoziny tree1 mnozinu tree2.
|#

#|
UKOL 8
Naprogramujte funkci (my-union tree1 tree2), ktera provede mnozinove sjednoceni.
|# 