#lang racket
(provide fileToInts)
(provide file_contents)
(provide read_number_list)


(define (file_contents filename)
  (port->string (open-input-file filename) #:close? #t))

(define (fileToInts file)
  (map string->number (string-split (file_contents file))))

(define (read_number input-port)
      (define char (read-char input-port))
      (if (eof-object? char)
               char
                    (string->number (string char))))


(define (read_number_list filename)
  (port->list read_number (open-input-string filename)))

(module+ test
  (require rackunit)
  (check-equal? (fileToInts "test.txt") '(1123 1231231 3223132313 1140339994)))
