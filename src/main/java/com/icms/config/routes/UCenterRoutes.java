package com.icms.config.routes;

import com.icms.cms.web.ucenter.UcenterController;
import com.jfinal.config.Routes;

public class UCenterRoutes extends Routes {

    @Override
    public void config() {
        add("/uc", UcenterController.class);

    }


}
