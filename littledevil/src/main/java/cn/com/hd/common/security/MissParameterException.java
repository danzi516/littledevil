package cn.com.hd.common.security;

public class MissParameterException extends Exception {
	/**
	 * 
	 */
	private static final long serialVersionUID = 1730044972221972543L;

	public MissParameterException() {
		super();
	}

	/**
	 * @param message
	 * @param cause
	 */
	public MissParameterException(String message, Throwable cause) {
		super(message, cause);
		// TODO Auto-generated constructor stub
	}

	/**
	 * @param message
	 */
	public MissParameterException(String message) {
		super(message);
		// TODO Auto-generated constructor stub
	}

	/**
	 * @param cause
	 */
	public MissParameterException(Throwable cause) {
		super(cause);
		// TODO Auto-generated constructor stub
	}
}
