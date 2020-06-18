package console.token.regex;

import console.operator.Operator;
import console.token.state.TokenState;

public class OperatorTokenRegex implements TokenRegex {
    private final Operator operator;

    public OperatorTokenRegex(Operator operator) {
        this.operator = operator;
    }

    @Override
    public String getRegex() {
        return operator.getOperators();
    }

    @Override
    public TokenState getState() {
        return TokenState.OPERATOR;
    }
}
