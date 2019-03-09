package com.atyou.util;

import java.util.Calendar;
import java.util.Date;

import org.apache.commons.lang3.time.DateUtils;

public class DateUtil {

	public static Date endOfDay(Date d) {
		return DateUtils.addSeconds(
				DateUtils.addDays(DateUtils.truncate(d, Calendar.DATE), 1), -1);
	}

	/*
	 * 两个时间间隔的秒数
	 */
	public static long secondsBetween(Date d1, Date d2) {
		return Math.abs((d1.getTime() - d2.getTime())/1000);
	}
	
}
