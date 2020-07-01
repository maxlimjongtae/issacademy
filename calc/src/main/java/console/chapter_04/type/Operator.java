package console.chapter_04.type;

import console.chapter_04.token.Token;

public enum Operator implements Token {
    PLUS('+', Priority.PLUS_MINUS),
    MINUS('-', Priority.PLUS_MINUS),
    MULTIPLY('*', Priority.MULTIPLY_DIVIDE),
    DIVIDE('/', Priority.MULTIPLY_DIVIDE),
    OPEN_BRACKET('(', Priority.BRACKET),
    CLOSE_BRACKET(')', Priority.BRACKET);

    private final Character identifier;
    private final Priority priority;

    Operator(Character identifier, Priority priority) {
        this.identifier = identifier;
        this.priority = priority;
    }

    public Character getIdentifier() {
        return identifier;
    }

    public Priority getPriority() {
        return priority;
    }

    public static Operator of(final Character identifier) {
        for (Operator operator : Operator.values()) {
            if (operator.identifier.equals(identifier)) {
                return operator;
            }
        }

        throw new RuntimeException("Invalid identifier.");
    }

    @Override
    public String toString() {
        return String.valueOf(identifier);
    }

    public boolean isClose() {
        return this.equals(Operator.CLOSE_BRACKET);
    }

    public boolean isOpen() {
        return this.equals(Operator.OPEN_BRACKET);
    }
}
