package console.token;

import console.annotation.Todo;
import console.operator.SignOperator;
import console.operator.StringOperator;
import console.token.regex.OperandTokenRegex;
import console.token.regex.OperatorTokenRegex;
import console.token.regex.TokenRegex;
import console.token.state.TokenState;

import java.util.ArrayList;
import java.util.List;
import java.util.regex.Matcher;
import java.util.regex.Pattern;
import java.util.stream.Collectors;

public class Tokenizer {
    private static final int INDEX_INITIAL_VALUE = 0;
    private static final TokenState DEFAULT_STATE = TokenState.OPERATOR;
    private static final List<TokenRegex> REGEX_LIST = new ArrayList<>() {
        {
            add(new OperandTokenRegex());
            add(new OperatorTokenRegex(new SignOperator()));
            add(new OperatorTokenRegex(new StringOperator()));
        }
    };

    private static final class TokenFinder {
        private int indexPointer = INDEX_INITIAL_VALUE;
        private TokenState currentState = DEFAULT_STATE;
        private boolean isMatch = false;

        private TokenFinder() {

        }

        private static TokenFinder create() {
            return new TokenFinder();
        }

        private void prepareNext(Matcher matcher) {
            indexPointer = matcher.end();
            currentState = currentState.getNextState();
        }
    }

    public List<Token> tokenize(String input) {
        return findTokens(input, TokenFinder.create());
    }

    private List<Token> findTokens(String input, TokenFinder tokenFinder) {
        List<Token> result = new ArrayList<>();

        do {
            @Todo(value = {"state 개수만큼만 돌면 되는디?", "findToken 메서드 빼ㄱ"} )
            Pattern pattern = Pattern.compile(getNextStateRegex(tokenFinder.currentState.getNextState()), Pattern.CASE_INSENSITIVE);
            Matcher matcher = pattern.matcher(input);

            tokenFinder.isMatch = matcher.find(tokenFinder.indexPointer);
            if (tokenFinder.isMatch) {
                result.add(new Token(matcher, tokenFinder.currentState));
                tokenFinder.prepareNext(matcher);
            }
        } while (tokenFinder.isMatch);

        return result;
    }

    private String getNextStateRegex(final TokenState nextState) {
        return REGEX_LIST.parallelStream().filter(regex -> nextState.equals(regex.getState())).map(TokenRegex::getRegex).collect(Collectors.joining("|"));
    }
}
