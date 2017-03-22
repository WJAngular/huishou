import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.List;

public class test1 {

	
	public static void main(String[] args) {
		
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
		
		List<String> dateList = new ArrayList<String>();
		Calendar now = Calendar.getInstance(); 
		
		for(int i=0;i<3;i++){
			now.add(Calendar.DAY_OF_MONTH, 1);
			dateList.add(sdf.format(now.getTime()));
		}
		
		for(String str:dateList){
			System.out.println(str);
		}
		
		
		
		
	}
	
}
