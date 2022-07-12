#|

Daniel Cu Sánchez - A01703613

Functions implementing recursion live class

|#

#lang racket

(provide factorial-1 factorial-2 fibo factorial-3 pi-term)

; with factorial with recursion
(define (factorial-1 n)
  (cond
    [(< n 1) 1]
    [else (* n (factorial-1 (- n 1)))]))

(define (factorial-2 x)
  ;with tail
  (define (loop n a)
    ; int function that takes 2 arguments
    (if (< n 1)
        a
        (loop (- n 1) (* n a))))
  (loop x 1))

(define (factorial-3 x)
  ; tail recursion using a named let "
  ; same thing that we did on fact-2
  ; but with different syntaxis
  (let loop
    ; variables with value
    ([n x] [a 1])
    (if (< n 1)
        a
        (loop (- n 1) (* n a)))))

;fibonacci
(define (fibo n)
  (cond
    [(= n 0) 0]
    [(= n 1) 1]
    [else (+ (fibo (- n 1)) (fibo (- n 2)))]))



; Pending
(define (pi-term x)
  (let loop
    ; variables with value
    ([n x])
    (if (< n 1)
        n
        (loop (* (exp -1 (+ n 1)) (/ 4 (- (* 2 n) 1)))
        ))))
