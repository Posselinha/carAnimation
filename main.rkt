(define WHEEL-RADIUS 5)
(define WHEEL-DISTANCE (* WHEEL-RADIUS 5))

(define WHEEL
  (circle WHEEL-RADIUS "solid" "black"))

(define SPACE-WIDTH (* WHEEL-RADIUS 2))
(define SPACE
  (rectangle SPACE-WIDTH WHEEL-RADIUS "solid" "white"))

(define BOTH-WHEELS
  (beside WHEEL SPACE WHEEL))

(define CHASSI-WIDTH (* SPACE-WIDTH 4))
(define CHASSI-HEIGHT (* WHEEL-RADIUS 2))
(define CHASSI-TOP (* SPACE-WIDTH 2))
(define CAR-CHASSI
  (above (rectangle CHASSI-TOP CHASSI-HEIGHT "solid" "red")
         (rectangle CHASSI-WIDTH CHASSI-HEIGHT "solid" "red")))


(define MIDDLE-X
  (- (/ (image-width CAR-CHASSI) 2) (/ (image-width BOTH-WHEELS) 2)))

(define ALIGN-Y
  (+ (/ (image-height CAR-CHASSI) 2) (/ (image-height BOTH-WHEELS) 2)))

(define CAR
  (underlay/xy CAR-CHASSI MIDDLE-X ALIGN-Y BOTH-WHEELS))

(define WIDTH-OF-WORLD 200)
(define HEIGHT-OF-WORLD
  (+ (image-height CAR) 10))
(define BACKGROUND (empty-scene WIDTH-OF-WORLD HEIGHT-OF-WORLD))

(define BASELINE
  (- HEIGHT-OF-WORLD (image-height CAR)))
(define CAR-Y
  (+ BASELINE (/ BASELINE 2)))

(define (CAR-IN-BACKGROUND y)
  (put-image CAR y CAR-Y BACKGROUND))

(define (stop y)
  (>= y 250))

(define (three y)
  (+ y 3))

(define (main y)
  (big-bang y
    [on-tick three]
    [stop-when stop]
    [to-draw CAR-IN-BACKGROUND]))
    
