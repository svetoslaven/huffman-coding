(define (singleton? l)
  (null? (cdr l)))

(define (member? x l pred-eq?)
  (and (not (null? l))
       (or (pred-eq? x (car l))
           (member? x (cdr l) pred-eq?))))

(define (unique l pred-eq?)
  (if (null? l)
      l
      (let* ((first (car l))
             (rest (cdr l))
             (rest-unique (unique rest pred-eq?)))
        (if (member? first rest pred-eq?)
            rest-unique
            (cons first rest-unique)))))

(define (foldl op nv l)
  (if (null? l)
      nv
      (foldl op (op nv (car l)) (cdr l))))

(define (count x l pred-eq?)
  (if (null? l)
      0
      (+ (if (pred-eq? x (car l)) 1 0) (count x (cdr l) pred-eq?))))
