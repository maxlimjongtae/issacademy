package console.operator;

public class SignOperators implements Operators {
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
    public String getDivision() {
        return "\\/";
    }
}
