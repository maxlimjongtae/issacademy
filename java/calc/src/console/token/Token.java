package console.token;

import console.token.state.TokenState;

import java.util.regex.Matcher;

public class Token {
    private String value;
    private int startIndex;
    private TokenState state;

    public Token(Matcher matcher, TokenState state) {
        this.value = matcher.group();
        this.startIndex = matcher.start();
        this.state = state;
    }

    @Override
    public String toString() {
        return String.format("{%s, value: %s, state: %s}", super.toString(), value, state.name());
    }
}
