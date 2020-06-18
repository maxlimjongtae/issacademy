package console.type;

import console.annotation.Todo;

@Todo
public enum BracketType implements Prioritizable {
    OPEN, CLOSE;

    @Override
    public PriorityType getPriorityType() {
        return PriorityType.BRACKET;
    }
}
