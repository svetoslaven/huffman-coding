(define ht-count car)
(define ht-left cadr)
(define ht-right caddr)

(define ht-leaf-symbol cadr)

(define (cons-ht count left right)
  (list count left right))

(define (cons-ht-leaf count symbol)
  (list count symbol))

(define (ht-leaf? ht)
  (null? (cddr ht)))
