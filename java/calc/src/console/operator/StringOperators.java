package console.operator;

public class StringOperators implements Operators {
    @Override
    public String getPlus() {
        return "add";
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
    public String getDivision() {
        return "division";
    }
}
