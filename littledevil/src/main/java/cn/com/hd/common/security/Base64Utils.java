package cn.com.hd.common.security;

import java.util.Arrays;
import java.io.UnsupportedEncodingException;

/**
 * 一个速度最快的Base64编码器/解码器的实现。Base64编码定义在RFC2045.
 * @author fengcaizhi
 * @version 1.0
 */
public class Base64Utils {

    private static final char[] CHARS = "ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789+/"
            .toCharArray();
    private static final int[] INV = new int[256];

    static {
        Arrays.fill(INV, -1);
        for (int i = 0, iS = CHARS.length; i < iS; i++) {
            INV[CHARS[i]] = i;
        }
        INV['='] = 0;
    }

    /**
     * Returns Base64 characters, a clone of used array.
     * 返回BASE64字符，用于克隆一个数组
     */
    public static char[] getAlphabet() {
        return CHARS.clone();
    }

    // ---------------------------------------------------------------- char[]

    /**
     * 将字符串编码为字符数组
     * @param s 待编码的字符串
     * @return char[] 编码后的字符数组
     */
    public static char[] encodeToChar(String s) {
        try {
            return encodeToChar(s.getBytes("UTF-8"), false);
        } catch (UnsupportedEncodingException ignore) {
            return null;
        }
    }

    public static char[] encodeToChar(byte[] arr) {
        return encodeToChar(arr, false);
    }

    /**
     * Encodes a raw byte array into a BASE64 <code>char[]</code>.
     * 编码一个原生字节数组为一个BASE64字符数组
     * @param arr 待编码的字节数组
     * @param lineSeparator 是否有行分隔符
     * @return char[] 编码后的字符数组
     */
    public static char[] encodeToChar(byte[] arr, boolean lineSeparator) {
        int len = arr != null ? arr.length : 0;
        if (len == 0) {
            return new char[0];
        }

        int evenlen = (len / 3) * 3;
        int cnt = ((len - 1) / 3 + 1) << 2;
        int destLen = cnt + (lineSeparator ? (cnt - 1) / 76 << 1 : 0);
        char[] dest = new char[destLen];

        for (int s = 0, d = 0, cc = 0; s < evenlen;) {
            int i = (arr[s++] & 0xff) << 16 | (arr[s++] & 0xff) << 8
                    | (arr[s++] & 0xff);

            dest[d++] = CHARS[(i >>> 18) & 0x3f];
            dest[d++] = CHARS[(i >>> 12) & 0x3f];
            dest[d++] = CHARS[(i >>> 6) & 0x3f];
            dest[d++] = CHARS[i & 0x3f];

            if (lineSeparator && (++cc == 19) && (d < (destLen - 2))) {
                dest[d++] = '\r';
                dest[d++] = '\n';
                cc = 0;
            }
        }

        int left = len - evenlen; // 0 - 2.
        if (left > 0) {
            int i = ((arr[evenlen] & 0xff) << 10)
                    | (left == 2 ? ((arr[len - 1] & 0xff) << 2) : 0);

            dest[destLen - 4] = CHARS[i >> 12];
            dest[destLen - 3] = CHARS[(i >>> 6) & 0x3f];
            dest[destLen - 2] = left == 2 ? CHARS[i & 0x3f] : '=';
            dest[destLen - 1] = '=';
        }
        return dest;
    }

