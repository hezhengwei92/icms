package com.icms.common.beetl.function;

import java.util.List;
import org.beetl.core.Context;
import org.beetl.core.Function;
import com.icms.cms.model.Permission;
import com.icms.cms.service.PermissionService;
import com.icms.common.util.CmsUtil;

public class FindPermissionByPid implements Function {

	@SuppressWarnings("unchecked")
	@Override
	public Object call(Object[] paras, Context ctx) {
		Integer pid = (Integer) paras[0];
		List<Permission> rps = (List<Permission>) paras[1];
		StringBuffer out = new StringBuffer();
		List<Permission> ps = PermissionService.service.getPermissionListByPid(pid);
		if (CmsUtil.isNullOrEmpty(ps))
			return null;
		for (int i = 0; i < ps.size(); i++) {
			Permission p = ps.get(i);
			out.append(" <label> ");
			if (CmsUtil.isNullOrEmpty(rps)) {
				out.append("<input type=\"checkbox\" value=\"" + p.getPermissionId()
						+ "\" name=\"permission\" id=\"user-Character-0-0-0\">");
				out.append(" " + p.getDescription() + " ");
			} else {
				String checked = "";
				for (Permission rp : rps) {
					if (rp.getPermissionId() == p.getPermissionId()) {
						checked = " checked = \"checked\" ";
					}
				}
				out.append("<input type=\"checkbox\" value=\"" + p.getPermissionId()
						+ "\" name=\"permission\" id=\"user-Character-0-0-0\" " + checked + ">");
				out.append(" " + p.getDescription() + " ");
			}
			out.append(" <label> ");
		}
		return out.toString();
	}

}
