; 1
; vyraz vytiskne 2 a vrati 1 (setf zmeni vazbu jen v druhem let)

; 2
(defmacro my-insf (x &optional (i 1))
  `(setf ,x (+ ,x ,i)))

; 3
(defmacro swap (a b)
  (let ((s (gensym)))
    `(let ((,s ,a))
       (setf ,a ,b)
       (setf ,b ,s))))

; 4
#|(defun make-point (x y)
  (lambda (fun &optional val)
    (case fun
      (x x)
      (y y)
      (set-x (setf x val))
      (set-y (setf y val)))))
|#
; 5
(defun point-distance (p1 &optional (p2 (make-point 0 0)))
  (let ((x1 (funcall p1 'x))
        (y1 (funcall p1 'y))
        (x2 (funcall p2 'x))
        (y2 (funcall p2 'y)))
    (sqrt (+ (expt (- x1 x2) 2)
             (expt (- y1 y2) 2)))))

; 6
(defun make-circle (&optional (center (make-point 0 0)) (radius 1))
  (lambda (fun &optional val)
    (case fun
      (radius radius)
      (center center)
      (set-radius (setf radius val)))))

; 7
(defun circle-area (circle)
  (* pi (expt (funcall circle 'radius) 2)))

; 8
(defun pointp (point)
  (when (and (functionp point)
             (funcall point 'x)
             (funcall point 'y))
    t))

(defun circlep (circle)
  (when (and (functionp circle)
             (funcall circle 'center)
             (funcall circle 'radius))
    t))

; 9
(defun circle-move (circle x y)
  (let ((center (funcall circle 'center)))
    (funcall center 'set-x (+ x (funcall center 'x)))
    (funcall center 'set-y (+ y (funcall center 'y))))
  circle)

