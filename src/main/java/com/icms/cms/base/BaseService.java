package com.icms.cms.base;

import org.apache.log4j.Logger;

public abstract class BaseService {

    protected final Logger log = Logger.getLogger(getClass());

    public abstract void clearCacheAll();
}
