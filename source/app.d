// import exceptions;
// import std.conv : to;
// import std.stdio : writeln;
// import std.string : rightJustify, strip;
// import std.format : format;

// import evaluator : Evaluator;

// version (unittest) {
// 	// This is required for `silly`.
// } else {
// 	int main(string[] args) {

// 		if (args.length != 2) {
// 			debug {
// 				string sampleExpr = "1 * 2";
// 				if (args.length > 2) {

// 					args[1] = sampleExpr;
// 				} else {
// 					args ~= sampleExpr;
// 				}
// 			} else {
// 				writeln("USAGE: meval <expression>");
// 				return 1;
// 			}
// 		}

// 		try {
// 			float answer = Evaluator(args[1]).evaluate();
// 			writeln(format("%s = %s", args[1], answer));
// 		} catch (exceptions.InvalidCharacter ex) {

// 			import std.format : format;

// 			auto invalidCharPointer = new char[ex.colNum];
// 			foreach (ref c; invalidCharPointer) {
// 				c = ' ';
// 			}
// 			invalidCharPointer[$ - 1] = '^';

// 			writeln(format("ERROR: %s", ex.msg));
// 			writeln("\n\t", args[1]);
// 			writeln("\t", to!string(invalidCharPointer));
// 		}
// 		return 0;
// 	}
// }

import parser : Parser;
import tokenizer : Token;
import enums : TokenType;

void main() {
	import std.stdio;

	auto tokens = [Token(TokenType.NUMBER, "1")];
	auto parsedExpr = new Parser(tokens).parse();
	auto anotherParsedExpr = new Parser(tokens).parse();

}
