package com.icms.cms.base;

import java.io.IOException;
import java.io.InputStreamReader;
import java.io.LineNumberReader;
import java.net.InetAddress;
import java.net.UnknownHostException;

import javax.servlet.http.HttpServletRequest;

import com.icms.common.util.CmsUtil;
import com.jfinal.core.Controller;
import com.jfinal.kit.PathKit;

/**
 * 基础控制器
 * 吗v
 *
 * @author Jin E-mail:jin@westboy.net
 * @version 创建时间：2016年4月22日 下午10:01:58
 */
public class BaseController extends Controller {

    protected final int DEFAULT_SITE_ID = 0;
    protected final String FRONT_PATH = "front";
    protected final String UCENTER_PATH = "ucenter";
    protected final String ADMIN_TEMPLATE_PATH = "system";
    protected final String DEFAULT_TEMPLATE_PATH = "default";
    protected final String DEFAULT_HTML_SUFFIX = "html";
    protected final String STATIC_HTML_PATH = PathKit.getWebRootPath() + "/html/";
    protected final String LIST_ACTION = "l";
    protected final String CONTENT_ACTION = "c";
    protected final String INDEX = "index";
    protected final String LIST = "list";
    protected final String CONTENT = "content";
    protected final String CATEGORY = "category";
    protected final String ALONE = "alone";
    protected final String LOGIN = "login";
    protected final String INDEX_TPL = "index" + "." + DEFAULT_HTML_SUFFIX;
    protected final String LIST_TPL = "list" + "." + DEFAULT_HTML_SUFFIX;
    protected final String CONTENT_TPL = "content" + "." + DEFAULT_HTML_SUFFIX;
    protected final String CATEGORY_TPL = "category" + "." + DEFAULT_HTML_SUFFIX;
    protected final String ALONE_TPL = "alone" + "." + DEFAULT_HTML_SUFFIX;

    protected final static String defaultSaltStr = "icms";


    protected void isNullRender(Object obj) {
        if (CmsUtil.isNullOrEmpty(obj)) {
            renderError(404);
            return;
        }
    }

    protected void renderAdmin(String template) {
        render("/" + ADMIN_TEMPLATE_PATH + "/" + template + "." + DEFAULT_HTML_SUFFIX);
    }

    protected void renderRefreshIframe(String status, String info, String url) {
        setAttr("status", status);
        setAttr("url", url);
        setAttr("info", info);
        render("/common/status" + "." + DEFAULT_HTML_SUFFIX);
        return;
    }

    protected void renderSuccess(String info) {
        setAttr("status", "success");
        setAttr("info", info);
        render("/common/status" + "." + DEFAULT_HTML_SUFFIX);
        return;
    }

    protected void renderError(String info) {
        setAttr("status", "error");
        setAttr("info", info);
        render("/common/status" + "." + DEFAULT_HTML_SUFFIX);
        return;
    }

    protected void renderError(String errorMsg, String errorCode) {
        setAttr("errorCode", errorCode);
        setAttr("errorMsg", errorMsg);
        render("/common/error" + "." + DEFAULT_HTML_SUFFIX);
        return;
    }

    /*
     * 这些好像暂时没用
     */
    protected void renderDefaultIndex(String template) {
        render("/" + FRONT_PATH + "/" + DEFAULT_TEMPLATE_PATH + "/" + INDEX + "/" + template + "."
                + DEFAULT_HTML_SUFFIX);
    }

    protected void renderDefaultCategory(String template) {
        render("/" + FRONT_PATH + "/" + DEFAULT_TEMPLATE_PATH + "/" + CATEGORY + "/" + template + "."
                + DEFAULT_HTML_SUFFIX);
    }

    protected void renderDefaultContent(String template) {
        render("/" + FRONT_PATH + "/" + DEFAULT_TEMPLATE_PATH + "/" + CONTENT + "/" + template + "."
                + DEFAULT_HTML_SUFFIX);
    }

    protected void renderDefaultAlone(String template) {
        render("/" + FRONT_PATH + "/" + DEFAULT_TEMPLATE_PATH + "/" + ALONE + "/" + template + "."
                + DEFAULT_HTML_SUFFIX);
    }

    protected void renderDefaultList(String template) {
        render("/" + FRONT_PATH + "/" + DEFAULT_TEMPLATE_PATH + "/" + LIST + "/" + template + "."
                + DEFAULT_HTML_SUFFIX);
    }

