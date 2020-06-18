package console.token.regex;

import console.token.state.TokenState;

public interface TokenRegex {
    String getRegex();
    TokenState getState();
}
