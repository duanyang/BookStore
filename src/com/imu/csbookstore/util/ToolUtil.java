package com.imu.csbookstore.util;

import java.text.SimpleDateFormat;
import java.util.Date;

public class ToolUtil {

	public static String getNowDate() {
		Date now = new Date();
		SimpleDateFormat df = new SimpleDateFormat("yyyy-MM-dd HH:mm");
		String nowTime = df.format(now);
		// System.out.println("----date:"+nowTime);
		return nowTime;
	}

	public static int getRandInt() {
		int randomInt = 0;
		java.util.Random r = new java.util.Random();
		while (true) {
			randomInt = r.nextInt();
			if (randomInt >= 0)
				break;
		}
		return randomInt;

	}
}
