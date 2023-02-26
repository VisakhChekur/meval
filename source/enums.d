module enums;

enum TokenType : char {
    // Groupers
    LEFT_PARAN = '(',
    RIGHT_PARAN = ')',

    // Values
    NUMBER = '1',

    // Operators
    PLUS = '+',
    MINUS = '-',
    DIVIDE = '/',
    MULTIPLY = '*',
    POWER = '^',
}

enum Operators {
    ADD,
    SUBTRACT,
    DIVIDE,
    MULTIPLY,
    POWER
}

enum LogLevel {
    TRACE = 0,
    DEBUG = 1,
    INFO = 2,
    ERROR = 3,
}
