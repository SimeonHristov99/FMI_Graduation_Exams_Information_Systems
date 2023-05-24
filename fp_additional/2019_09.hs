main :: IO()
main = do
    print $ annotate db [evaluation, purity] == [ ("scheme", [ ("macros", "true"), ("typing", "dynamic"), ("evaluation", "strict") ] ), ("haskell", [ ("evaluation", "lazy"), ("pure", "true"), ("typing", "static") ] ), ("c++", [ ("evaluation", "strict"), ("macros", "true") ])]

db :: [(String, [(String, String)])]
db = [("scheme", [("typing", "dynamic"), ("evaluation", "strict")]),("haskell", [("typing", "static")]), ("c++", [])]

evaluation :: String -> [(String, String)]
evaluation "scheme"  = [("evaluation", "strict"), ("macros", "true")]
evaluation "haskell" = [("evaluation", "lazy")]
evaluation "c++"     = evaluation "scheme"

purity :: String -> [(String, String)]
purity lang = if lang == "haskell" then [("pure", "true")] else []

addIfNew x l = ???

annotate db annotators =
    ??? (\ (item, labels) ->
        (item, ??? addIfNew labels
            (??? (\ annotator -> ???) annotators))) db
