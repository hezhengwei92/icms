package com.icms.common.util;

import java.io.IOException;
import java.io.UnsupportedEncodingException;
import java.net.URLDecoder;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import jodd.http.HttpRequest;
import jodd.http.HttpResponse;

public class SmsUtil {

    private final static Logger log = LoggerFactory.getLogger(SmsUtil.class);

    /**
     * 短信发送
     *
     * @param mobile
     * @param content
     * @return
     * @throws UnsupportedEncodingException
     */
    public static int send(String mobile, String content) {

        String contentUrlencode = null;
        try {
            contentUrlencode = URLDecoder.decode(content, "utf-8").trim();
        } catch (Exception e) {
            log.error(e.getMessage());
        }
        // String username = ReadProperties.getValue("sms.username");
        // String password = ReadProperties.getValue("sms.password");
        String username = "jyw";
        String password = "001asd7";
        String url = "http://sms.myw2k.cn/api/http_api.php?mark=send&username=" + username + "&password=" + password
                + "&mobile=" + mobile + "&content=" + contentUrlencode + "&fstd=2";
        log.info("向" + mobile + "发送短信\n" + url);
        HttpRequest httpRequest = HttpRequest.get(url);
        HttpResponse response = httpRequest.send();
        log.info(response.toString());
        return Integer.parseInt(response.bodyText());

    }

    /**
     * 短信剩余条数查询
     *
     * @return
     * @throws IOException
     */
    public static int balance() {

        // String username = ReadProperties.getValue("sms.username");
        // String password = ReadProperties.getValue("sms.password");
        String username = "jyw";
        String password = "001asd7";
        String url = "http://sms.myw2k.cn/api/http_api.php?mark=Balance&username=" + username + "&password=" + password
                + "&fstd=2";
        HttpRequest httpRequest = HttpRequest.get(url);
        HttpResponse response = httpRequest.send();
        log.info("短信剩余条数：" + response.body());
        return Integer.parseInt(response.bodyText());
    }

    /**
     * 获取短信回复信息
     */
    public static String getReply() {

        // String username = ReadProperties.getValue("sms.username");
        // String password = ReadProperties.getValue("sms.password");
        String username = "jyw";
        String password = "001asd7";
        String url = "http://sms.myw2k.cn/api/http_api.php?mark=getRecv&username=" + username + "&password=" + password;
        HttpRequest httpRequest = HttpRequest.get(url);
        HttpResponse response = httpRequest.send();
        String Text = response.bodyText();
        log.info(response.toString());
        if ("-55".equals(Text))
            return null;
        return Text;

    }

    public static void main(String[] args) throws Exception {

        String msg = "【嘉峪关创世网络科技】你好，您的验证是：0136";

        send("18003785502", msg);
    }

}
