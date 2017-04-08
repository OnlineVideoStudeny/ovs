package stu.ovs.util;

import org.apache.commons.codec.DecoderException;
import org.apache.commons.codec.binary.Hex;
import org.apache.commons.lang3.Validate;

import java.security.SecureRandom;

/**
 * 加密工具类
 */
public class EncryptUtil {

    private static SecureRandom random = new SecureRandom();

    /**
     * 随机生成一个盐的字节数字
     * @param byteSize 数组尺寸，生成的盐的数字的尺寸
     * @return 包含随机盐的字节数组
     */
    public static byte[] salt(int byteSize){
        Validate.isTrue(byteSize>0,"byteSize argument must be a positive integer (1 or larger)",byteSize);
        byte[] bytes = new byte[byteSize];
        random.nextBytes(bytes);
        return bytes;
    }

}
