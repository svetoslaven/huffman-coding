(load "huffman-encode.rkt")
(load "huffman-decode.rkt")

(define (check-true proposition)
  proposition)

(define abracadabra (list #\a #\b #\r #\a #\c #\a #\d #\a #\b #\r #\a))
(define the-empty-list '())
(define heterogenous-list (list "asd" 13 '(a s d) '(13 (13 #\a)) #\f 13 "asd" "13"))

;; encoded
(define abracadabra-e (encode abracadabra equal?))
(define the-empty-list-e (encode the-empty-list equal?))
(define heterogenous-list-e (encode heterogenous-list equal?))

;; encoded and then decoded
(define abracadabra-e-d (decode (car abracadabra-e) (cdr abracadabra-e)))
(define the-empty-list-e-d (decode (car the-empty-list-e) (cdr the-empty-list-e)))
(define heterogenous-list-e-d (decode (car heterogenous-list-e) (cdr heterogenous-list-e)))

(check-true (equal? abracadabra abracadabra-e-d))
(check-true (equal? the-empty-list-e-d the-empty-list))
(check-true (equal? heterogenous-list-e-d heterogenous-list))
