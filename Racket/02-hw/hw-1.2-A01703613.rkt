#|
    First Racket homework
    Using functions and arithmetic operations

    Daniel Cu Sánchez - A01703613
    04/07/2022
|#
#lang racket


#|
    Receives the length of three sides, and determines whether they describe
    a valid triangle. The return value is a boolean.
    A triangle with sides a, b and c is valid if all sides are greater than 0,
    and all of these conditions are true:
    a + b > c
    b + c > a
    c + a > b
|#
(define (is-triangle? a b c)
   (cond
      ((or (<= a 0) (<= b 0) (<= c 0)) #f)
      ((<= (+ a b) c) #f)
      ((<= (+ b c) a) #f)
      ((<= (+ a c) b) #f)
      (#t #t)
   )
)


#|
    Receives the length of three sides. It should first call the previous function to determine if it is a valid triangle.
    Then decide on the type of triangle.
    It should return one of 4 symbols: 'INVALID, 'EQUILATERAL, 'ISOSCELES or 'SCALENE
|#
(define (triangle-type a b c)
   (cond
      ((not (is-triangle? a b c)) 'INVALID)
      ((= a b) (if (= b c) 'EQUILATERAL 'ISOSCELES))
      ((= b c) 'ISOSCELES)
      ((= a c) 'ISOSCELES)
      (#t 'SCALENE)
   )
)
#|
   Receives the coordinates of a point in 2D (x and y).
   Returns the quadrant where the point is located, using one of the following symbols:
   'ORIGIN, 'X_AXIS, 'Y_AXIS, 'I, 'II, 'III or 'IV.
|#
(define (point-quadrant x y)
   (cond
        ((= x 0) (if (= y 0) 'ORIGIN 'Y_AXIS))
        ((= y 0) 'X_AXIS)
        ((> x 0) (if (> y 0) 'I 'IV))
        ((> y 0) 'II)
        (#t 'III)
   )
)
#|
   Receives the number of hours, the number of minutes,
   and one of these symbols: 'STAMPED, 'UNSTAMPED, 'LOST.
   It returns the amount to pay for parking time
|#

(define (parking-ticket hrs mins typ)
   (cond
       ((equal? typ 'LOST) 100)
       ((equal? typ 'STAMPED) 
           (cond
                ((and (= hrs 0)(= mins 0)) 0)
                ((< hrs 2) 5)
                ((and (= hrs 2) (= mins 0)) 5)
                ((< hrs 3) 17)
                ((and (= hrs 3) (= mins 0)) 17)
                (#t (+ (* (- hrs 3) 12) 17
                      (cond
                          ((= mins 0) 0)
                          ((<= mins 15) 5)
                          ((<= mins 30) 8)
                          ((<= mins 45) 10)
                          (#t 12)
                      )))
           ))
       ((equal? typ 'UNSTAMPED) 
           (cond
                ((< hrs 1) 12)
                ((and (= hrs 1) (= mins 0)) 12)
                (#t (+ (* (- hrs 1) 12) 12
                      (cond
                          ((= mins 0) 0)
                          ((<= mins 15) 5)
                          ((<= mins 30) 8)
                          ((<= mins 45) 10)
                          (#t 12)
                      )))
           ))
   )
)