package console.chapter_03.type;

import java.util.function.BiFunction;

public enum Operator {
    PLUS('+', Priority.PLUS_MINUS, (a, b) -> a + b),
    MINUS('-', Priority.PLUS_MINUS, (a, b) -> a - b),
    MULTIPLY('*', Priority.MULTIPLY_DIVIDE, (a, b) -> a * b),
    DIVIDE('/', Priority.MULTIPLY_DIVIDE, (a, b) -> a / b);

    private final Character identifier;
    private final Priority priority;
    private final BiFunction<Integer, Integer, Integer> expression;

    Operator(Character identifier, Priority priority, BiFunction<Integer, Integer, Integer> expression) {
        this.identifier = identifier;
        this.priority = priority;
        this.expression = expression;
    }

    public Character getIdentifier() {
        return identifier;
    }

    public Priority getPriority() {
        return priority;
    }

    public BiFunction<Integer, Integer, Integer> getExpression() {
        return expression;
    }

    public static Operator of(Character identifier) {
        for (Operator operator : Operator.values()) {
            if (operator.identifier.equals(identifier)) {
                return operator;
            }
        }

        throw new RuntimeException("Invalid identifier.");
    }
}
