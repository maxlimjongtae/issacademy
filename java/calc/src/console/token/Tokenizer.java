package console.token;

import console.token.regex.TokenRegex;

import java.util.ArrayList;
import java.util.List;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

public class Tokenizer {
    private List<TokenRegex> regexes;

    public Tokenizer(TokenRegex... regexes) {
        this.regexes = List.of(regexes);
    }

    public Token[] tokenize(final String source) {
        List<TokenLocator> allTokenLocators = new ArrayList<>();

        for (TokenRegex tokenRegex : regexes) {
            allTokenLocators.addAll(getLocators(source, tokenRegex));
        }

        return allTokenLocators.stream().sorted().map(Token::new).toArray(Token[]::new);
    }

    private List<TokenLocator> getLocators(String source, TokenRegex tokenRegex) {
        List<TokenLocator> tokenLocators = new ArrayList<>();

        Matcher matcher = getMatcher(source, tokenRegex.getRegex());
        while (matcher.find()) {
            tokenLocators.add(new TokenLocator(matcher.group(), tokenRegex.getTokenType(), matcher.start()));
        }

        return tokenLocators;
    }

    private Matcher getMatcher(final String source, final String regex) {
        Pattern pattern = Pattern.compile(regex, Pattern.CASE_INSENSITIVE);
        return pattern.matcher(source);
    }
}
