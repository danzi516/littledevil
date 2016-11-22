package cn.com.hd.common.security;

import java.security.Key;

import org.apache.shiro.codec.Hex;
import org.apache.shiro.crypto.AesCipherService;

/**
 * DES對稱密鑰加密/解密工具類
 */
public class AESUtils{

	/**
	 * 定義密鑰長度常量，AES加密算法可選密鑰長度為128/192/256，
	 * 但是要注意的是默认安装的JDK或者JRE是不能支持aes192bit密钥和aes256bit密钥两种算法的，
	 * 需要到sun官方下载Java(TM) Cryptography Extension (JCE) Unlimited Strength Jurisdiction Policy Files
	 * 本AES加密實現僅支持128位密鑰
	 */
	private static final int KEY_LENGTH_SHORT = 128;
	
	//private static final int KEY_LENGTH_MIDDLE = 192;
	
	//private static final int KEY_LENGTH_LONG = 256;

	private static AesCipherService aesCipherService;
	
	static{
		aesCipherService = new AesCipherService();
	}
	
	/**
	 * 生成密鑰
	 * @return byte[] 密鑰
	 * @throws InvalidKeyLengthException 無效密鑰長度異常
	 */
	public static byte[] generateKey() throws InvalidKeyLengthException{
		return generateKey(KEY_LENGTH_SHORT);//设置密钥位数为默认的128位
	}
	
	/**
	 * 生成密鑰
	 * @param keyLength 密鑰長度（128/192/256位）
	 * @return byte[] 密鑰字節數組
	 * @throws InvalidKeyLengthException 無效密鑰長度異常
	 */
	public static byte[] generateKey(int keyLength) throws InvalidKeyLengthException{
		if(keyLength != AESUtils.KEY_LENGTH_SHORT
			//	|| keyLength != AESUtils.KEY_LENGTH_MIDDLE
				//|| keyLength != AESUtils.KEY_LENGTH_LONG
				){
			throw new InvalidKeyLengthException();
		}
		aesCipherService.setKeySize(keyLength);//設置密鑰位數
		Key key = aesCipherService.generateNewKey();
		return key.getEncoded();
	}

	/**
	 * 加密
	 * @param data 待加密的數據
	 * @param key 密鑰
	 * @return String 加密後的數據（加密後的密文必須編碼成16進制字符串，否則解密時得不到正確的原文）
	 */
	public static String encrypt(String data, byte[] key){
		String encryptedData = Hex.encodeToString(aesCipherService.encrypt(data.getBytes(), key).getBytes());
		return encryptedData;
	}
	
	/**
	 * 解密
	 * @param data 待解密的數據
	 * @param key 密鑰
	 * @return String 解密後的數據
	 */
	public static String decrypt(String data, byte[] key){
		byte[] decBytes = Hex.decode(data);
		String decData = new String(aesCipherService.decrypt(decBytes, key).getBytes());
		return decData;
	}
}
