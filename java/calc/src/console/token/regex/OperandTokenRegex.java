package console.token.regex;

import console.token.TokenType;

public class OperandTokenRegex implements TokenRegex {
    @Override
    public String getRegex() {
        return "\\d+\\.*\\d*";
    }

    @Override
    public TokenType getTokenType() {
        return TokenType.OPERAND;
    }
}
