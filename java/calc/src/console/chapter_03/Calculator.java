package console.chapter_03;

import console.chapter_03.token.Token;
import console.chapter_03.token.Tokenizer;
import console.chapter_03.type.Operand;
import console.chapter_03.type.Operator;

import java.util.List;
import java.util.Stack;

/**
 * Chapter 03. Split tokenizing, postfix
 * <p>
 * condition:
 */
public class Calculator {

    public static void main(String[] args) {
        final String input = "1 * 2 * 4 + 8 * 4 / 2 + 4";

        System.out.println(calculate(input));
    }

    private static Integer calculate(final String input) {
        final List<Token> infixTokenList = Tokenizer.tokenize(input);
        final List<Token> postfixTokenList = Postfix.changeFromInfix(infixTokenList);
        final Stack<Integer> operandStack = new Stack<>();

        for (Token token : postfixTokenList) {
            if (token instanceof Operator) {
                Operator operator = (Operator) token;

                Integer right = operandStack.pop();
                Integer left = operandStack.pop();

                operandStack.push(operator.getExpression().apply(left, right));
            } else if(token instanceof Operand) {
                operandStack.push(((Operand) token).getValue());
            } else {
                throw new RuntimeException("Invalid token");
            }
        }

        return operandStack.pop();
    }
}