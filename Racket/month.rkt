#lang racket

(provide month-days month-days-2 month-days-3 leap? leap?-2)

(define (month-days month year)
  "return the number of days in the given month"
  (if (= month 2)
      (if (eq? (leap? year) #t) 29 28)
      (if (or (= month 4) (= month 6) (= month 9) (= month 11))
            30
            31)))

  (define (month-days-2 month)
    (cond
      [(= month 2) 28]
      [(or (= month 4) (= month 6) (= month 9) (= month 11)) 30]
      [else 31]))

  (define (month-days-3 month)
    (case month
      [(2) 28]
      [(4 6 9 11) 30]
      [else 31]))

(define (leap?-2 year)
  (if (= 0 (remainder year 4))
      (if (zero? (remainder year 100))
          (if (zero? (remainder year 400))
              #t
              #f)
          #t)
      #f))

(define (leap? year)
  (and (zero? (remainder year 4))
           (or (not (zero? (remainder year 100)))
               (zero? (remainder year 400)))))

