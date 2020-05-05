package annotation;

public class Service {

	@PrintAnnotation
	public void method1() {
		System.out.println("method1() 실행");
	}
	
//	@PrintAnotation(value="*")
	@PrintAnnotation("*")
	public void method2() {
		System.out.println("method2() 실행");
	}
	@PrintAnnotation(number=20)
	public void method3() {
		System.out.println("method3() 실행");
	}
	
}
