module expr;
import enums : TokenType;
import tokenizer : Token;
import std.format;
import std.conv;
import exceptions : DivideByZero;

import std.sumtype;

alias Expression = SumType!(Number, Binary, Unary, Group);

struct Number {
    float number;

    this(float num) {
        number = num;
    }

    // float evaluate() {
    //     return number;
    // }

    const {
        string toString() {
            return to!string(number);
        }
    }
}

/** A binary expression.

For example, "1 + 2" is a binary expression.
*/
struct Binary {
    Expression leftOperand;
    Expression rightOperand;
    Token operator;

    this(Expression leftOperand, Expression rightOperand, Token operator) {
        this.leftOperand = leftOperand;
        this.rightOperand = rightOperand;
        this.operator = operator;
    }

    // float evaluate() {

    //     float right = rightOperand.evaluate();

    //     switch (operator.tokenType) {
    //         case TokenType.PLUS:
    //             return left + right;
    //         case TokenType.MINUS:
    //             return left - right;
    //         case TokenType.MULTIPLY:
    //             return left * right;
    //         case TokenType.POWER:
    //             import std.math : pow;

    //             return pow(left, cast(int) right);
    //         case TokenType.DIVIDE:
    //             if (right == 0) {
    //                 throw new DivideByZero();
    //             }
    //             return left / right;
    //         default:
    //             assert(0);
    //     }
    // }

    const {
        string toString() {
            return format("%s %s %s", leftOperand, operator.value, rightOperand);
        }
    }
}

/** A unary expression.

For example, "-1" is a unary expression.*/
struct Unary {
    Expression operand;
    Token operator;

    this(Expression operand, Token operator) {
        this.operand = operand;
        this.operator = operator;
    }

    // float evaluate() {
    //     switch (operator.tokenType) {
    //         case TokenType.PLUS:
    //             return operand.evaluate();
    //         case TokenType.MINUS:
    //             return -1 * operand.evaluate();
    //         default:
    //             assert(0);
    //     }
    // }

    const {
        string toString() {
            return format("%s %s", operator.value, operand);
        }
    }
}

/** A grouped expression.

For example, "(1 + 2)" is a grouped expression.*/
struct Group {
    Expression expr;

    this(Expression expr) {
        this.expr = expr;
    }

    // float evaluate() {
    //     return expr.evaluate();
    // }

    const {
        string toString() {
            return format("(%s)", to!string(expr));
        }
    }
}

float evaluateExpression(Expression expr) {
    return expr.match!(
        (Number n) => n.number,
        _ => 1.0
    );
}
