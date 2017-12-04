package com.icms.config.routes;

import com.icms.cms.web.index.IndexController;
import com.jfinal.config.Routes;

public class HomeRoutes extends Routes {

    @Override
    public void config() {
        add("/", IndexController.class);
        add("/upload", com.icms.cms.web.admin.UploadController.class);
    }

}
