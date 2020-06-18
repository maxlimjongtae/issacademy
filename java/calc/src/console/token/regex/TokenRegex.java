package console.token.regex;

import console.token.TokenType;

public interface TokenRegex {
    String getRegex();
    TokenType getTokenType();
}
