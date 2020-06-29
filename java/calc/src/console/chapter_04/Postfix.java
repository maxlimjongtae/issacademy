package console.chapter_04;

import console.chapter_04.token.Token;
import console.chapter_04.type.Operand;
import console.chapter_04.type.Operator;
import console.chapter_04.type.Priority;

import java.util.ArrayList;
import java.util.List;
import java.util.Stack;

public class Postfix {
    private static boolean isLeftHigherThanRight(Priority left, Priority right) {
        return left.compareTo(right) > 0;
    }

    public static List<Token> changeFromInfix(List<Token> infixTokenList) {
        final List<Token> postfixTokenList = new ArrayList<>();
        final Stack<Operator> operatorStack = new Stack<>();

        for (Token token : infixTokenList) {
            if (token instanceof Operator) {
                Operator operator = (Operator) token;

                if (operatorStack.empty()) {
                    operatorStack.push(operator);
                } else {
                    if (operator.isClose()) {
                        while (!operatorStack.peek().isOpen()) {
                            postfixTokenList.add(operatorStack.pop());
                        }
                        operatorStack.pop();
                    } else {
                        if (!operatorStack.peek().isOpen()) {
                            while (isLeftHigherThanRight(operatorStack.peek().getPriority(), operator.getPriority())) {
                                postfixTokenList.add(operatorStack.pop());
                            }
                        }
                        operatorStack.push(operator);
                    }
                }
            } else if (token instanceof Operand) {
                postfixTokenList.add(token);
            } else {
                throw new RuntimeException("Invalid token");
            }
        }

        while (!operatorStack.empty()) {
            postfixTokenList.add(operatorStack.pop());
        }

        return postfixTokenList;
    }


}
