package console.token.regex;

import console.token.TokenType;

public class BracketTokenRegex implements TokenRegex {
    @Override
    public String getRegex() {
        return "[\\(\\)]?";
    }

    @Override
    public TokenType getTokenType() {
        return TokenType.OPERATOR;
    }
}
