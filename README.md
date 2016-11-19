# cse131.el

Emacs modes for the sequence of Snake languages in CSE 131

```elisp
(require 'cse131)
(add-to-list 'auto-mode-alist
             `(,(regexp-opt '("adder" "boa" "cobra" "diamond" "egg" "fdl")) . cse131-mode))
```

To insert a lambda (λ), do `C-M-y` (same as Racket mode)
