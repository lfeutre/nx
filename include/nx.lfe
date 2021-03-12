(defmacro / args
  `(Elixir.Nx:divide ,@args))

;; This function is for display purposes when used in the REPL
;; and needs to be the last function in the include file.
(defun |-- loaded include: nx --| ()
  'ok)