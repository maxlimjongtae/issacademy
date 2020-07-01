package console.chapter_04.type;

import console.chapter_04.token.Token;

public class Operand implements Token {
    private final Integer value;

    public Operand(String value) {
        this.value = Integer.valueOf(value);
    }

    public Integer getValue() {
        return value;
    }

    @Override
    public String toString() {
        return String.valueOf(value);
    }
}
