package com.icms.cms.service;

import java.io.File;
import java.io.IOException;

import org.apache.commons.io.FileUtils;

import com.icms.cms.model.Config;
import com.jfinal.aop.Enhancer;

public class SystemService {

    public static final SystemService service = Enhancer.enhance(SystemService.class);
    public static final String table = "ic_config";

    public Config getConfigById(int id) {
        return Config.dao.findById(id);
    }

    public boolean AddOrUpdate(Config config) {

        if (config.getId() == null) {

            return config.save();
        }
        return config.update();
    }
}
