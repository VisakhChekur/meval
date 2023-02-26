# Grammar

```
expression -> term
term -> factor (("+" | "-") factor)*
factor -> unary (("/" | "*") unary)*
unary -> ("-" | "+") unary | primary
primary -> number | "(" expression ")"

```

`*` => repeats zero or more times