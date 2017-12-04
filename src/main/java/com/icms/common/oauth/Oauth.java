package com.icms.common.oauth;

import com.icms.common.oauth.util.HttpKitExt;
import com.jfinal.kit.HttpKit;
import com.jfinal.kit.Prop;
import com.jfinal.kit.PropKit;
import com.jfinal.kit.StrKit;
import com.jfinal.log.Log;

import java.util.HashMap;
import java.util.Map;

/**
 * Oauth 授权
 *
 * @author L.cm
 *         email: 596392912@qq.com
 *         site:  http://www.dreamlu.net
 *         date Jun 24, 2013 9:58:25 PM
 */
public abstract class Oauth {
    protected final Log LOGGER = Log.getLog(this.getClass());
    private static transient Prop prop = PropKit.use("oauth.properties");
    private String clientId;
    private String clientSecret;
    private String redirectUri;

    public Oauth() {
        String name = getSelf().getClass().getSimpleName();
        name = StrKit.firstCharToLowerCase(name);
        clientId = prop.get(name + ".openid");
        clientSecret = prop.get(name + ".openkey");
        redirectUri = prop.get(name + ".redirect");
    }

    public abstract Oauth getSelf();

    /**
     * 构造授权的Url
     *
     * @param authorize url
     * @param state     OAuth2.0标准协议建议，利用state参数来防止CSRF攻击。可存储于session或其他cache中
     * @return String 构造完成的url字符串
     */
    protected String getAuthorizeUrl(String authorize, String state) {
        Map<String, String> params = new HashMap<String, String>();
        params.put("response_type", "code");
        params.put("client_id", getClientId());
        params.put("redirect_uri", getRedirectUri());
        if (StrKit.notBlank(state)) {
            params.put("state", state);
        }
        return HttpKitExt.initParams(authorize, params);
    }

    protected String doPost(String url, Map<String, String> params) {
        return HttpKit.post(url, HttpKitExt.map2Url(params));
    }

    protected String doGet(String url, Map<String, String> params) {
        return HttpKit.get(url, params);
    }

    protected String doGetWithHeaders(String url, Map<String, String> headers) {
        return HttpKit.get(url, null, headers);
    }

    public String getClientId() {
        return clientId;
    }

    public String getClientSecret() {
        return clientSecret;
    }

    public String getRedirectUri() {
        return redirectUri;
    }
}
