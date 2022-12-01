#lang racket

(require "../util.rkt")

(define (my-split fileName)
  (map
   (lambda (x) (string-split x "\n"))
   (string-split (file-contents fileName) "\n\n")))




(define (part1 input-file)
  (apply max (for/list ((elf (my-split input-file)))
               (sum-list (strings->numbers elf)))))

(define (part2 input-file)
  (sum-list (take
             (sort (for/list ((elf (my-split input-file)))
                     (sum-list (strings->numbers elf)))
                   >)
             3)))

(part1 "input.txt")
(part2 "input.txt")
