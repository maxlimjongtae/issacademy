package console.chapter_03.token;

import console.chapter_03.type.Operator;
import console.chapter_03.type.Priority;

import java.util.Arrays;
import java.util.Stack;
import java.util.StringJoiner;

public class Tokenizer {
    public static String tokenize(String input) {
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
                    for (int j = 0; j < operatorStack.size(); j++) {
                        if (isLeftHigherThanRight(operatorStack.peek().getPriority(), operator.getPriority())) {
                            postfixBuilder.add(String.valueOf(operatorStack.pop().getIdentifier()));
                        }
                    }
                    operatorStack.push(operator);
                }
            } else {
                operandBuilder.append(character);
            }
        }
        postfixBuilder.add(operandBuilder.toString());

        while (!operatorStack.empty()) {
            postfixBuilder.add(String.valueOf(operatorStack.pop().getIdentifier()));
        }

        return postfixBuilder.toString();
    }

    private static boolean isLeftHigherThanRight(Priority left, Priority right) {
        return left.compareTo(right) > 0;
    }

    private static boolean isOperator(char character) {
        return Arrays.stream(Operator.values()).anyMatch(operator -> operator.getIdentifier().equals(character));
    }
}
