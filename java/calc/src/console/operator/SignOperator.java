package console.operator;

public class SignOperator extends Operator {
    @Override
    public String getPlus() {
        return "\\+";
    }

    @Override
    public String getMinus() {
        return "\\-";
    }

    @Override
    public String getMultiply() {
        return "\\*";
    }

    @Override
    public String getDivide() {
        return "\\/";
    }
}
