package com.icms.common.oauth;

import com.alibaba.fastjson.JSON;
import com.alibaba.fastjson.JSONObject;
import com.icms.common.oauth.util.TokenUtil;
import com.jfinal.kit.StrKit;

import java.util.HashMap;
import java.util.Map;


public class OauthBaidu extends Oauth {
    private static final String AUTH_URL = "https://openapi.baidu.com/oauth/2.0/authorize";
    private static final String TOKEN_URL = "https://openapi.baidu.com/oauth/2.0/token";
    private static final String USER_INFO_URL = "https://openapi.baidu.com/rest/2.0/passport/users/getInfo";

    private static OauthBaidu oauthBaidu = new OauthBaidu();

    private OauthBaidu() {
    }

    /**
     * 用于链式操作
     *
     * @return OauthBaidu
     */
    public static OauthBaidu me() {
        return oauthBaidu;
    }

    /**
     * 获取授权url
     *
     * @param state OAuth2.0标准协议建议，利用state参数来防止CSRF攻击
     * @return String url
     */
    public String getAuthorizeUrl(String state) {
        return super.getAuthorizeUrl(AUTH_URL, state);
    }

    /**
     * 获取token
     *
     * @param code 使用code换取token
     * @return String 返回类型
     */
    public String getTokenByCode(String code) {
        Map<String, String> params = new HashMap<String, String>();
        params.put("code", code);
        params.put("client_id", getClientId());
        params.put("client_secret", getClientSecret());
        params.put("grant_type", "authorization_code");
        params.put("redirect_uri", getRedirectUri());
        String token = TokenUtil.getAccessToken(super.doPost(TOKEN_URL, params));
        LOGGER.debug(token);
        return token;
    }

    /**
     * 获取UserInfo
     *
     * @param accessToken AccessToken
     * @return String 返回类型
     */
    public String getUserInfo(String accessToken) {
        Map<String, String> params = new HashMap<String, String>();
        params.put("access_token", accessToken);
        return super.doPost(USER_INFO_URL, params);
    }

    /**
     * 根据code一步获取用户信息
     *
     * @param code oauth code
     * @return JSONObject返回类型
     */
    public JSONObject getUserInfoByCode(String code) {
        String accessToken = getTokenByCode(code);
        if (StrKit.isBlank(accessToken)) {
            throw new RuntimeException("accessToken is Blank!");
        }
        String userInfo = getUserInfo(accessToken);
        JSONObject dataMap = JSON.parseObject(userInfo);
        dataMap.put("access_token", accessToken);
        return dataMap;
    }

    @Override
    public Oauth getSelf() {
        return this;
    }
}
