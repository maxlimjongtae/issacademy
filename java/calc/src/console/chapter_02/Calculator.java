package console.chapter_02;

import java.util.Stack;
import java.util.StringJoiner;
import java.util.function.BiFunction;

public class Calculator {
    enum Priority {
        PLUS_MINUS, MULTIPLY_DIVIDE, BRACKET;
    }

    enum Operator {
        PLUS('+', Priority.PLUS_MINUS, (a, b) -> a + b),
        MINUS('-', Priority.PLUS_MINUS, (a, b) -> a - b),
        MULTIPLY('*', Priority.MULTIPLY_DIVIDE, (a, b) -> a * b),
        DIVIDE('/', Priority.MULTIPLY_DIVIDE, (a, b) -> a / b);

        private final Character identifier;
        private final Priority priority;
        private final BiFunction<Integer, Integer, Integer> expression;

        Operator(Character identifier, Priority priority, BiFunction<Integer, Integer, Integer> expression) {
            this.identifier = identifier;
            this.priority = priority;
            this.expression = expression;
        }

        public static Operator of(Character identifier) {
            for (Operator operator : Operator.values()) {
                if (operator.identifier.equals(identifier)) {
                    return operator;
                }
            }

            throw new RuntimeException("Invalid identifier.");
        }
    }

    private static boolean isOperator(char character) {
        Operator[] operators = Operator.values();

        for (int i = 0; i < operators.length; i++) {
            if (operators[i].identifier.equals(character)) {
                return true;
            }
        }

        return false;
    }

    public static void main(String[] args) {
        final String input = "11 + 26 * 3 + 88";

        final StringJoiner postfixBuilder = new StringJoiner(",");
        final StringBuilder operandBuilder = new StringBuilder();
        final Stack<Operator> operatorStack = new Stack<>();

        char[] chars = input.replaceAll(" ", "").toCharArray();

        for (int i = 0; i < chars.length; i++) {
            char character = chars[i];

            // Todo: extract method
            if (isOperator(character)) {
                postfixBuilder.add(operandBuilder.toString());
                operandBuilder.setLength(0);

                Operator operator = Operator.of(character);

                if (operatorStack.empty()) {
                    operatorStack.push(operator);
                } else {
                    if (operator.priority.compareTo(operatorStack.peek().priority) > 0) {
                        operatorStack.push(operator);
                    } else {
                        postfixBuilder.add(String.valueOf(operatorStack.pop().identifier));
                        operatorStack.push(operator);
                    }
                }
            } else {
                operandBuilder.append(character);
            }
        }
        postfixBuilder.add(operandBuilder.toString());

        while (!operatorStack.empty()) {
            postfixBuilder.add(String.valueOf(operatorStack.pop().identifier));
        }

        String postfix = postfixBuilder.toString();
        System.out.println(postfix);
        System.out.println(calculate(postfix));
    }

    private static Integer calculate(String postfix) {
        final Stack<Integer> operandStack = new Stack<>();

        String[] tokens = postfix.split(",");

        for (int i = 0; i < tokens.length; i++) {
            String token = tokens[i];

            try {
                Integer operand = Integer.valueOf(token);
                operandStack.push(operand);
            } catch (Throwable e) {
                Operator operator = Operator.of(token.charAt(0));

                Integer right = operandStack.pop();
                Integer left = operandStack.pop();

                operandStack.push(operator.expression.apply(left, right));
            }
        }

        return operandStack.pop();
    }
}
