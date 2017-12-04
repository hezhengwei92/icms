package com.icms.common.beetl;

import com.jfinal.render.Render;
import com.jfinal.render.RenderException;
import org.beetl.core.GroupTemplate;

public class BeetlRender extends Render {

    private GroupTemplate gt = null;
    private transient static final String encoding = getEncoding();
    private transient static final String contentType = "text/html; charset=" + encoding;

    public BeetlRender(GroupTemplate gt, String view) {
        this.gt = gt;
        this.view = view;
    }

    @Override
    public void render() {

        try {
            response.setContentType(contentType);
            WebRender webRender = new WebRender(gt);
            webRender.render(view, request, response);
        } catch (Exception e) {
            throw new RenderException(e);
        }

    }
}
