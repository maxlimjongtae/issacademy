package console.operator;

public class StringOperator implements Operator{
    @Override
    public String getPlus() {
        return "plus";
    }

    @Override
    public String getMinus() {
        return "minus";
    }

    @Override
    public String getMultiply() {
        return "multiply";
    }

    @Override
    public String getDivide() {
        return "divide";
    }
}
