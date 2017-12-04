package com.icms.common.shiro;

import org.apache.shiro.crypto.hash.SimpleHash;

public final class PasswordHelper {

    private static String hashAlgorithmName = "SHA-256";
    private static int hashIterations = 2;
    private static boolean storedCredentialsHexEncoded = true;

    private PasswordHelper() {
        throw new Error("工具类不能实例化！");
    }

    /**
     * 将输入的密码进行特殊处理，防止密码轻易被破解，增强应用的安全性 密码 + 常量 +用户名
     *
     * @param password 需要加密的字符串
     * @param username 用户名
     * @param salt     加密盐
     * @return 返回加密后的密码字符串
     */
    public static String encodePassword(String password, String username, String salt) {
        if (storedCredentialsHexEncoded) {
            return new SimpleHash(hashAlgorithmName, password, salt, hashIterations).toHex();
        } else {
            return new SimpleHash(hashAlgorithmName, password, salt, hashIterations).toString();
        }
    }

    /**
     * 判断输入的密码是否与应用中存储的密码相符合。因为应用中存储的密码是由输入的密码经过特殊处理后生成的，
     * 所以需要我们自己定义如何判断输入的密码和存储的密码的一致性
     *
     * @param encPass  加密后的字符串
     * @param password 需要加密的字符串
     * @param username 用户名
     * @param userSalt 加密盐
     * @return 加密后的字符串和传入的字符串是否相同
     */
    public static boolean isPasswordValid(String encPass, String password, String username, String userSalt) {
        if (storedCredentialsHexEncoded) {
            return new SimpleHash(hashAlgorithmName, password, userSalt + username, hashIterations).toHex()
                    .equals(encPass);
        } else {
            return new SimpleHash(hashAlgorithmName, password, userSalt + username, hashIterations).toString()
                    .equals(encPass);
        }
    }

    public static void main(String[] args) {

        System.out.println("encodePassword：" + encodePassword("123456", "admin", "admin"));

    }
}
