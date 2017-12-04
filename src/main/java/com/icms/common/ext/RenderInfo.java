package com.icms.common.ext;

import java.io.Serializable;

import com.icms.common.beetl.BeetlRender;
import com.icms.common.beetl.BeetlRenderFactory;
import com.jfinal.render.FreeMarkerRender;
import com.jfinal.render.JspRender;
import com.jfinal.render.RedirectRender;
import com.jfinal.render.Render;
import com.jfinal.render.VelocityRender;
import com.jfinal.render.XmlRender;

/**
 * RenderInfo.
 */
public class RenderInfo implements Serializable {

    private static final long serialVersionUID = -7299875545092102194L;

    private String view;
    private Integer renderType;

    public RenderInfo(Render render) {
        if (render == null)
            throw new IllegalArgumentException("Render can not be null.");

        view = render.getView();
        if (render instanceof FreeMarkerRender)
            renderType = RenderType.FREE_MARKER_RENDER;
        else if (render instanceof JspRender)
            renderType = RenderType.JSP_RENDER;
        else if (render instanceof VelocityRender)
            renderType = RenderType.VELOCITY_RENDER;
        else if (render instanceof XmlRender)
            renderType = RenderType.XML_RENDER;
        else if (render instanceof BeetlRender)
            renderType = RenderType.BEETL_RENDER;
        else if (render instanceof RedirectRender)
            renderType = RenderType.REDIRECT_RENDER;
        else
            throw new IllegalArgumentException("CacheInterceptor can not support the render of the type : " + render.getClass().getName());
    }

    public Render createRender() {
        if (renderType == RenderType.FREE_MARKER_RENDER)
            return new FreeMarkerRender(view);
        else if (renderType == RenderType.JSP_RENDER)
            return new JspRender(view);
        else if (renderType == RenderType.VELOCITY_RENDER)
            return new VelocityRender(view);
        else if (renderType == RenderType.XML_RENDER)
            return new XmlRender(view);
        else if (renderType == RenderType.BEETL_RENDER)
            return new BeetlRenderFactory().getRender(view);
        else if (renderType == RenderType.REDIRECT_RENDER)
            return new RedirectRender(view);
        throw new IllegalArgumentException("CacheInterceptor can not support the renderType of the value : " + renderType);
    }
}
