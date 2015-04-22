package structure;

public class Triple<A, B, C> {
	private A arg1;
	private B arg2;
	private C arg3;

	public Triple(A arg1, B arg2, C arg3) {
		super();
		this.arg1 = arg1;
		this.arg2 = arg2;
		this.arg3 = arg3;
	}

	public A getArg1() {
		return arg1;
	}

	public B getArg2() {
		return arg2;
	}

	public C getArg3() {
		return arg3;
	}

	@Override
	public String toString() {
		return String.format("(%s, %s, %s)", arg1.toString(), arg2.toString(),
				arg3.toString());
	}
	
	public static void main(String[] agrs){
		String str = "视纪录[1-2]";
		str = str.replaceAll("\\[(\\d|-|,)*\\]", "");
		String[] split =  str.split("\\|\\|\\|");
		for (String string : split) {
			System.out.println(string);
		}
		
	}

}
