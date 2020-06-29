package console.chapter_03;

import console.chapter_03.type.Operator;

import java.util.Stack;

public class Postfix {
    public static Integer calculate(String postfix) {
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

                operandStack.push(operator.getExpression().apply(left, right));
            }
        }

        return operandStack.pop();
    }
}
