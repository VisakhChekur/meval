// module evaluator;

// import tokenizer : Tokenizer;
// import parser : Parser;

// struct Evaluator {
//     string expr;

//     private auto _tokenizer = new Tokenizer();
//     private auto _parser = new Parser();

//     this(string expr) {
//         this.expr = expr;
//     }

//     /** Evaluates the given expression. */
//     float evaluate() {
//         _tokenizer.reset(expr);
//         auto tokens = _tokenizer.tokenize();

//         debug {
//             import std.stdio;
//             import std.format;

//             writeln(format("Tokens = %s", tokens));
//         }

//         this._parser = new Parser(tokens);
//         auto parsedExpr = _parser.parse();

//         debug {
//             import std.stdio;

//             writefln("Parsed expression = %s", parsedExpr);
//         }

//         return parsedExpr.evaluate();
//     }
// }

// // ----- Tests -----

// // @("Addition")
// // unittest {
// //     string expr = "(1+2)";
// //     assert(Evaluator(expr).evaluate() == 3);

// //     expr = "1+2";
// //     assert(Evaluator(expr).evaluate() == 3);

// // }

// // @("Subtraction")
// // unittest {
// //     string expr = "(1-2)";
// //     assert(Evaluator(expr).evaluate() == -1);

// //     expr = "1-2";
// //     assert(Evaluator(expr).evaluate() == -1);

// // }

// // @("Multiplication")
// // unittest {
// //     string expr = "(1*2)";
// //     assert(Evaluator(expr).evaluate() == 2);

// //     expr = "1*2";
// //     assert(Evaluator(expr).evaluate() == 2);

// // }

// // @("Division")
// // unittest {

// //     import std.exception;
// //     import exceptions : DivideByZero;

// //     string expr = "(1/2)";
// //     assert(Evaluator(expr).evaluate() == 0.5);

// //     expr = "1/2";
// //     assert(Evaluator(expr).evaluate() == 0.5);

// //     expr = "1/0";
// //     assertThrown!DivideByZero(Evaluator(expr).evaluate());

// // }
