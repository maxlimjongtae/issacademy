package console.chapter_04.token;

import console.chapter_04.type.Operand;
import console.chapter_04.type.Operator;

import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;

public class Tokenizer {
    public static List<Token> tokenize(String input) {
        final List<Token> infixTokenList = new ArrayList<>();
        final StringBuilder operandBuilder = new StringBuilder();

        char[] chars = input.replaceAll(" ", "").toCharArray();

        for (int i = 0; i < chars.length; i++) {
            char character = chars[i];

            if (isOperator(character)) {
                if (operandBuilder.length() != 0) {
                    infixTokenList.add(new Operand(operandBuilder.toString()));
                    operandBuilder.setLength(0);
                }

                infixTokenList.add(Operator.of(character));
            } else {
                operandBuilder.append(character);
            }
        }

        if (operandBuilder.length() != 0) {
            infixTokenList.add(new Operand(operandBuilder.toString()));
        }

        return infixTokenList;
    }

    private static boolean isOperator(char character) {
        return Arrays.stream(Operator.values()).anyMatch(operator -> operator.getIdentifier().equals(character));
    }
}
