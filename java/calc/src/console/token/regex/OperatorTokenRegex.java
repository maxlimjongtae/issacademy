package console.token.regex;

import console.operator.Operators;
import console.token.TokenType;

public class OperatorTokenRegex implements TokenRegex {
    private Operators operators;

    public OperatorTokenRegex(Operators operators) {
        this.operators = operators;
    }

    @Override
    public String getRegex() {
        return operators.getRegex();
    }

    @Override
    public TokenType getTokenType() {
        return TokenType.OPERATOR;
    }
}
