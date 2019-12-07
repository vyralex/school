(in-package "TURTLE")

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
#|
|
|
| Knihovna TURTLE
|
|
|#
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(capi:define-interface turtle-interface (capi:interface)
  ((poly-desc :accessor poly-desc :initform '())
   (tur-x :initform 0)
   (tur-y :initform 0)
   (tur-phi :initform 0))
  (:panes 
   (main capi:output-pane :resize-callback 'turtle-pane-resize-callback
                          :display-callback 'turtle-pane-display-callback
                          :draw-with-buffer t))
  (:default-initargs :title "Turtle window" :best-width 540 :best-height 415
                     :destroy-callback 'turtle-intf-destroy-callback))

(defvar *turtle-intf* nil)

(defun turtle-pane-transform (p)
  (list 1    0 
        0   -1 
        (/ (capi:simple-pane-visible-width p) 2.0) (/ (capi:simple-pane-visible-height p) 2.0)))

(defun update-turtle-pane-transform (pane)
  (capi:apply-in-pane-process pane
     (lambda ()
       (setf (gp:graphics-port-transform pane) 
             (turtle-pane-transform pane))
       (gp:invalidate-rectangle pane))))

(defun turtle-pane-resize-callback (pane &rest ignore)
  (declare (ignore ignore))
  (update-turtle-pane-transform pane))

(defun turtle-intf-destroy-callback (intf)
  (declare (ignore intf))
  (setf *turtle-intf* nil))

(defun draw-turtle (pane)
  (with-slots (tur-x tur-y tur-phi) (capi:element-interface pane)
    (let ((trans (list 1 0 0 1 0 0)))
      (gp:apply-rotation trans tur-phi)
      (gp:apply-translation trans tur-x tur-y)
      (gp:with-graphics-state (pane :transform trans :foreground :red)
        (gp:draw-polygon pane '(0 -10 0 10 22 0) :filled t)))))

(defun turtle-pane-display-callback (pane &rest ignore)
  (declare (ignore ignore))
  (gp:draw-polygons pane (poly-desc (capi:element-interface pane)))
  (draw-turtle pane))

#|
(capi:display (make-instance 'turtle-interface))
|#

(defun start ()
  (setf *turtle-intf* (capi:display (make-instance 'turtle-interface)))
  t)

(defun check-turtle-intf ()
  (unless *turtle-intf*
    (error "Turtle Window does not exist. Call turtle:start.")))

(defun move (pixels &optional (intf *turtle-intf*))
  (check-turtle-intf)
  (capi:apply-in-pane-process 
     intf
     (lambda ()
       (with-slots (tur-x tur-y tur-phi) intf
         (incf tur-x (* pixels (cos tur-phi)))
         (incf tur-y (* pixels (sin tur-phi))))
       (gp:invalidate-rectangle (slot-value intf 'main)))))

(defun turn (angle &optional (intf *turtle-intf*))
  (check-turtle-intf)
  (capi:apply-in-pane-process 
   intf
   (lambda ()
     (setf (slot-value intf 'tur-phi)
           (nth-value 1 (floor (+ (slot-value intf 'tur-phi) angle) (* 2 pi))))
     (gp:invalidate-rectangle (slot-value intf 'main)))))

(defun draw (pixels &optional (intf *turtle-intf*))
  (check-turtle-intf)
  (capi:apply-in-pane-process 
     intf
     (lambda ()
       (with-slots (tur-x tur-y) intf
         (let ((old-x tur-x)
               (old-y tur-y))
           (move pixels intf)
           (push (list old-x old-y tur-x tur-y) 
                 (slot-value intf 'poly-desc))))
       (gp:invalidate-rectangle (slot-value intf 'main)))))

(defun clear (&optional (intf *turtle-intf*))
  (check-turtle-intf)
  (capi:apply-in-pane-process 
     intf
     (lambda ()
       (with-slots (tur-x tur-y tur-phi poly-desc) intf
         (setf tur-x 0 tur-y 0 tur-phi 0 poly-desc '()))
       (gp:invalidate-rectangle (slot-value intf 'main)))))

(defvar *saved-states* '())

;; Volá se v rámci exkurze, tj. v procesu okna
(defun save-turtle ()
  (with-slots (tur-x tur-y tur-phi) *turtle-intf*
    (push (list tur-x tur-y tur-phi) *saved-states*)))

;; Volá se v rámci exkurze, tj. v procesu okna
(defun restore-turtle ()
  (with-slots (tur-x tur-y tur-phi main) *turtle-intf*
    (setf (values tur-x tur-y tur-phi)
          (apply 'values (pop *saved-states*)))
    (gp:invalidate-rectangle main)))

(defun do-excursion (fun)
  (check-turtle-intf)
  (capi:apply-in-pane-process 
   *turtle-intf*
   (lambda ()
     (save-turtle)
     (funcall fun)
     (restore-turtle))))

(defmacro excursion (&body body)
  `(do-excursion (lambda () ,@body)))

#|
(start)
(turn (* -1/4 pi))
(turn (* 1/4 pi))
(draw 100)
(move 100)

(dotimes (x 10)
  (turn (* 1/20 pi))
  (draw 200)
  (move -200))

(excursion (draw 200)
  (turn (* 1/20 pi))
  (move 100)
  (draw 50))

(clear)

|#