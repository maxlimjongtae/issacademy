package console.structure;

import java.util.ArrayList;
import java.util.StringJoiner;

public final class Stack<T> {
    private ArrayList<T> elements;

    public Stack() {
        this.elements = new ArrayList<>();
    }

    public boolean isNotEmpty() {
        return !elements.isEmpty();
    }

    public void push(T element) {
        elements.add(element);
    }

    public T pop() {
        if (isNotEmpty()) {
            return elements.remove(elements.size() - 1);
        } else {
            throw new RuntimeException("Stack is empty");
        }
    }

    @Override
    public String toString() {
        StringJoiner joiner = new StringJoiner(", ");
        for (int i = 0; i <= elements.size(); i++) {
            joiner.add(elements.get(i).toString());
        }
        return joiner.toString();
    }
}
