package com.icms.common.session.impl;

import java.util.UUID;

import com.icms.common.session.BTGSessionIdGenerator;

/**
 * 默认session id生成器：采用uuid
 */
public class BTGUUIDSessionIdGenerator implements BTGSessionIdGenerator {

    @Override
    public String genaeratorSessionId() {
        return UUID.randomUUID().toString().replaceAll("-", "").toUpperCase();
    }

}
