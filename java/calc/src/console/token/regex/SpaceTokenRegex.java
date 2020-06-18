package console.token.regex;

import console.annotation.Todo;
import console.token.state.TokenState;

@Todo
public class SpaceTokenRegex implements TokenRegex {
    @Override
    public String getRegex() {
        return "\\s*";
    }

    @Override
    public TokenState getState() {
        return null;
    }
}
