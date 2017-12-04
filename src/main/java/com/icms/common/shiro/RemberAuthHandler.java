package com.icms.common.shiro;

import org.apache.shiro.authz.AuthorizationException;
import org.apache.shiro.authz.UnauthenticatedException;

public class RemberAuthHandler extends AbstractAuthzHandler {

    public void assertAuthorized() throws AuthorizationException {

        if (!getSubject().isRemembered()) {
            throw new UnauthenticatedException("remberme id failed!");
        }

    }

}
