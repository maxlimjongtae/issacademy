package console;

import console.annotation.Todo;
import console.token.Token;
import console.token.Tokenizer;

import java.util.List;

@Todo
public class Calculator {
    public static void calculate(String input) {
        Tokenizer tokenizer = new Tokenizer();
        List<Token> tokens = tokenizer.tokenize(input);
        tokens.forEach(System.out::println);
    }

    public static void main(String[] args) {
        Calculator.calculate("-4 - 2 - -5 plus -6.6");
    }
}
