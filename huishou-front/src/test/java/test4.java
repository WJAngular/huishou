import java.util.ArrayList;
import java.util.List;

public class test4 {

	
	
	public static void main(String[] args) {
		
		
		List<String> list1 = new ArrayList<String>();
		list1.add("9");
		list1.add("7");
		
		List<String> list2 = new ArrayList<String>();
		list2.add("1");
		list2.add("2");
		list2.add("3");
		list2.add("9");
		list2.add("5");
		list2.add("6");
		list2.add("7");
		list2.add("8");
		
		System.out.println(list1.containsAll(list2));
		
		
	}
}
