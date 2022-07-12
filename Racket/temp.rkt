#lang racket

(provide C->F F->C)

(define (C->F temp-c)
    (+ (/ (* temp-c 9) 5.0) 32))

(define (F->C temp-f)
    (/ (* (- temp-f 32) 5.0) 9))

(define (test-temp temp)
  (if (< temp 0)
      "freezing (<0)"
      (if (< temp 15)
          "cold (0 - 15)"
          (if (< temp 25)
              "nice (15-25)"
              "too hot (>25)"))))

(define (eval-temp temp)
  (cond
  [(< temp 0) "freezing"]
    [(< temp 15) "cold"]
    [(< temp 25) ""]))