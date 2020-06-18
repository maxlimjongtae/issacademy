package console.type;

import java.util.function.BiFunction;

public interface Calculable {
    BiFunction<Long, Long, Long> getExpression();
}
