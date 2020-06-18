package console.token.regex;


import console.annotation.Todo;
import console.token.state.TokenState;

@Todo
public class BracketTokenRegex implements TokenRegex {
    @Override
    public String getRegex() {
        return "[\\(\\)]?";
    }

    @Override
    public TokenState getState() {
        return TokenState.OPERATOR;
    }
}
