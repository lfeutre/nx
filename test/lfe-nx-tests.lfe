(defmodule lfe-nx-tests
  (behaviour ltest-unit))

(include-lib "ltest/include/ltest-macros.lfe")

;;; -----------
;;; library API
;;; -----------

(deftest my-fun
  (is-equal 'hellow-orld (lfe-nx:my-fun)))