    /**
     * Decodes a BASE64 encoded char array.
     * 解码经BASE64编码的字符数组
     * @param arr 待解码的数组
     * @return byte[] 解码后的字节数组
     */
    public byte[] decode(char[] arr) {
        int length = arr.length;
        if (length == 0) {
            return new byte[0];
        }

        int sndx = 0, endx = length - 1;
        int pad = arr[endx] == '=' ? (arr[endx - 1] == '=' ? 2 : 1) : 0;
        int cnt = endx - sndx + 1;
        int sepCnt = length > 76 ? (arr[76] == '\r' ? cnt / 78 : 0) << 1 : 0;
        int len = ((cnt - sepCnt) * 6 >> 3) - pad;
        byte[] dest = new byte[len];

        int d = 0;
        for (int cc = 0, eLen = (len / 3) * 3; d < eLen;) {
            int i = INV[arr[sndx++]] << 18 | INV[arr[sndx++]] << 12
                    | INV[arr[sndx++]] << 6 | INV[arr[sndx++]];

            dest[d++] = (byte) (i >> 16);
            dest[d++] = (byte) (i >> 8);
            dest[d++] = (byte) i;

            if (sepCnt > 0 && ++cc == 19) {
                sndx += 2;
                cc = 0;
            }
        }

        if (d < len) {
            int i = 0;
            for (int j = 0; sndx <= endx - pad; j++) {
                i |= INV[arr[sndx++]] << (18 - j * 6);
            }
            for (int r = 16; d < len; r -= 8) {
                dest[d++] = (byte) (i >> r);
            }
        }

        return dest;
    }

    // ---------------------------------------------------------------- byte

    /**
     * 将字符串编码成BASE64字节数组
     * @param s 待编码的字符串
     * @return byte[] 编码后的字节数组
     */
    public static byte[] encodeToByte(String s) {
        try {
            return encodeToByte(s.getBytes("UTF-8"), false);
        } catch (UnsupportedEncodingException ignore) {
            return null;
        }
    }

    public static byte[] encodeToByte(byte[] arr) {
        return encodeToByte(arr, false);
    }

/**
 * Encodes a raw byte array into a BASE64 <code>byte[]</code>.
 * 编码一个原生字节数组为一个BASE64字符串
 * @param arr 待编码的字节数组
 * @param lineSep 是否有行分隔符
 * @return byte[] 编码后的字节数组
 */
    public static byte[] encodeToByte(byte[] arr, boolean lineSep) {
        int len = arr != null ? arr.length : 0;
        if (len == 0) {
            return new byte[0];
        }

        int evenlen = (len / 3) * 3;
        int cnt = ((len - 1) / 3 + 1) << 2;
        int destlen = cnt + (lineSep ? (cnt - 1) / 76 << 1 : 0);
        byte[] dest = new byte[destlen];

        for (int s = 0, d = 0, cc = 0; s < evenlen;) {
            int i = (arr[s++] & 0xff) << 16 | (arr[s++] & 0xff) << 8
                    | (arr[s++] & 0xff);

            dest[d++] = (byte) CHARS[(i >>> 18) & 0x3f];
            dest[d++] = (byte) CHARS[(i >>> 12) & 0x3f];
            dest[d++] = (byte) CHARS[(i >>> 6) & 0x3f];
            dest[d++] = (byte) CHARS[i & 0x3f];

            if (lineSep && ++cc == 19 && d < destlen - 2) {
                dest[d++] = '\r';
                dest[d++] = '\n';
                cc = 0;
            }
        }

        int left = len - evenlen;
        if (left > 0) {
            int i = ((arr[evenlen] & 0xff) << 10)
                    | (left == 2 ? ((arr[len - 1] & 0xff) << 2) : 0);

            dest[destlen - 4] = (byte) CHARS[i >> 12];
            dest[destlen - 3] = (byte) CHARS[(i >>> 6) & 0x3f];
            dest[destlen - 2] = left == 2 ? (byte) CHARS[i & 0x3f] : (byte) '=';
            dest[destlen - 1] = '=';
        }
        return dest;
    }

