package console.token.regex;

import console.token.state.TokenState;

public class OperandTokenRegex implements TokenRegex {
    @Override
    public String getRegex() {
        return "[\\+\\|\\-]?\\d+\\.*\\d*";
    }

    @Override
    public TokenState getState() {
        return TokenState.OPERAND;
    }
}
