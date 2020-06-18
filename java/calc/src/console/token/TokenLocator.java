package console.token;

public class TokenLocator implements Comparable<TokenLocator> {
    private final String matchValue;
    private final TokenType tokenType;
    private final int start;

    public TokenLocator(String matchValue, TokenType tokenType, int start) {
        this.matchValue = matchValue;
        this.tokenType = tokenType;
        this.start = start;
    }

    public String getMatchValue() {
        return matchValue;
    }

    public TokenType getTokenType() {
        return tokenType;
    }

    @Override
    public int compareTo(TokenLocator o) {
        return Integer.compare(this.start, o.start);
    }
}
