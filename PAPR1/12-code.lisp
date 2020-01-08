;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;
;;;; Paradigmata programování 1, přednáška 12
;;;;
;;;; Interpret jednoduchého Scheme (Simple Scheme) v Lispu
;;;;

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;
;; Vstupní bod: funkce ss-eval
;;

;; symbol t reprezentuje globální prostředí
(defun ss-eval (expr)
  (ss-eval-env expr t))

(defun ss-eval-env (expr env)       
  (if (compound-expr-p expr)        
      (eval-compound-expr expr env) 
    (eval-atom expr env)))

(defun compound-expr-p (expr)
  (consp expr))


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;
;; Prostředí
;;

;; konstruktor make-env vytváří prostředí ze seznamu vazeb (párů) a předka
(defun make-env (bindings parent)
  (list 'env bindings parent))

;; konstruktor  make-env-sv vytváří prostředí ze seznamu symbolů, seznamu hodnot 
;; a předka
(defun make-env-sv (symbols values parent)
  (make-env (mapcar #'cons symbols values)
            parent))


;; selektory
;; get-env překládá symbol t na globální prostředí
(defun get-env (spec)
  (if (eql spec t) (initial-env) spec))

(defun env-bindings (env)
  (cadr (get-env env)))

(defun env-parent (env)
  (caddr (get-env env)))

;; přidání vazby k prostředí
(defun add-binding (env symbol value)
  (make-env (cons (cons symbol value) (env-bindings env))
            (env-parent env)))

;; globální (počáteční) prostředí
(let ((env (make-env (list (cons 'zero 0) (cons '+ #'+) 
                           (cons '* #'*) (cons '= #'=)
                           (cons 'cons #'cons))
                     nil)))

  (defun initial-env ()
    env)

  (defun set-initial-env (value)
    (setf env value)))



;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;
;; Hodnota symbolu v prostředí
;;

(defun findf (fun list)
  (cond ((null list) nil)
        ((funcall fun (car list)) (car list))
        (t (findf fun (cdr list)))))

;; hledání vazby symbolu symbol-binding-1 hledá jen v daném prostředí,
;; symbol-binding i v předcích
(defun symbol-binding-1 (symbol env)
  (findf (lambda (cons)
           (eql (car cons) symbol))
         (env-bindings env)))

(defun symbol-binding (symbol env)
  (let ((bnd (symbol-binding-1 symbol env)))
    (if (consp bnd)
        bnd
      (symbol-binding symbol (env-parent env)))))

;; hodnota symbolu v prostředí: nejprve se najde jeho vazba a pak pomocí
;; cdr její hodnota
(defun sym-value (symbol env)
  (cdr (symbol-binding symbol env)))


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;
;; Vyhodnocení atomů
;;

(defun eval-atom (atom env) 
  (if (symbolp atom)        
      (sym-value atom env)  
    atom))


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;
;; Vyhodnocení složených výrazů
;;

;; jde-li o výraz se speciálním operátorem, vyhodnotíme na základě pravidel
;; příslušného operátoru; jinak zavoláme eval-application - vyhodnocení
;; obecné aplikace
(defun eval-compound-expr (expr env)
  (let ((op (car expr))
        (args (cdr expr)))                            
    (cond ((eql op 'quote) (eval-quote args))         
          ((eql op 'if) (eval-if args env))           
          ((eql op 'define) (eval-define args))       
          ((eql op 'lambda) (eval-lambda args env))
          ((eql op 'progn) (eval-progn args env))
          ((eql op 'let) (eval-let args env))
          ((eql op 'let*) (eval-let* args env))
          (t (eval-application op args env)))))


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;
;; Aplikace procedury
;;

;; procedura vzniklá vyhodnocením operátoru se aplikuje na hodnoty vzniklé
;; vyhodnocením argumentů:
(defun eval-application (op args env)
  (apply-proc (ss-eval-env op env)
              (eval-list-elements args env)))

(defun eval-list-elements (list env)
  (mapcar (lambda (el) (ss-eval-env el env))
          list))

;; aplikace procedury se liší podle toho, zda jde o primitivum, nebo o 
;; uživatelsky definovanou proceduru:
(defun apply-proc (proc args)      
  (if (primitivep proc)            
      (apply-primitive proc args)  
    (apply-user-proc proc args)))

;; primitivum je prostě funkce Lispu (predikát functionp rozhoduje, zda
;; je argument funkce, nebo něco jiného):
(defun primitivep (proc)
  (functionp proc))

;; aplikace primitiva je prostě aplikace lispové funkce:
(defun apply-primitive (proc args) 
  (apply proc args))


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;
;; Uživatelsky definované procedury
;;

;; uživatelsky definovanou proceduru reprezentujeme datovou strukturou
;; konstruktor:
(defun make-proc (params body env)
  (list 'proc params body env))

;; selektory:
(defun proc-params (proc)
  (cadr proc))

(defun proc-body (proc)
  (caddr proc))

(defun proc-env (proc)
  (cadddr proc))

;; vahodnocení lambda-výrazu znamená vytvoření procedury:
(defun eval-lambda (args env)
  (make-proc (car args) (cadr args) env))

;; aplikace uživatelské procedury přesně podle vyhodnocovacího procesu:
(defun apply-user-proc (proc args)
  (ss-eval-env (proc-body proc)
               (make-env-sv (proc-params proc) 
                            args
                            (proc-env proc))))


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;
;; Speciální operátory quote, if, define
;;

(defun eval-quote (args) 
  (car args))

(defun eval-if (args env)             
  (if (ss-eval-env (car args) env)    
      (ss-eval-env (cadr args) env)   
    (ss-eval-env (caddr args) env)))

(defun eval-define (args) 
  (set-initial-env        
   (add-binding t (car args) (ss-eval (cadr args))))
  (car args))


(defun eval-progn (args env)
  (car (last (eval-list-elements args env))))

(defun eval-let (args env)
  (apply-user-proc (make-proc (mapcar #'car (car args))
                              (cadr args)
                              env)
                   (mapcar #'ss-eval (mapcar 'cadr (car args)))))

(defun eval-let* (args env)
  (if (car args)
      (eval-let (list (cons (caar args) nil)
                      (eval-let* (list (cdar args) (cadr args)) env))
                env)
    (cadr args)))

#|

;; Testy:

;; Můžete každý řádek zkopírovat do Listeneru a vyhodnotit, nebo
;; vyhodnocovat přímo tady pomocí F8.

(ss-eval 1)
(ss-eval '(if 1 2 3))
(ss-eval 'zero)
(ss-eval '(define a 10))
(ss-eval 'a)

;; Problém (vyřešit na cvičení):
(ss-eval 'x)

(ss-eval '(define fact (lambda (n)
                         (if (= n 0)
                             1
                           (* n (fact (+ n -1)))))))
                         
(ss-eval '(fact 5))

|#