    protected void renderDefault(String template) {
        render("/" + DEFAULT_TEMPLATE_PATH + "/" + template + "." + DEFAULT_HTML_SUFFIX);
    }

    protected void renderDefault(String template, String suffix) {
        render("/" + FRONT_PATH + "/" + DEFAULT_TEMPLATE_PATH + "/" + template + "." + suffix);
    }

    protected void renderPath(String theme, String template) {
        render("/" + FRONT_PATH + "/" + theme + "/" + template);
    }

    protected void renderPath(String path, String subPath, String template) {
        render("/" + FRONT_PATH + "/" + path + "/" + subPath + "/" + template + "." + DEFAULT_HTML_SUFFIX);
    }

    /**
     * post 请求
     *
     * @return
     */
    protected boolean isPost() {
        String requersMethod = getRequest().getMethod();
        if (requersMethod.equals("POST") || "POST".equals(requersMethod)) {
            return true;
        }
        return false;
    }

    /**
     * get请求
     *
     * @return
     */
    protected boolean isGet() {
        String requersMethod = getRequest().getMethod();
        if (requersMethod.equals("GET") || "GET".equals(requersMethod)) {
            return true;
        }
        return false;
    }


    /**
     * 获取项目路径
     *
     * @return 返回项目路径，例如：http://www.ip.com/projectName 后面没有反斜杠，后面接地址或参数必须加/
     */
    protected String getUrl() {
        HttpServletRequest request = getRequest();
        String path = request.getContextPath();
        String basePath = request.getScheme() + "://" + request.getServerName();
        if (request.getServerPort() == 80) {
            basePath += path;
        } else {
            basePath += ":" + request.getServerPort() + path;
        }
        return basePath + "/";
    }

    /**
     * 获取请求域名，域名不包括http请求协议头
     *
     * @return 返回域名地址
     */
    protected String getDomain() {
        HttpServletRequest request = getRequest();
        String path = request.getContextPath();
        String domain = request.getServerName();
        if (request.getServerPort() == 80) {
            domain += path;
        } else {
            domain += ":" + request.getServerPort() + path;
        }
        return domain;
    }

    /**
     * 读取服务器主机信息
     *
     * @return 返回主机信息
     */
    protected String getHost() {
        HttpServletRequest request = getRequest();
        String basePath = request.getServerName();
        if (request.getServerPort() != 80) {
            basePath += ":" + request.getServerPort();
        }
        return basePath;
    }

    /**
     * 读取服务器主机ip信息
     *
     * @return 返回主机IP，异常将会获取不到ip
     */
    protected String getHostIp() {
        InetAddress addr;
        try {
            addr = InetAddress.getLocalHost();
            return addr.getHostAddress().toString();// 获得本机IP
        } catch (UnknownHostException e) {
            e.printStackTrace();
        }
        return "";
    }

    /**
     * Wap网关Via头信息中特有的描述信息
     */
    private static String mobileGateWayHeaders[] = new String[]{"ZXWAP", // 中兴提供的wap网关的via信息，例如：Via=ZXWAP

            // GateWayZTE

            // Technologies，

            "chinamobile.com", // 中国移动的诺基亚wap网关，例如：Via=WTP/1.1

            // GDSZ-PB-GW003-WAP07.gd.chinamobile.com (Nokia

            // WAP Gateway 4.1 CD1/ECD13_D/4.1.04)

            "monternet.com", // 移动梦网的网关，例如：Via=WTP/1.1

            // BJBJ-PS-WAP1-GW08.bj1.monternet.com. (Nokia WAP

            // Gateway 4.1 CD1/ECD13_E/4.1.05)

            "infoX", // 华为提供的wap网关，例如：Via=HTTP/1.1 GDGZ-PS-GW011-WAP2
            // (infoX-WISG

            // Huawei Technologies)，或Via=infoX WAP Gateway V300R001

            // Huawei Technologies

            "XMS 724Solutions HTG", // 国外电信运营商的wap网关，不知道是哪一家

            "wap.lizongbo.com", // 自己测试时模拟的头信息

            "Bytemobile",// 貌似是一个给移动互联网提供解决方案提高网络运行效率的，例如：Via=1.1 Bytemobile OSN

            // WebProxy/5.1

    };

    /**
     * 电脑上的IE或Firefox浏览器等的User-Agent关键词
     */
    private static String[] pcHeaders = new String[]{"Windows 98", "Windows ME", "Windows 2000", "Windows XP",
            "Windows NT", "Ubuntu"};

