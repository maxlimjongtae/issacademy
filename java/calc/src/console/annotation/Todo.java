package console.annotation;

public @interface Todo {
    String[] value() default "";
}
