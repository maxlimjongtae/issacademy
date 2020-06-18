package console;

import console.operator.SignOperators;
import console.operator.StringOperators;
import console.structure.Stack;
import console.token.Token;
import console.token.Tokenizer;
import console.token.regex.OperandTokenRegex;
import console.token.regex.OperatorTokenRegex;

import java.util.ArrayList;
import java.util.List;

public class Calculator {
    private static Tokenizer tokenizer = new Tokenizer(
            new OperandTokenRegex(),
            new OperatorTokenRegex(new SignOperators()),
            new OperatorTokenRegex(new StringOperators()));

    public static Token[] toPostfix(Token[] infixTokens) {
        List<Token> operatorStack = new ArrayList<>();
        List<Token> postfixTokens = new ArrayList<>();

        for (Token token : infixTokens) {
            System.out.println(token);

            /*if (token.isOperator()) {
                if (operatorStack.isEmpty()) {
                    operatorStack.add(token);
                } else {
                    operatorStack.get(operatorStack.size() - 1);
                }
            } else {
                postfixTokens.add(token);
            }*/
        }

        return postfixTokens.toArray(Token[]::new);
    }

    public static void main(String[] args) {
        Token[] tokens = tokenizer.tokenize("-1 * -2 add 4.5 plus 3.05 / 54.3");
        toPostfix(tokens);
    }

/*public void getResult(Stack<Token> postfixStack) {
        Stack<Long> operandStack = new Stack<>();
        Stack<Operator> calculatorStack = new Stack<>();

        while (postfixStack.isNotEmpty()) {

            Token current = postfixStack.pop();
            switch (current.getTokenType()) {
                case Operand:
                    operandStack.push(Long.valueOf(current.getValue()));
                    break;
                case Operator:
                    calculatorStack.push(Operator.of(current.getValue()));
                    break;
            }
        }


        while (calculatorStack.isNotEmpty()) {
            operandStack.push(calculatorStack.pop().calculate(operandStack.pop(), operandStack.pop()));
        }

        System.out.println(operandStack.pop());
    }*/
}
