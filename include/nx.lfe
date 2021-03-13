(defmacro / args
  `(nx:jit ,#'Elixir.Nx:divide/2 ,args))

;; Notes from chatting with José:
;; * @Duncan McGreggor so today we already have something like
;;   Nx.Defn.jit(&some_function/2, [arg1, arg2])
;; * so you should be able to do this,
;;   lfenx:jit(fun some_function/2, [Arg1, Arg2]), and some_function is an
;;   LFE function where you have rewritten + to be Nx.add
;; * here is the code in our numerlcal definitions:
;;   https://github.com/elixir-nx/nx/blob/main/nx/lib/nx/defn/kernel.ex
;; * the thing about numerical definitions is really just restricting how much
;;   of the language you can call and rewriting some operations
;; * you can even do this: Nx.Defn.jit(&Nx.add/2, [arg1, arg2]) where the
;;   function is a completely regular function
;; * the point is that we don't really care about the function being jitted;
;;   it can be regular beam code. the numerical definition is really just
;;   syntax restrictions
;; * here is the compiler code:
;;   https://github.com/elixir-nx/nx/blob/main/nx/lib/nx/defn/compiler.ex
;;   most of it is just restricting what can be called
;; * the only things that are not restrictions are:
;;   1. cond (we handle cond in our compiler but you can totally handle it as
;;      a macro too)
;;   2. tensor/from_binary
;;      https://github.com/elixir-nx/nx/blob/main/nx/lib/nx/defn/compiler.ex#L69
;;   3. adding backends for function creation:
;;      https://github.com/elixir-nx/nx/blob/main/nx/lib/nx/defn/compiler.ex#L571-L585
;; * the trick we did for defn in elixir is to convert it to the expression
;;   tree AFTER the elixir compiler expands it, so we can leverage all of the
;;   validation in the elixir compiler
;; * it works like this: first we compile to regular elixir ast, which is
;;   validated and expanded, and then we traverse it converting into something
;;   that at runtime emits the defn AST
;; * we have macros in defn and they work for free because we work on the defn
;;   ast after macros are expanded
;; * i would perhaps even start using it without your own defn, maybe just
;;   wrap Nx.Defn.jit into a lfenx:jit(...) and you call nx functions in
;;   there

;; This function is for display purposes when used in the REPL
;; and needs to be the last function in the include file.
(defun |-- loaded include: nx --| ()
  'ok)