package com.icms.cms.model;

import com.jfinal.plugin.activerecord.ActiveRecordPlugin;

/**
 * Generated by JFinal, do not modify this file.
 * <pre>
 * Example:
 * public void configPlugin(Plugins me) {
 *     ActiveRecordPlugin arp = new ActiveRecordPlugin(...);
 *     _MappingKit.mapping(arp);
 *     me.add(arp);
 * }
 * </pre>
 */
public class _MappingKit {

    public static void mapping(ActiveRecordPlugin arp) {
        arp.addMapping("ic_ad", "id", Ad.class);
        arp.addMapping("ic_admin", "admin_id", Admin.class);
        arp.addMapping("ic_admin_role", "id", AdminRole.class);
        arp.addMapping("ic_area", "id", Area.class);
        arp.addMapping("ic_category", "category_id", Category.class);
        arp.addMapping("ic_commont", "commont_id", Commont.class);
        arp.addMapping("ic_config", "Id", Config.class);
        arp.addMapping("ic_config_attr", "id", ConfigAttr.class);
        arp.addMapping("ic_content", "content_id", Content.class);
        arp.addMapping("ic_form", "form_id", Form.class);
        arp.addMapping("ic_link", "link_id", Link.class);
        arp.addMapping("ic_member", "member_id", Member.class);
        arp.addMapping("ic_member_group", "Id", MemberGroup.class);
        arp.addMapping("ic_menu", "menu_id", Menu.class);
        arp.addMapping("ic_model", "model_id", Model.class);
        arp.addMapping("ic_model_filed", "filed_id", ModelFiled.class);
        arp.addMapping("ic_permission", "permission_id", Permission.class);
        arp.addMapping("ic_role", "role_id", Role.class);
        arp.addMapping("ic_role_permission", "id", RolePermission.class);
        arp.addMapping("ic_search_words", "word_id", SearchWords.class);
        arp.addMapping("ic_tag", "tag_id", Tag.class);
        arp.addMapping("ic_tag_content", "id", TagContent.class);
        arp.addMapping("ic_task_content", "id", TaskContent.class);
        arp.addMapping("ic_topic", "topic_id", Topic.class);
        arp.addMapping("ic_website", "site_id", Website.class);
    }
}
