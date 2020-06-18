package console.operator;

public class SignOperator implements Operator{
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
