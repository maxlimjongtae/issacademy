package console.operator;

import java.util.StringJoiner;

public interface Operators {
    String getPlus();
    String getMinus();
    String getMultiply();
    String getDivision();

    default String getRegex() {
        StringJoiner joiner = new StringJoiner("|");
        joiner.add(getPlus())
                .add(getMinus())
                .add(getMultiply())
                .add(getDivision());

        return joiner.toString();
    }
}
