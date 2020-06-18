package console.token;

public class Token {
    private final String value;
    private final TokenType tokenType;

    public Token(TokenLocator locator) {
        this.value = locator.getMatchValue();
        this.tokenType = locator.getTokenType();
    }

    public String getValue() {
        return value;
    }

    public TokenType getType() {
        return tokenType;
    }

    @Override
    public String toString() {
        return value;
    }

    public boolean isOperator() {
        return TokenType.OPERATOR.equals(tokenType);
    }
}
