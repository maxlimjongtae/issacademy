package console.token.state;

public enum TokenState {
    OPERAND, OPERATOR;

    static {
        OPERAND.nextState = OPERATOR;
        OPERATOR.nextState = OPERAND;
    }

    private TokenState nextState;

    public TokenState getNextState() {
        return nextState;
    }
}
