package com.icms.common.util;

import java.io.UnsupportedEncodingException;
import java.math.RoundingMode;
import java.security.MessageDigest;
import java.text.DecimalFormat;
import java.text.MessageFormat;
import java.util.Collection;
import java.util.Map;
import java.util.UUID;

public class CmsUtil {

    public static boolean StrEquals(String str1, String str2) {

        if (isBlank(str1) && isBlank(str2)) {
            return false;
        }

        return str1.equals(str2) || str1 == str2;
    }

    //判断对象是否为空
    public static boolean isNullOrEmpty(Object obj) {
        if (obj == null)
            return true;

        if (obj instanceof CharSequence)
            return ((CharSequence) obj).length() == 0;

        if (obj instanceof Collection)
            return ((Collection<?>) obj).isEmpty();

        if (obj instanceof Map)
            return ((Map<?, ?>) obj).isEmpty();

        if (obj instanceof Object[]) {
            Object[] object = (Object[]) obj;
            if (object.length == 0) {
                return true;
            }
            boolean empty = true;
            for (int i = 0; i < object.length; i++) {
                if (!isNullOrEmpty(object[i])) {
                    empty = false;
                    break;
                }
            }
            return empty;
        }
        return false;
    }

    /**
     * 判断字符串是否为空
     *
     * @param str
     * @return
     */
    public static boolean isBlank(String str) {

        return str == null || str.length() <= 0;
    }


    /**
     * 搜索 XSS过滤
     *
     * @param str
     * @return
     */
    public static String getSearchstr(String str) {

        str = str.trim();
        str = str.replace('<', ' ');
        str = str.replace('>', ' ');
        str = str.replace('"', ' ');
        str = str.replace('\'', ' ');
        str = str.replace('/', ' ');
        str = str.replace('%', ' ');
        str = str.replace(';', ' ');
        str = str.replace('(', ' ');
        str = str.replace(')', ' ');
        str = str.replace('&', ' ');
        str = str.replace('+', '_');
        return str;
    }

    /**
     * 登陆状态Json
     *
     * @param status
     * @param msg
     * @param url
     * @return
     */
    public static String getLoginJson(boolean status, String msg, String url) {

        if (status)
            return "{\"status\":true,\"msg\":\"" + msg + "\",\"url\":\"" + url + "\"}";
        return "{\"status\":false,\"msg\":\"" + msg + "\"}";

    }

    /**
     * 检查结果json 字符串
     *
     * @param status
     * @param msg
     * @return
     */
    public static String getCheckJson(boolean status, String msg) {

        if (status)
            return "{\"ok\":\"" + msg + "!\"}";
        return "{\"error\":\"" + msg + "!\"}";
    }

    /**
     * MessageFormat用来格式化一个消息
     *
     * @param message
     * @param array
     * @return
     */
    public static String messageFormat(String message, String[] array) {
        MessageFormat messageFormat = new MessageFormat(message);
        String value = messageFormat.format(array);
        return value;
    }

    /**
     * 获取文件扩展名
     *
     * @param filename
     * @return
     */
    public static String getExtensionName(String filename) {
        if ((filename != null) && (filename.length() > 0)) {
            int dot = filename.lastIndexOf('.');
            if ((dot > -1) && (dot < (filename.length() - 1))) {
                return filename.substring(dot + 1);
            }
        }
        return filename;
    }

    /**
     * MD5加密处理
     *
     * @param s
     * @return
     */
    public final static String MD5(String s) {
        char hexDigits[] = {'0', '1', '2', '3', '4', '5', '6', '7', '8', '9', 'A', 'B', 'C', 'D', 'E', 'F'};
        try {
            byte[] btInput = s.getBytes();
            /** 获得MD5摘要算法的 MessageDigest 对象 **/
            MessageDigest mdInst = MessageDigest.getInstance("MD5");
            /** 使用指定的字节更新摘要 **/
            mdInst.update(btInput);
            /** 获得密文 **/
            byte[] md = mdInst.digest();
            /** 把密文转换成十六进制的字符串形式 **/
            int j = md.length;
            char str[] = new char[j * 2];
            int k = 0;
            for (int i = 0; i < j; i++) {
                byte byte0 = md[i];
                str[k++] = hexDigits[byte0 >>> 4 & 0xf];
                str[k++] = hexDigits[byte0 & 0xf];
            }
            return new String(str);
        } catch (Exception e) {
            e.printStackTrace();
            return null;
        }
    }

    /**
     * 获取uuid，去除横线
     *
     * @return
     */

    public static String getUUID() {
        UUID uuid = UUID.randomUUID();
        return uuid.toString().replace("-", "");

    }

    /**
     * 转换数字保留2位小数 (非四舍五入)
     *
     * @param str
     * @return
     */
    public static String convertFloat(String str) {
        return formatMoney(str);
    }

    /**
     * 格式化货币 单位：豪 保留2位小数(非四舍五入)
     */
    public static String formatMoney(String str) {
        if (isBlank(str))
            return "0.00";
        Double d = Double.valueOf(str);
        DecimalFormat formater = new DecimalFormat("###,##0.00");
        formater.setRoundingMode(RoundingMode.FLOOR);
        return formater.format(d / 10000);
    }

    /**
     * 格式化数字(非四舍五入)
     *
     * @param num
     * @return
     */
    public static double convertFloat(double num) {
        DecimalFormat df = new DecimalFormat("##0.00");
        df.setRoundingMode(RoundingMode.FLOOR); // 不四舍五入
        return Double.valueOf(df.format(num));
    }

    /**
     * 获得中文字符串
     *
     * @param str
     * @return
     * @throws UnsupportedEncodingException
     */
    public static String getUtf8String(String str) throws UnsupportedEncodingException {
        if (isBlank(str))
            return "";
        return new String(str.getBytes("ISO-8859-1"), "UTF-8");
    }

}
