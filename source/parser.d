import tokenizer : Token;
import enums : TokenType, LogLevel;
import expr : Expression, Number, Unary, Binary, Group;
import std.conv;
import std.format : format;

debug {
    import std.stdio;
}

class Parser {
    private Token[] _tokens;
    private int _current = 0;

    this(Token[] tokens) {
        _tokens = tokens;
    }

    this() {
    }

    /** Parses the given tokens and returns the corresponding
    expression. */
    Expression parse() {

        debug {
            import std.stdio;
            import std.format;

            writefln("Parsing %s", this._tokens);
        }
        return expression();
    }

    void reset(Token[] tokens) {
        this._tokens = tokens;
        this._current = 0;
    }

    private Expression expression() {

        debug {

            string tokenString = isAtEnd() ? "exhaushted" : to!string(getCurrToken());
            writefln("EXPRESSION: %s", tokenString);
        }
        return term();
    }

    private Expression term() {
        debug {

            string tokenString = isAtEnd() ? "exhaushted" : to!string(getCurrToken());
            writefln("EXPRESSION: %s", tokenString);
        }

        auto expr = factor();

        if (match(TokenType.PLUS, TokenType.MINUS)) {

            debug {
                writeln("TERM: Matched plus or minus");
            }

            Token currToken = getCurrToken();
            advance();
            auto rightOperand = factor();
            return new Binary(expr, rightOperand, currToken);
        }

        return expr;

    }

    private Expression factor() {

        auto expr = unary();

        if (match(TokenType.DIVIDE, TokenType.MINUS)) {
            Token currToken = getCurrToken();
            advance();
            auto rightOperand = unary();
            return new Binary(expr, rightOperand, currToken);
        }

        return expr;

    }

    private Expression unary() {

        if (match(TokenType.PLUS, TokenType.MINUS)) {
            Token currToken = getCurrToken();
            advance();
            return new Unary(unary(), currToken);
        }

        return primary();
    }

    private Expression primary() {

        auto token = getCurrToken();

        if (match(TokenType.NUMBER)) {
            advance();
            return new Number(to!float(token.value));
        }

        if (match(TokenType.LEFT_PARAN)) {
            advance();
            auto expr = expression();
            if (!match(TokenType.RIGHT_PARAN)) {
                throw new Exception("parse error");
            }
            advance();
            import std.stdio;

            return new Group(expr);
        }

        assert(0);
    }

    // ----- Helpers -----

    /** Returns the current token to be parsed. */
    private Token getCurrToken() {
        return _tokens[_current];
    }

    /** Returns `True` if all the tokens have been parsed. */
    private bool isAtEnd() {
        return _current >= _tokens.length;
    }

    /** Advances the current tokens pointer by one. */
    private void advance() {
        _current++;
    }

    /** Returns `True` if the token type of the current token
    matches any of the given token types. */
    private bool match(TokenType[] tokenTypes...) {
        if (isAtEnd())
            return false;

        Token token = getCurrToken();
        foreach (TokenType tokenType; tokenTypes) {
            if (token.tokenType == tokenType) {
                return true;
            }
        }
        return false;
    }

}

@("Only a number")
unittest {
    import tokenizer : Tokenizer, Token;

    auto tokens = [Token(TokenType.NUMBER, "1")];
    auto parsedExpr = new Parser(tokens).parse();

    assert(parsedExpr == new Number(1.0));
}