    /**
     * 手机浏览器的User-Agent里的关键词
     */
    private static String[] mobileUserAgents = new String[]{"Nokia", // 诺基亚，有山寨机也写这个的，总还算是手机，Mozilla/5.0

            // (Nokia5800

            // XpressMusic)UC

            // AppleWebkit(like

            // Gecko)

            // Safari/530

            "SAMSUNG", // 三星手机

            // SAMSUNG-GT-B7722/1.0+SHP/VPP/R5+Dolfin/1.5+Nextreaming+SMM-MMS/1.2.0+profile/MIDP-2.1+configuration/CLDC-1.1

            "MIDP-2", // j2me2.0，Mozilla/5.0 (SymbianOS/9.3; U; Series60/3.2

            // NokiaE75-1 /110.48.125 Profile/MIDP-2.1

            // Configuration/CLDC-1.1 ) AppleWebKit/413 (KHTML like

            // Gecko) Safari/413

            "CLDC1.1", // M600/MIDP2.0/CLDC1.1/Screen-240X320

            "SymbianOS", // 塞班系统的，

            "MAUI", // MTK山寨机默认ua

            "UNTRUSTED/1.0", // 疑似山寨机的ua，基本可以确定还是手机

            "Windows CE", // Windows CE，Mozilla/4.0 (compatible; MSIE 6.0;

            // Windows CE; IEMobile 7.11)

            "iPhone", // iPhone是否也转wap？不管它，先区分出来再说。Mozilla/5.0 (iPhone; U; CPU

            // iPhone OS 4_1 like Mac OS X; zh-cn) AppleWebKit/532.9

            // (KHTML like Gecko) Mobile/8B117

            "iPad", // iPad的ua，Mozilla/5.0 (iPad; U; CPU OS 3_2 like Mac OS X;

            // zh-cn) AppleWebKit/531.21.10 (KHTML like Gecko)

            // Version/4.0.4 Mobile/7B367 Safari/531.21.10

            "Android", // Android是否也转wap？Mozilla/5.0 (Linux; U; Android

            // 2.1-update1; zh-cn; XT800 Build/TITA_M2_16.22.7)

            // AppleWebKit/530.17 (KHTML like Gecko) Version/4.0

            // Mobile Safari/530.17

            "BlackBerry", // BlackBerry8310/2.7.0.106-4.5.0.182

            "UCWEB", // ucweb是否只给wap页面？ Nokia5800

            // XpressMusic/UCWEB7.5.0.66/50/999

            "ucweb", // 小写的ucweb貌似是uc的代理服务器Mozilla/6.0 (compatible; MSIE 6.0;)

            // Opera ucweb-squid

            "BREW", // 很奇怪的ua，例如：REW-Applet/0x20068888 (BREW/3.1.5.20; DeviceId:

            // 40105; Lang: zhcn) ucweb-squid

            "J2ME", // 很奇怪的ua，只有J2ME四个字母

            "YULONG", // 宇龙手机，YULONG-CoolpadN68/10.14 IPANEL/2.0 CTC/1.0

            "YuLong", // 还是宇龙

            "COOLPAD", // 宇龙酷派YL-COOLPADS100/08.10.S100 POLARIS/2.9 CTC/1.0

            "TIANYU", // 天语手机TIANYU-KTOUCH/V209/MIDP2.0/CLDC1.1/Screen-240X320

            "TY-", // 天语，TY-F6229/701116_6215_V0230 JUPITOR/2.2 CTC/1.0

            "K-Touch", // 还是天语K-Touch_N2200_CMCC/TBG110022_1223_V0801 MTK/6223

            // Release/30.07.2008 Browser/WAP2.0

            "Haier", // 海尔手机，Haier-HG-M217_CMCC/3.0 Release/12.1.2007

            // Browser/WAP2.0

            "DOPOD", // 多普达手机

            "Lenovo", // 联想手机，Lenovo-P650WG/S100 LMP/LML Release/2010.02.22

            // Profile/MIDP2.0 Configuration/CLDC1.1

            "LENOVO", // 联想手机，比如：LENOVO-P780/176A

            "HUAQIN", // 华勤手机

            "AIGO-", // 爱国者居然也出过手机，AIGO-800C/2.04 TMSS-BROWSER/1.0.0 CTC/1.0

            "CTC/1.0", // 含义不明

            "CTC/2.0", // 含义不明

            "CMCC", // 移动定制手机，K-Touch_N2200_CMCC/TBG110022_1223_V0801 MTK/6223

            // Release/30.07.2008 Browser/WAP2.0

            "DAXIAN", // 大显手机DAXIAN X180 UP.Browser/6.2.3.2(GUI) MMP/2.0

            "MOT-", // 摩托罗拉，MOT-MOTOROKRE6/1.0 LinuxOS/2.4.20 Release/8.4.2006

            // Browser/Opera8.00 Profile/MIDP2.0 Configuration/CLDC1.1

            // Software/R533_G_11.10.54R

            "SonyEricsson", // 索爱手机，SonyEricssonP990i/R100 Mozilla/4.0

            // (compatible; MSIE 6.0; Symbian OS; 405) Opera

            // 8.65 [zh-CN]

            "GIONEE", // 金立手机

            "HTC", // HTC手机

            "ZTE", // 中兴手机，ZTE-A211/P109A2V1.0.0/WAP2.0 Profile

            "HUAWEI", // 华为手机，

            "webOS", // palm手机，Mozilla/5.0 (webOS/1.4.5; U; zh-CN)

            // AppleWebKit/532.2 (KHTML like Gecko) Version/1.0

            // Safari/532.2 Pre/1.0

            "GoBrowser", // 3g GoBrowser.User-Agent=Nokia5230/GoBrowser/2.0.290

            // Safari

            "IEMobile", // Windows CE手机自带浏览器，

            "WAP2.0"// 支持wap 2.0的

    };

