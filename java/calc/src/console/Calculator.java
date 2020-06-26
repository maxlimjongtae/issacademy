package console;

import java.util.ArrayList;
import java.util.List;

public class Calculator {
    public static void main(String[] args) {
        String input = "11 + 30 - 26 - 10";

        char[] chars = input.replaceAll(" ", "").toCharArray();
        StringBuilder digitTemporary = new StringBuilder();

        List<Character> operatorStack = new ArrayList<>();
        List<Integer> operandStack = new ArrayList<>();

        for (int i = 0; i < chars.length; i++) {
            char character = chars[i];

            switch (character) {
                case '+':
                case '-':
                    operatorStack.add(character);
                    addOperand(digitTemporary, operandStack);
                    break;
                default:
                    digitTemporary.append(character);
                    break;
            }
        }

        addOperand(digitTemporary, operandStack);

        Integer result = operandStack.get(0);

        for (int i = 0; i < operatorStack.size(); i++) {
            Character operator = operatorStack.get(i);
            Integer next = operandStack.get(i + 1);

            result = calculate(result, next, operator);
        }

        System.out.println(operandStack);
        System.out.println(operatorStack);
        System.out.println(result);
    }

    private static void addOperand(StringBuilder digitTemporary, List<Integer> operandStack) {
        String operand = digitTemporary.toString();
        operandStack.add(Integer.valueOf(operand));
        digitTemporary.setLength(0);
    }

    private static Integer calculate(Integer prev, Integer next, Character operator) {
        switch (operator) {
            case '+':
                return prev + next;
            case '-':
                return prev - next;
            default:
                throw new RuntimeException("Get out");
        }
    }
}
