import java.io.File;
import java.io.FileNotFoundException;
import java.io.PrintWriter;
import java.text.SimpleDateFormat;
import java.util.Date;

public class test3 {
	public static void main(String[] args) throws FileNotFoundException {

		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
		File f = new File("D:\\MyDisk\\working\\waybill\\src\\database\\20161031\\20161031\\01_SQL\\test.sql");
		PrintWriter pw = new PrintWriter(f);
		
		
		for(int i=0;i<700;i++){
			String str = "PARTITION pfilename VALUES LESS THAN (TO_DATE('datestr','YYYY-MM-DD')) TABLESPACE DATASYNC_DAT_TS1,";
			str = str.replace("filename", DateUtil.addDate1(sdf.format(new Date()), i));
			str = str.replace("datestr", DateUtil.addDate(sdf.format(new Date()), i));
			pw.println(str);
			pw.flush();
		}
		
		
		
	}
}
