package iqnnfacloud;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.GregorianCalendar;

public class maintest {

	public static void main(String[] args) {
		// TODO Auto-generated method stub
		Date date = new Date();
		SimpleDateFormat format = new SimpleDateFormat("yyyy年MM月dd日");
		//GregorianCalendar gc = new GregorianCalendar();
		String string = format.format(date);
		System.out.println(string);
	}

}
