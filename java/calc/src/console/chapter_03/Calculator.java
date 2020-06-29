package console.chapter_03;

import console.chapter_03.token.Tokenizer;

/**
 * Chapter 03. Extract tokenizing, postfix
 * <p>
 * condition:
 */
public class Calculator {

    public static void main(String[] args) {
        final String input = "1 * 2 * 4 + 8 * 4 / 2 + 4";

        String postfixExpression = Tokenizer.tokenize(input);

        System.out.println(postfixExpression);
        System.out.println(Postfix.calculate(postfixExpression));
    }
}