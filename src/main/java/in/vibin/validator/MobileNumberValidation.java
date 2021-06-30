package in.vibin.validator;

import java.util.regex.Matcher;
import java.util.regex.Pattern;

public class MobileNumberValidation {
	private MobileNumberValidation() {
	}
	/**
	 * It is used to check the mobile number.
	 * 
	 * @param mobileNumber
	 * @return
	 */
	public static boolean checkMobileNumber(long mobileNumber) {
		boolean isValidPattern=false;
		String mobileNumberString = Long.toString(mobileNumber);
		Pattern p = Pattern.compile("[6-9][0-9]{9}");
		Matcher m = p.matcher(mobileNumberString);
		isValidPattern = (m.find() && m.group().equals(mobileNumberString));
		return isValidPattern;
	}
}