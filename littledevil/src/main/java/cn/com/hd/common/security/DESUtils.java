package cn.com.hd.common.security;

import java.security.InvalidKeyException;
import java.security.Key;
import java.security.NoSuchAlgorithmException;
import java.security.SecureRandom;
import java.security.spec.InvalidKeySpecException;

import javax.crypto.BadPaddingException;
import javax.crypto.Cipher;
import javax.crypto.IllegalBlockSizeException;
import javax.crypto.KeyGenerator;
import javax.crypto.NoSuchPaddingException;
import javax.crypto.SecretKey;
import javax.crypto.SecretKeyFactory;
import javax.crypto.spec.DESKeySpec;

/**
 * DES對稱密鑰加密/解密工具類
 */
public class DESUtils {

	private final static String ALGORITHM = "DES";
	/**
	 * 加密
	 * @param src 待加密的字節數組
	 * @param key 密鑰，長度必須是8的倍數
	 * @return	  加密後的字節數組
	 * @throws InvalidKeyException 無效密鑰異常
	 * @throws NoSuchAlgorithmException 無效算法異常
	 * @throws InvalidKeySpecException 無效密鑰規格異常
	 * @throws NoSuchPaddingException 無效填充異常
	 * @throws BadPaddingException 壞的填充異常
	 * @throws IllegalBlockSizeException 非法塊大小異常
	 */
	public static byte[] encrypt(byte[] src, byte[] key)
			throws InvalidKeyException, NoSuchAlgorithmException,
			InvalidKeySpecException, NoSuchPaddingException,
			IllegalBlockSizeException, BadPaddingException {
		SecureRandom sr = new SecureRandom(); // DES算法要求有一个可信任的随机数源
		DESKeySpec dks = new DESKeySpec(key);// 从原始密匙数据创建DESKeySpec对象
		// 创建一个密匙工厂，然后用它把DESKeySpec转换成一个SecretKey对象
		SecretKeyFactory keyFactory = SecretKeyFactory.getInstance(ALGORITHM);
		SecretKey securekey = keyFactory.generateSecret(dks);
		// Cipher对象实际完成加密操作
		Cipher cipher = Cipher.getInstance(ALGORITHM); // 用密匙初始化Cipher对象
		cipher.init(Cipher.ENCRYPT_MODE, securekey, sr); // 設置為加密模式
		return cipher.doFinal(src);// 执行加密操作
	}
	
	/**
	 * 解密
	 * @param src	待解密的字節數組
	 * @param key	密鑰，長度必須是8的倍數
	 * @return		解密後的原始字節數組
	 * @throws InvalidKeyException 無效密鑰異常
	 * @throws NoSuchAlgorithmException 無效算法異常
	 * @throws InvalidKeySpecException 無效密鑰規格異常
	 * @throws NoSuchPaddingException 無效填充異常
	 * @throws BadPaddingException 壞的填充異常
	 * @throws IllegalBlockSizeException 非法塊大小異常
	 */
	public static byte[] decrypt(byte[] src, byte[] key) throws InvalidKeyException, NoSuchAlgorithmException, InvalidKeySpecException, NoSuchPaddingException, IllegalBlockSizeException, BadPaddingException{			
			SecureRandom srandom = new SecureRandom();//DES算法要求有一个可信任的随机数源			
			DESKeySpec dks = new DESKeySpec(key);// 从原始密匙数据创建一个DESKeySpec对象
			SecretKeyFactory keyFactory = SecretKeyFactory.getInstance(ALGORITHM);// 创建一个密匙工厂
			SecretKey securekey = keyFactory.generateSecret(dks);// 創建一个SecretKey对象
			Cipher cipher = Cipher.getInstance(ALGORITHM);// 指定算法
			cipher.init(Cipher.DECRYPT_MODE, securekey, srandom);// 設置為解密模式並使用密鑰和安全隨機數解密
			return cipher.doFinal(src);// 解密
	}
    /**
     * 解密
     * @param data 待解密字符串
     * @param key 密鑰
     * @return String 解密後的字符串
     * @throws BadPaddingException 壞的填充異常
     * @throws IllegalBlockSizeException 非法塊大小異常
     * @throws NoSuchPaddingException 無效填充異常
     * @throws InvalidKeySpecException 無效密鑰規格異常
     * @throws NoSuchAlgorithmException 無效算法異常
     * @throws InvalidKeyException 無效密鑰異常
     */
	public final static String decrypt(String data, String key)
			throws InvalidKeyException, NoSuchAlgorithmException,
			InvalidKeySpecException, NoSuchPaddingException,
			IllegalBlockSizeException, BadPaddingException {
		return new String(decrypt(StringUtils.hex2byte(data.getBytes()), key.getBytes()));
	}
    /**
     * 加密
     * @param data 待加密的字符串
     * @param key 密鑰
     * @return String 加密後的字符串
     * @throws BadPaddingException 壞的填充異常
     * @throws IllegalBlockSizeException 非法塊大小異常
     * @throws NoSuchPaddingException 無效填充異常
     * @throws InvalidKeySpecException 無效密鑰規格
     * @throws NoSuchAlgorithmException 無效算法異常
     * @throws InvalidKeyException 無效密鑰異常
     */
    public final static String encrypt(String data, String key) throws InvalidKeyException, NoSuchAlgorithmException, InvalidKeySpecException, NoSuchPaddingException, IllegalBlockSizeException, BadPaddingException{
    	if(data!=null)
            return StringUtils.byte2hex(encrypt(data.getBytes(),key.getBytes()));
		return null;
  }
    
    /**
     * 生成密鑰
     * @return String 生成的密鑰
     * @throws NoSuchAlgorithmException 無效算法異常
     */
    public final static String generatKey() throws NoSuchAlgorithmException{
    	SecureRandom srandom = SecureRandom.getInstance("SHA1PRNG");//構建可信任的随机数源
    	KeyGenerator keyGen = KeyGenerator.getInstance(ALGORITHM);
    	keyGen.init(srandom);
    	byte[] key = keyGen.generateKey().getEncoded();
    	System.out.println(key);
    	String keyString = new String(key);
    	System.out.println(keyString);
    	byte[] deKeyString = keyString.getBytes();
    	System.out.println(deKeyString);
    	return keyString;
    }
}
