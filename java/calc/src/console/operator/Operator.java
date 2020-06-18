package console.operator;

import java.util.function.BiFunction;

public enum Operator {
    PLUS((a, b) -> a + b, 1),
    MINUS((a, b) -> a - b, 1),
    MULTIPLY((a, b) -> a * b, 3),
    DIVISION((a, b) -> a / b, 3);

    private final BiFunction<Long, Long, Long> expression;
    private final int priority;

    Operator(BiFunction<Long, Long, Long> expression, int priority) {
        this.expression = expression;
        this.priority = priority;
    }

    public static Operator of(String name) {
        for (Operator calculate : Operator.values()) {
            if (calculate.name().equals(name)) {
                return calculate;
            }
        }

        throw new IllegalArgumentException();
    }

    public Long calculate(Long a, Long b) {
        return expression.apply(a, b);
    }
}