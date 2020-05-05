package annotation;

import java.lang.annotation.ElementType;
import java.lang.annotation.Retention;
import java.lang.annotation.RetentionPolicy;
import java.lang.annotation.Target;

@Target(ElementType.METHOD)		//소스 레벨상에서 위치는 메소드
@Retention(RetentionPolicy.RUNTIME)		//적용 시점은 런타임시점에 의미를 부여하겠다
public @interface PrintAnnotation {
	String value() default "-";		//디폴트 엘리먼트
	int number() default 15;
	
	
}
