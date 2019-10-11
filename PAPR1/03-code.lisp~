; Na prednasce se probiraly halavne prostredi
; Existuje globalni prostredi (pro nas zatim lisener)
; prostredi je "seznam promenych a fci", ktere muzu v danem prostredi pouzit
; pokud volam fci tak si vytvory vlastni prostedi, ktere ma predka globalni prostedi
; pokud neni promenna/fce definovana v aktualnim prostredi, odkazuji se na jeho predchudce
; prostredi si muzu vytvorit fci let 
; (let (<sezanmy s prirazenim>) (<vypocet>))
; napr:  (let (a x) (+ a 1))    --- x se vyhodnoti v globalnim prostredi a pripradi se do a v novem
;                               --- nastavim nove "let" prostredi jako to aktualni
;                               --- vypocet se provede v novem prostredi

(defun power-rec (a n result)
    (if (= n 0) result
                (power-rec a (- n 1) (* result a))
    )
)
; vypocita a^n
(defun power (a n)
    (power-rec a n 1)
)
; trojuhelnikova nerovnost
(defun trianglep (a b c)
    (let ((x (< a (+ b c)))
          (y (< b (+ c a)))
          (z (< c (+ a b))))
        (if x (if y z nil))))
; Obsah trojuhelniku
(defun heron-cart (a b c)
    (let ((s (/ (+ a b c) 2)))
        (sqrt (* s (- s a) (- s b) (- s c)))))


  