    /**
     * 根据当前请求的特征，判断该请求是否来自手机终端，主要检测特殊的头信息，以及user-Agent这个header
     *
     * @param request HttpServletRequest对象,http请求
     * @return 如果命中手机特征规则，则返回对应的特征字符串
     */
    protected boolean isMobile() {
        HttpServletRequest request = getRequest();
        boolean b = false;
        boolean pcFlag = false;
        boolean mobileFlag = false;
        String via = request.getHeader("Via");
        String userAgent = request.getHeader("user-agent");
        for (int i = 0; via != null && !via.trim().equals("") && i < mobileGateWayHeaders.length; i++) {
            if (via.contains(mobileGateWayHeaders[i])) {
                mobileFlag = true;
                break;
            }
        }
        for (int i = 0; !mobileFlag && userAgent != null && !userAgent.trim().equals("")
                && i < mobileUserAgents.length; i++) {
            if (userAgent.contains(mobileUserAgents[i])) {
                mobileFlag = true;
                break;
            }
        }
        for (int i = 0; userAgent != null && !userAgent.trim().equals("") && i < pcHeaders.length; i++) {
            if (userAgent.contains(pcHeaders[i])) {
                pcFlag = true;
                break;
            }
        }
        if (mobileFlag == true && pcFlag == false) {
            b = true;
        }
        return b;// false pc true shouji

    }

    /**
     * 获取请求客户端ip
     *
     * @param request
     * @return ip地址
     */
    protected String getRemoteAddress() {
        HttpServletRequest request = getRequest();
        String ip = request.getHeader("x-forwarded-for");
        if (ip == null || ip.length() == 0 || ip.equalsIgnoreCase("unknown")) {
            ip = request.getHeader("Proxy-Client-IP");
        }
        if (ip == null || ip.length() == 0 || ip.equalsIgnoreCase("unknown")) {
            ip = request.getHeader("WL-Proxy-Client-IP");
        }
        if (ip == null || ip.length() == 0 || ip.equalsIgnoreCase("unknown")) {
            ip = request.getRemoteAddr();
        }
        return ip;
    }

    /**
     * 获取对应ip地址的mac地址
     *
     * @param ip
     * @return mac地址
     */
    protected String getMACAddress(String ip) {
        String str = "";
        String macAddress = "";
        try {
            Process p = Runtime.getRuntime().exec("nbtstat -A " + ip);
            InputStreamReader ir = new InputStreamReader(p.getInputStream());
            LineNumberReader input = new LineNumberReader(ir);
            for (int i = 1; i < 100; i++) {
                str = input.readLine();
                if (str != null) {
                    if (str.indexOf("MAC Address") > 1) {
                        macAddress = str.substring(str.indexOf("MAC Address") + 14, str.length());
                        break;
                    }
                }
            }
        } catch (IOException e) {
            e.printStackTrace(System.out);
        }
        return macAddress;
    }

}
