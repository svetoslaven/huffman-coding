(load "huffman-tree.rkt")

(define (decode-first-element huffman-tree compressed-data-list)
  (if (ht-leaf? huffman-tree)
      (cons (ht-leaf-symbol huffman-tree) compressed-data-list)
      (let ((first-bit (car compressed-data-list))
            (rest-bits (cdr compressed-data-list)))
        (if (equal? first-bit #\0)
            (decode-first-element (ht-left huffman-tree) rest-bits)
            (decode-first-element (ht-right huffman-tree) rest-bits)))))

(define (decode-helper huffman-tree compressed-data-list)
  (if (null? compressed-data-list)
      '()
      (let ((first-element-decoded (decode-first-element huffman-tree compressed-data-list)))
        (cons (car first-element-decoded) (decode-helper huffman-tree (cdr first-element-decoded))))))

(define (decode huffman-tree compressed-data-string)
  (let ((compressed-data-list (string->list compressed-data-string)))
    (decode-helper huffman-tree compressed-data-list)))