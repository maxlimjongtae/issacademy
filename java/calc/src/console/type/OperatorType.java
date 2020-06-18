package console.type;

import java.util.function.BiFunction;

public enum OperatorType implements Calculable, Prioritizable {
    PLUS((a, b) -> a + b, PriorityType.PLUS_MINUS),
    MINUS((a, b) -> a - b, PriorityType.PLUS_MINUS),
    MULTIPLY((a, b) -> a * b, PriorityType.MULTIPLY_DIVIDE),
    DIVIDE((a, b) -> a / b, PriorityType.MULTIPLY_DIVIDE);

    private final BiFunction<Long, Long, Long> expression;
    private final PriorityType priorityType;

    OperatorType(BiFunction<Long, Long, Long> expression, PriorityType priorityType) {
        this.expression = expression;
        this.priorityType = priorityType;
    }

    @Override
    public BiFunction<Long, Long, Long> getExpression() {
        return this.expression;
    }

    @Override
    public PriorityType getPriorityType() {
        return this.priorityType;
    }
}
