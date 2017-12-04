package com.icms.common.util;

import java.io.IOException;

import org.apache.log4j.Logger;

import com.icms.config.AppConfig;
import com.qiniu.common.QiniuException;
import com.qiniu.http.Response;
import com.qiniu.storage.BucketManager;
import com.qiniu.storage.UploadManager;
import com.qiniu.util.Auth;

/**
 * 七牛云存储上传
 *
 * @author Jin E-mail:jin@westboy.net
 * @version 创建时间：2016年4月22日 下午10:00:48
 */
public class QiniuUtil {

    private final Logger log = Logger.getLogger(this.getClass());

    public Auth getAuth() {
        return Auth.create(AppConfig.system_config.getString("qiniu_accessKey"),
                AppConfig.system_config.getString("qiniu_secretKey"));
    }

    public String getUrl(String key) {
        return AppConfig.system_config.getString("qiniu_url") + "/" + key;
    }

    public String getbucketName() {
        return AppConfig.system_config.getString("qiniu_bucketName").trim();
    }

    public String getUpToken() {
        return getAuth().uploadToken(getbucketName());
    }

    public String upload(String filePath, String fileName) throws IOException {
        log.info("七牛云存储上传开始！");
        long begin = System.currentTimeMillis();
        // 创建上传对象
        UploadManager uploadManager = new UploadManager();
        String info = null;
        try {
            // 调用put方法上传
            Response res = uploadManager.put(filePath, fileName, getUpToken());
            info = res.bodyString();
            log.info("文件上传成功！");
        } catch (QiniuException e) {
            Response r = e.response;
            // 请求失败时打印的异常的信息
            try {
                // 响应的文本信息
                log.error(r.bodyString());
            } catch (QiniuException e1) {
                // ignore
                log.error(e1.getMessage());
            }
        }
        long end = System.currentTimeMillis();
        log.info("用时：" + (end - begin) + "毫秒");
        return info;
    }

    public String uploadUrl(String key) {

        return getAuth().privateDownloadUrl(getUrl(key), 3600);

    }

    // 私有类型使用
    public String download(String key) {

        return getAuth().privateDownloadUrl(getUrl(key), 3600);

    }

    public boolean delete(String key) {
        BucketManager bucketManager = new BucketManager(getAuth());
        boolean status = false;
        try {
            // 调用delete方法移动文件
            bucketManager.delete(getbucketName(), key);
            status = true;
        } catch (QiniuException e) {
            // 捕获异常信息
            Response r = e.response;
            log.info(r.toString());
        }
        return status;
    }

}
