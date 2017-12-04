package com.icms.common.util;

import java.awt.Color;
import java.io.File;
import java.io.IOException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.log4j.Logger;
import com.alibaba.fastjson.JSON;
import com.icms.common.image.AverageImageScale;
import com.icms.config.AppConfig;
import com.jfinal.kit.PathKit;
import com.jfinal.upload.UploadFile;

import jodd.datetime.JDateTime;

public class UploadUtil {

    protected final static Logger log = Logger.getLogger(UploadUtil.class);
    /*
	 *******************************************************
	 *
	 * 文件上传
	 *
	 *******************************************************
	 */

    /**
     * 获取允许上传的文件类型
     *
     * @return
     */
    public static String getFileAllowType() {
        return AppConfig.system_config.getString("upload_allowType");
    }

    /**
     * 获取上传文件的文件类型
     *
     * @param file
     * @return
     */
    public static String getFileType(String fileName) {
        String type = fileName.substring(fileName.lastIndexOf(".") + 1);
        return type;
    }

    /**
     * 检查文件类型
     *
     * @param fileType
     * @return
     */
    public static boolean checkFileType(String fileType) {
        return getFileAllowType().indexOf(fileType.toLowerCase()) == -1;
    }

    /**
     * 文件上传方法
     *
     * @param files
     * @param path
     * @return
     * @throws IOException
     */
    public static Map<String, Object> uploadFiles(List<UploadFile> files, String domain) throws IOException {

        Map<String, Object> result = new HashMap<String, Object>();
        List<String> filePath = new ArrayList<String>();
        int counter = 0;
        long beginTime = System.currentTimeMillis();
        for (UploadFile uploadFile : files) {

            // 检查上文件的类型
            if (!checkFileType(getFileType(uploadFile.getFileName().toString()))) {
                System.out.println("检查上文件的类型");
                String fileType = getFileType(uploadFile.getFileName().toString());
                String fileName = System.currentTimeMillis() + "." + fileType;
                JDateTime jt = new JDateTime();

                String newName = File.separator + "r" + File.separator + "upload" + File.separator + jt.getYear()
                        + File.separator + jt.getMonth() + File.separator + jt.getDay() + File.separator + fileName;
                log.info("文件绝对路径:" + newName);
                File file = new File(PathKit.getWebRootPath() + newName);
                if (!file.getParentFile().mkdirs()) {
                    // 如果路径不存在,则创建
                    file.getParentFile().mkdirs();
                }
                uploadFile.getFile().renameTo(file);
                log.info("文件绝对路径:" + file.getAbsolutePath() + " 图片类型：" + fileType);
                if (AppConfig.system_config.getBoolean("mark_on") && (CmsUtil.StrEquals(fileType, "jpg")
                        || CmsUtil.StrEquals(fileType, "png") || CmsUtil.StrEquals(fileType, "bmp"))) {
                    log.info("图片水印开启");
                    AverageImageScale.imageMark(file, file, 150, 150, 4, -180, -20,
                            AppConfig.system_config.getString("mark_content"), Color.white, 40, 100);
                }
                // 判断是是否开启七牛云存储，默认为关闭
                System.out.println("QINIU:" + AppConfig.system_config.getBoolean("qiniu_on"));
                if (AppConfig.system_config.getBoolean("qiniu_on")) {
                    log.info("文件绝对路径:" + file.getAbsolutePath());
                    try {
                        QiniuUtil qiniuUtil = new QiniuUtil();
                        fileName = qiniuUtil
                                .getUrl((JSON.parseObject(qiniuUtil.upload(file.getAbsolutePath(), fileName)).get("key")
                                        .toString()));
                        file.delete();
                        log.info("本地文件删除完成！");
                    } catch (Exception e) {
                        file.delete();
                        fileName = "";
                        counter++;
                        log.error("上传文件失败:" + e.getMessage());
                    }
                    filePath.add(fileName);
                } else {
                    filePath.add(domain + newName.replace(File.separator, "/"));
                }
            } else {
                counter++;
                log.info("检测出系统不允许上传的文件类型！");
            }
        }
        long endTime = System.currentTimeMillis();
        log.info("上传文件" + files.size() + "个，失败：" + counter + "用时：" + (endTime - beginTime) + "毫秒");
        result.put("errorCount", counter);
        result.put("filePath", filePath);
        return result;
    }

}
