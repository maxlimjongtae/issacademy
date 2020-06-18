package console.operator;

import console.type.CalculateType;

import java.util.HashMap;
import java.util.Map;
import java.util.StringJoiner;

public abstract class Operator {
    private Map<String, CalculateType> calculatorMap = new HashMap<>();

    public Operator() {
        calculatorMap.put(getPlus(), CalculateType.PLUS);
        calculatorMap.put(getMinus(), CalculateType.MINUS);
        calculatorMap.put(getMultiply(), CalculateType.MULTIPLY);
        calculatorMap.put(getDivide(), CalculateType.DIVIDE);
    }

    abstract String getPlus();

    abstract String getMinus();

    abstract String getMultiply();

    abstract String getDivide();

    public CalculateType getCalulateType (String operator){
        return calculatorMap.get(operator);
    }

    public String getOperators() {
        StringJoiner joiner = new StringJoiner("|");
        joiner.add(getPlus());
        joiner.add(getMinus());
        joiner.add(getMultiply());
        joiner.add(getDivide());
        return joiner.toString();
    }
}
