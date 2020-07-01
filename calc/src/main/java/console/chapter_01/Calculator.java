package console.chapter_01;

import java.util.ArrayList;
import java.util.List;

/**
 * Chapter 01. 더하기/빼기의 결과를 출력하기
 *
 * condition:
 * 양수만 입력 받고 이상한 수식이 들어오지 않음을 가정
 */
public class Calculator {
    public static void main(String[] args) {
        String input = "11 + 30 - 26 - 10";

        char[] chars = input.replaceAll(" ", "").toCharArray();
        StringBuilder digit = new StringBuilder();

        List<Character> operatorList = new ArrayList<>();
        List<Integer> operandList = new ArrayList<>();

        for (int i = 0; i < chars.length; i++) {
            char character = chars[i];

            switch (character) {
                case '+':
                case '-':
                    operatorList.add(character);
                    operandList.add(toOperand(digit));

                    digit.setLength(0);
                    break;
                default:
                    digit.append(character);
                    break;
            }
        }
        operandList.add(toOperand(digit));

        Integer result = operandList.get(0);

        for (int i = 0; i < operatorList.size(); i++) {
            Character operator = operatorList.get(i);
            Integer next = operandList.get(i + 1);

            result = calculate(result, next, operator);
        }

        System.out.println(operandList);
        System.out.println(operatorList);
        System.out.println(result);
    }

    private static Integer toOperand(StringBuilder digit) {
        return Integer.valueOf(digit.toString());
    }

    private static Integer calculate(Integer prev, Integer next, Character operator) {
        switch (operator) {
            case '+':
                return prev + next;
            case '-':
                return prev - next;
            default:
                throw new RuntimeException("Invalid operator.");
        }
    }
}
