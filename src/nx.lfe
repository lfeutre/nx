(defmodule nx
  (export all))

(include-lib "include/nx.lfe")

;;; --------------
;;; optimisations
;;; --------------

(defun jit (func args)
  (Elixir.Nx.Defn:jit func args))

;;; -----------
;;; operations
;;; -----------

(defun divide (a b)
  (Elixir.Nx:divide a b))

(defun exp (a)
  (Elixir.Nx:exp a))

(defun sum (a)
  (Elixir.Nx:sum a))

(defun < (a b)
  (Elixir.Nx:less a b))

(defun > (a b)
  (Elixir.Nx:greater a b))