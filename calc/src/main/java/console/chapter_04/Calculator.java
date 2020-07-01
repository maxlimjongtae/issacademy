package console.chapter_04;

import console.chapter_04.token.Token;
import console.chapter_04.token.Tokenizer;
import console.chapter_04.type.Operand;
import console.chapter_04.type.Operation;
import console.chapter_04.type.Operator;

import java.util.List;
import java.util.Stack;

/**
 * Chapter 04. 괄호 추가하기
 * <p>
 * condition:
 * 소괄호만
 */
public class Calculator {
    public static void main(String[] args) {
        final String input = "1 + ( 1 - 5 * 1 ) + ( ( 2 - 3 ) - 3 * 4 ) + 2 * 4";

        System.out.println(calculate(input));
    }

    private static Integer calculate(final String input) {
        final List<Token> infixTokenList = Tokenizer.tokenize(input);
        final List<Token> postfixTokenList = Postfix.changeFromInfix(infixTokenList);
        final Stack<Integer> operandStack = new Stack<>();

        System.out.println(postfixTokenList);

        for (Token token : postfixTokenList) {
            if (token instanceof Operator) {
                Operator operator = (Operator) token;

                Integer right = operandStack.pop();
                Integer left = operandStack.pop();

                operandStack.push(Operation.getExpression(operator).apply(left, right));
            } else if (token instanceof Operand) {
                operandStack.push(((Operand) token).getValue());
            } else {
                throw new RuntimeException("Invalid token");
            }
        }

        return operandStack.pop();
    }
}