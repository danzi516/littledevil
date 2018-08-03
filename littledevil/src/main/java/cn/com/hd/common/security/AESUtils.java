package cn.com.hd.common.security;

import java.security.Key;

import org.apache.shiro.codec.Hex;
import org.apache.shiro.crypto.AesCipherService;
import org.bouncycastle.jce.provider.BouncyCastleProvider;
import org.apache.commons.codec.binary.Base64; 
 
import javax.crypto.BadPaddingException; 
import javax.crypto.Cipher; 
import javax.crypto.IllegalBlockSizeException; 
import javax.crypto.NoSuchPaddingException; 
import javax.crypto.spec.IvParameterSpec; 
import javax.crypto.spec.SecretKeySpec; 
import java.io.UnsupportedEncodingException; 
import java.security.*; 
import java.security.spec.InvalidParameterSpecException; 
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
	
	
	  
	  /** 
	   * AES解密 (用于微信)
	   * 
	   * @param data      //密文，被加密的数据 
	   * @param key      //秘钥 
	   * @param iv       //偏移量 
	   * @param encodingFormat //解密后的结果需要进行的编码 
	   * @return 
	   * @throws Exception 
	   */
	 static {  
	        //BouncyCastle是一个开源的加解密解决方案，主页在http://www.bouncycastle.org/  
	        Security.addProvider(new BouncyCastleProvider());  
	    }  
	  public static String decrypt(String data, String key, String iv, String encodingFormat) throws Exception { 
//	    initialize(); 
	 
	    //被加密的数据 
	    byte[] dataByte = Base64.decodeBase64(data); 
	    //加密秘钥 
	    byte[] keyByte = Base64.decodeBase64(key); 
	    //偏移量 
	    byte[] ivByte = Base64.decodeBase64(iv); 
	 
	 
	    try { 
	      Cipher cipher = Cipher.getInstance("AES/CBC/PKCS7Padding"); 
	 
	      SecretKeySpec spec = new SecretKeySpec(keyByte, "AES"); 
	 
	      AlgorithmParameters parameters = AlgorithmParameters.getInstance("AES"); 
	      parameters.init(new IvParameterSpec(ivByte)); 
	 
	      cipher.init(Cipher.DECRYPT_MODE, spec, parameters);// 初始化 
	 
	      byte[] resultByte = cipher.doFinal(dataByte); 
	      if (null != resultByte && resultByte.length > 0) { 
	        String result = new String(resultByte, encodingFormat); 
	        return result; 
	      } 
	      return null; 
	    } catch (NoSuchAlgorithmException e) { 
	      e.printStackTrace(); 
	    } catch (NoSuchPaddingException e) { 
	      e.printStackTrace(); 
	    } catch (InvalidParameterSpecException e) { 
	      e.printStackTrace(); 
	    } catch (InvalidKeyException e) { 
	      e.printStackTrace(); 
	    } catch (InvalidAlgorithmParameterException e) { 
	      e.printStackTrace(); 
	    } catch (IllegalBlockSizeException e) { 
	      e.printStackTrace(); 
	    } catch (BadPaddingException e) { 
	      e.printStackTrace(); 
	    } catch (UnsupportedEncodingException e) { 
	      e.printStackTrace(); 
	    } 
	 
	    return null; 
	  }
	
	
}
