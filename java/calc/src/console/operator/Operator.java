package console.operator;

import java.util.StringJoiner;

public interface Operator {
    String getPlus();

    String getMinus();

    String getMultiply();

    String getDivide();

    default String getOperators() {
        StringJoiner joiner = new StringJoiner("|");
        joiner.add(getPlus());
        joiner.add(getMinus());
        joiner.add(getMultiply());
        joiner.add(getDivide());
        return joiner.toString();
    }
}
