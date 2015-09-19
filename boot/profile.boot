(require 'boot.repl)

(swap! boot.repl/*default-dependencies*
       concat '[[cider/cider-nrepl "0.10.0-SNAPSHOT"]
                [org.clojure/tools.nrepl "0.2.11"]
                [refactor-nrepl "1.2.0-SNAPSHOT"]
                [criterium "0.4.3"]])

(swap! boot.repl/*default-middleware*
       concat '[[cider.nrepl/cider-middleware]
                [refactor-nrepl.find-symbol/wrap-find-symbol]
                [refactor-nrepl.ns.clean-ns/wrap-clean-ns]
                [refactor-nrepl.config/wrap-config]
                [refactor-nrepl.ns.resolve-missing/wrap-resolve-missing]
                [refactor-nrepl.find-unbound/wrap-find-unbound]
                [refactor-nrepl.artifacts/wrap-artifacts]])
