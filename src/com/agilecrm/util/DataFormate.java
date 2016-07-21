package com.agilecrm.util;

import java.text.DateFormat;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;

public class DataFormate {
	public static String ChangeUtilDate(Date date){
		SimpleDateFormat formatter = new SimpleDateFormat("dd/mm/yyyy");
		String format = formatter.format(date);
	    return format;
	}

	public static Date StringToUtilDate(String date){
		DateFormat df = new SimpleDateFormat("dd/mm/yyyy");
		Date startDate=null;
		try {
			startDate = df.parse(date);
		} catch (ParseException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return startDate;
	}
	
}
