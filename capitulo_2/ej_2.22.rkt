#lang racket

#|
Hecho por:
EZQUERRA CEBALLOS, CARLOS
FERNÁNDEZ RIVERA, CRISTIAN MANUEL
GOMEZ GARCIA, GABRIEL
MUÑOZ FERNANDEZ, PAULA

Exercise 2.22: Louis Reasoner tries to rewrite the first square-list procedure of
Exercise 2.21 so that it evolves an iterative process:

(define (square-list1 items)
  (define (iter things answer)
    (if (null? things)
        answer
        (iter (cdr things)
              (cons (square (car things))
                    answer))))
  (iter items nil))

Unfortunately, defining square-list this way produces the answer list in the reverse
order of the one desired. Why?

Louis then tries to fix his bug by interchanging the arguments to cons:

(define (square-list2 items)
  (define (iter things answer)
    (if (null? things)
        answer
        (iter (cdr things)
              (cons answer
                    (square
                     (car things)))))
   (iter items nil)))
|#

(define (square x) (* x x))

(define (square-list1 items)
  (define (iter things answer)
    (if (null? things)
        answer
        (iter (cdr things)
              (cons (square (car things)) answer))))
  (iter items null))

(square-list1 (list 1 2 3 4 5))

; Respuesta: El problema de la primera solución que da Louis es que el cons de (cons (square (car things)) answer))))
; agrega un elemento al frente de la lista, por lo que la lista queda en un orden inverso al deseado.

; en scheme ir agregando por el final no es muy eficiente y es mejor ponerlo al rees y luego dar la vuelta a la lista

; -- comentado porque da error --
; (define (square-list2 items)
;   (define (iter things answer)
;     (if (null? things)
;         answer
;         (iter (cdr things)
;               (cons answer
;                     (square
;                      (car things)))))
;     (iter items null)))

; En el segundo intento genera un error porque la función cons espera que su primer argumento sea un elemento y el segundo una lista,
; pero Louis está pasando answer (que es una lista) como el primer argumento, lo cual es incorrecto.
