package stu.ovs.util;

import org.apache.commons.codec.binary.Hex;
import org.apache.shiro.crypto.hash.Sha1Hash;
import java.security.MessageDigest;

/**
 * hash 集
 */
public class HashKit {

    public static String sha1(String salt, String srcStr,int iterations){
        return hash("SHA-1",salt ,srcStr,iterations);
    }

    public static String sha1(String salt, String srcStr){
        return hash(salt, srcStr,1);
    }

    /**
     * 对字符串进行散列，支持md5与sha算法
     * @param algorithm 算法
     * @param salt 盐
     * @param srcStr 要加密的字符串
     * @param iterations 迭代次数
     * @return 加密后的字符串
     */
    public static String hash(String algorithm, String salt, String srcStr,int iterations) {
        try {
            MessageDigest md = MessageDigest.getInstance(algorithm);
            byte[] bytes = md.digest(srcStr.getBytes("utf-8"));
            for (int i = 0;i<iterations;i++){
                md.reset();
                bytes = md.digest(bytes);
            }
           return Hex.encodeHexString(bytes);
        }
        catch (Exception e) {
            throw new RuntimeException(e);
        }
    }

    /**
     * 对字符串进行sha-1散列算法
     * @param salt 盐
     * @param srcStr 要加密的字符串
     * @param hashIterations 迭代次数
     * @return 加密后的字符串
     */
    public static String hash(String salt, String srcStr, int hashIterations) {
        byte[] str=new Sha1Hash(srcStr,salt,hashIterations).getBytes();
        return Hex.encodeHexString(str);
    }

}
