package com.icms.common.beetl;

import com.icms.common.beetl.function.FindPermissionByPid;
import com.icms.common.beetl.function.GetChildMenuByPid;
import com.icms.common.beetl.function.GetPermissionByPid;
import com.icms.common.beetl.function.PrintAdminName;
import com.icms.common.beetl.function.SplitString;
import com.icms.common.beetl.tag.ChannelListTag;
import com.icms.common.beetl.tag.ChannelTag;
import com.icms.common.beetl.tag.ContentAndModel;
import com.icms.common.beetl.tag.ContentListTag;
import com.icms.common.beetl.tag.ContentPageTag;
import com.icms.common.beetl.tag.ContentTag;
import com.icms.common.beetl.tag.LucentPageTag;
import com.icms.common.beetl.tag.ModelFiledFindTag;
import com.icms.common.beetl.tag.PaginationTag;
import com.icms.common.beetl.tag.ShiroTag;
import com.icms.common.beetl.tag.SliderTag;
import com.icms.common.beetl.tag.TagListTag;
import com.icms.common.beetl.tag.TopicListTag;
import com.jfinal.kit.PathKit;
import com.jfinal.render.IMainRenderFactory;
import com.jfinal.render.Render;
import org.beetl.core.Configuration;
import org.beetl.core.GroupTemplate;
import org.beetl.core.resource.FileResourceLoader;

import java.io.File;
import java.io.IOException;
import java.util.HashMap;
import java.util.Map;

public class BeetlRenderFactory implements IMainRenderFactory {
    public static String viewExtension = ".html";
    public static GroupTemplate gt = null;
    public static Map<String, Object> siteVar = new HashMap<String, Object>();

    public BeetlRenderFactory() {

        String file = PathKit.getWebRootPath() + File.separator + "WEB-INF" + File.separator + "t";
        Configuration cfg;

        try {
            cfg = Configuration.defaultConfiguration();
            cfg.setCharset("UTF-8");
            //千万不要在定界符里使用占位符号
            cfg.setPlaceholderStart("${");//占位符 取值用
            cfg.setPlaceholderEnd("}");
            cfg.setStatementStart("@");//定界符  在定界符之间写Beetl语句
            cfg.setStatementEnd(null);
            FileResourceLoader resourceLoader = new FileResourceLoader(file);
            gt = new GroupTemplate(resourceLoader, cfg);
//			gt.setErrorHandler(new WebErrorHandler());
            gt.registerFunctionPackage("so", new ShiroTag());
            gt.registerFunction("SplitStr", new SplitString());
            gt.registerFunction("printAdminName", new PrintAdminName());
            gt.registerFunction("findPermission", new FindPermissionByPid());
            gt.registerFunction("getChildMenuByPid", new GetChildMenuByPid());
            gt.registerFunction("getChildPermissionByPid", new GetPermissionByPid());
            gt.registerTag("cms_content", ContentTag.class);
            gt.registerTag("cms_content_list", ContentListTag.class);
            gt.registerTag("cms_content_page", ContentPageTag.class);
            gt.registerTag("cms_pagination", PaginationTag.class);
            gt.registerTag("cms_channel", ChannelTag.class);
            gt.registerTag("cms_channel_list", ChannelListTag.class);
            gt.registerTag("cms_modelfiled_find", ModelFiledFindTag.class);
            gt.registerTag("cms_tag_list", TagListTag.class);
            gt.registerTag("cms_topic_list", TopicListTag.class);
            gt.registerTag("cms_lucene_page", LucentPageTag.class);
            gt.registerTag("cms_slider", SliderTag.class);
            gt.registerTag("cms_content", ContentAndModel.class);
            siteVar.put("powered", "icms");
            gt.setSharedVars(siteVar);

        } catch (IOException e) {
            e.printStackTrace();
        }
    }


    public Render getRender(String view) {
        return new BeetlRender(gt, view);
    }

    public String getViewExtension() {
        return viewExtension;
    }

}
