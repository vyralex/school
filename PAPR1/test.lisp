(defun build-tree (value children)
  (cons value children))

(defun value (node)
  (car node))

(defun children (node)
  (cdr node))

(defun serch-children (child n)
  (if child
      (let ((a (find-path (car child) n)))
        (if a a (serch-children (cdr child) n)))
    nil))

(defun find-path (tree n)
  (if tree
      (if (= n (value tree))
          (cons n nil)
        (let ((a (serch-children (children tree) n)))
          (if a (cons (value tree) a) nil)))
    nil))

#|
(setf new-tree
      (build-tree 0
                  (list (build-tree 1
                                    (list (build-tree 3
                                                      (list (build-tree 7 nil)
                                                            (build-tree 8 nil)))
                                          (build-tree 4
                                                      (list (build-tree 9 nil)
                                                            (build-tree 10 nil)))))
                        (build-tree 2
                                    (list (build-tree 5
                                                      (list (build-tree 11 nil)
                                                            (build-tree 12 nil)))
                                          (build-tree 6
                                                      (list (build-tree 13 nil)
                                                            (build-tree 14 nil))))))))
|#

