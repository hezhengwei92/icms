package com.icms.common.util;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import com.jfinal.kit.PropKit;

import jodd.mail.Email;
import jodd.mail.SendMailSession;
import jodd.mail.SmtpServer;
import jodd.mail.SmtpSslServer;

public class EmailUtil {

    private final static Logger log = LoggerFactory.getLogger(EmailUtil.class);

    /**
     * 普通邮件
     *
     * @param email
     * @return
     */
    public static String SendEmail(Email email) {

        SmtpServer<?> smtpServer = SmtpServer.create(PropKit.use("application.properties").get("email.host"))
                .authenticateWith(PropKit.use("application.properties").get("email.username"), PropKit.use("application.properties").get("email.password"));
        SendMailSession session = smtpServer.createSession();
        log.info("Send Email Begin!");
        log.info("host:" + PropKit.use("application.properties").get("email.host"));
        log.info("user:" + PropKit.use("application.properties").get("email.username"));
        session.open();
        String status = session.sendMail(email);
        session.close();
        log.info(status);
        log.info("Send Email End!");
        return status;

    }

    /**
     * 加密邮件
     *
     * @param email
     * @return
     */
    public static String SendSSLEmail(Email email) {

        SmtpServer<?> smtpServer = SmtpSslServer
                .create(PropKit.use("application.properties").get("email.host"), PropKit.use("application.properties").getInt("email.port"))
                .authenticateWith(PropKit.use("application.properties").get("email.username"), PropKit.use("application.properties").get("email.password"));
        SendMailSession session = smtpServer.createSession();
        log.info("Send SSL Email Begin!");
        log.info("host:" + PropKit.use("application.properties").get("email.host"));
        log.info("port:" + PropKit.use("application.properties").getInt("email.port"));
        log.info("user:" + PropKit.use("application.properties").get("email.username"));
        session.open();
        String status = session.sendMail(email);
        session.close();
        log.info(status);
        log.info("Send SSL Email End!");
        return status;

    }

    public static void main(String[] args) {
        Email email = Email.create().from("system@gs365.net").to("251383120@qq.com").subject("Hello SSL Send!")
                .addHtml("<b>HTML</b> message");
        System.out.println(SendSSLEmail(email));
    }
}
