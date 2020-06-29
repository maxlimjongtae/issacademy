package console.chapter_04.type;

import java.util.HashMap;
import java.util.Map;
import java.util.function.BiFunction;

public enum Operation {
    PLUS((a, b) -> a + b),
    MINUS((a, b) -> a - b),
    MULTIPLY((a, b) -> a * b),
    DIVIDE((a, b) -> a / b);

    private final BiFunction<Integer, Integer, Integer> expression;
    private static final Map<Operator, BiFunction<Integer, Integer, Integer>> map = new HashMap<>() {
        {
            put(Operator.PLUS, Operation.PLUS.expression);
            put(Operator.MINUS, Operation.MINUS.expression);
            put(Operator.MULTIPLY, Operation.MULTIPLY.expression);
            put(Operator.DIVIDE, Operation.DIVIDE.expression);
        }
    };

    Operation(BiFunction<Integer, Integer, Integer> expression) {
        this.expression = expression;
    }

    public static BiFunction<Integer, Integer, Integer> getExpression(Operator operator) {
        return map.get(operator);
    }
}