    /**
     * Decodes a BASE64 encoded byte array.
     * 解码一个经BASE64编码的字节数组
     */
    public static byte[] decode(byte[] arr) {
        int length = arr.length;
        if (length == 0) {
            return new byte[0];
        }

        int sndx = 0, endx = length - 1;
        int pad = arr[endx] == '=' ? (arr[endx - 1] == '=' ? 2 : 1) : 0;
        int cnt = endx - sndx + 1;
        int sepCnt = length > 76 ? (arr[76] == '\r' ? cnt / 78 : 0) << 1 : 0;
        int len = ((cnt - sepCnt) * 6 >> 3) - pad;
        byte[] dest = new byte[len];

        int d = 0;
        for (int cc = 0, eLen = (len / 3) * 3; d < eLen;) {
            int i = INV[arr[sndx++]] << 18 | INV[arr[sndx++]] << 12
                    | INV[arr[sndx++]] << 6 | INV[arr[sndx++]];

            dest[d++] = (byte) (i >> 16);
            dest[d++] = (byte) (i >> 8);
            dest[d++] = (byte) i;

            if (sepCnt > 0 && ++cc == 19) {
                sndx += 2;
                cc = 0;
            }
        }

        if (d < len) {
            int i = 0;
            for (int j = 0; sndx <= endx - pad; j++) {
                i |= INV[arr[sndx++]] << (18 - j * 6);
            }
            for (int r = 16; d < len; r -= 8) {
                dest[d++] = (byte) (i >> r);
            }
        }

        return dest;
    }

    // ---------------------------------------------------------------- string

    /**
     * 将字符串编码成BASE64字符串
     * @param s	待编码的字符串
     * @return	 String 编码后的字符串
     */
    public static String encodeToString(String s) {
        try {
            return new String(encodeToChar(s.getBytes("UTF-8"), false));
        } catch (UnsupportedEncodingException ignore) {
            return null;
        }
    }

    public static String decodeToString(String s) {
        try {
            return new String(decode(s), "UTF-8");
        } catch (UnsupportedEncodingException ignore) {
            return null;
        }
    }

    public static String encodeToString(byte[] arr) {
        return new String(encodeToChar(arr, false));
    }

    /**
     * 编码一个原生字节数组成为一个BASE64<code>字符串</code>.
     */
    public static String encodeToString(byte[] arr, boolean lineSep) {
        return new String(encodeToChar(arr, lineSep));
    }

    /**
     * 解码一个用BASE64编码的字符串
     */
    public static byte[] decode(String s) {
        int length = s.length();
        if (length == 0) {
            return new byte[0];
        }

        int sndx = 0, endx = length - 1;
        int pad = s.charAt(endx) == '=' ? (s.charAt(endx - 1) == '=' ? 2 : 1)
                : 0;
        int cnt = endx - sndx + 1;
        int sepCnt = length > 76 ? (s.charAt(76) == '\r' ? cnt / 78 : 0) << 1
                : 0;
        int len = ((cnt - sepCnt) * 6 >> 3) - pad;
        byte[] dest = new byte[len];

        int d = 0;
        for (int cc = 0, eLen = (len / 3) * 3; d < eLen;) {
            int i = INV[s.charAt(sndx++)] << 18 | INV[s.charAt(sndx++)] << 12
                    | INV[s.charAt(sndx++)] << 6 | INV[s.charAt(sndx++)];

            dest[d++] = (byte) (i >> 16);
            dest[d++] = (byte) (i >> 8);
            dest[d++] = (byte) i;

            if (sepCnt > 0 && ++cc == 19) {
                sndx += 2;
                cc = 0;
            }
        }

        if (d < len) {
            int i = 0;
            for (int j = 0; sndx <= endx - pad; j++) {
                i |= INV[s.charAt(sndx++)] << (18 - j * 6);
            }
            for (int r = 16; d < len; r -= 8) {
                dest[d++] = (byte) (i >> r);
            }
        }

        return dest;
    }

   public static void main(String[] args) {
       long s = System.nanoTime();
       String str = "The quick brown fox jumps over the lazy dogThe quick brown fox jumps over the lazy dogThe quick brown fox jumps over the lazy dog";
       for(int i=0;i<100000;i++) Base64Utils.encodeToByte(str);
       long e = System.nanoTime();
        System.out.println(e - s);
   }
}