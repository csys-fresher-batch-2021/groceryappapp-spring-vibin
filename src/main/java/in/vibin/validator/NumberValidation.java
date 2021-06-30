package in.vibin.validator;

public class NumberValidation {
	private NumberValidation() {
	}
	/**
	 * To check the number is not <=0 The method will return, return true=>If the
	 * number is greater than 0. return false=>If the number is less than or equalto
	 * 0.
	 * 
	 * @param number
	 * @return
	 */
	public static boolean checkInteger(int number) {
		boolean isValid = true;
		if (number <= 0) {
			isValid = false;
		} else {
			isValid = true;
		}
		return isValid;
	}

	/**
	 * To check the number is not <=0.0 The method will return, return true=> If the
	 * number is greater than 0.0 return false=> If the number is less than or
	 * equalto 0.0
	 * 
	 * @param number
	 * @return
	 */
	public static boolean checkDecimal(double price) {
		boolean isValid = true;
		if (price <= 0.0) {
			isValid = false;
		} else {
			isValid = true;
		}
		return isValid;
	}

	/**
	 * This method is used to convert the String into a integer value. And it can
	 * also throw an error message which is given by the user. The method format is,
	 * parseDouble(String number, String errorMessage)
	 * 
	 * @param number
	 * @param errorMessage
	 * @return
	 */
	public static int parseInt(String number, String errorMessage) {
		int value = 0;
		try {
			value = Integer.parseInt(number);
			return value;
		} catch (NumberFormatException e) {
			throw new NumberFormatException(errorMessage);
		}

	}

	/**
	 * This method is used to convert the String into a deimal value. And it can
	 * also throw an error message which is given by the user. The method format is,
	 * parseDouble(String number, String errorMessage)
	 * 
	 * @param number
	 * @param errorMessage
	 * @return
	 */
	public static double parseDouble(String number, String errorMessage) {
		double value = 0;
		try {
			value = Double.parseDouble(number);
			return value;
		} catch (NumberFormatException e) {
			throw new NumberFormatException(errorMessage);
		}

	}
	public static long parseLong(String number, String errorMessage) {
		long value = 0;
		try {
			value = Long.parseLong(number);
			return value;
		} catch (NumberFormatException e) {
			throw new NumberFormatException(errorMessage);
		}

	}
}
