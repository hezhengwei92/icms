package com.icms.common.shiro.realm;

import org.apache.shiro.authc.AuthenticationException;
import org.apache.shiro.authc.AuthenticationInfo;
import org.apache.shiro.authc.AuthenticationToken;
import org.apache.shiro.authc.LockedAccountException;
import org.apache.shiro.authc.SimpleAuthenticationInfo;
import org.apache.shiro.authc.UnknownAccountException;
import org.apache.shiro.authz.AuthorizationInfo;
import org.apache.shiro.authz.SimpleAuthorizationInfo;
import org.apache.shiro.realm.AuthorizingRealm;
import org.apache.shiro.subject.PrincipalCollection;
import org.apache.shiro.util.ByteSource;

import com.icms.cms.model.Admin;
import com.icms.cms.service.AdminService;
import com.icms.cms.service.PermissionService;
import com.icms.cms.service.RoleService;

public class UserRealm extends AuthorizingRealm {

	@Override
	protected AuthorizationInfo doGetAuthorizationInfo(PrincipalCollection principals) {
		String username = (String) principals.getPrimaryPrincipal();

		SimpleAuthorizationInfo authorizationInfo = new SimpleAuthorizationInfo();
		authorizationInfo.setRoles(RoleService.service.getRolesByUsername(username));
		authorizationInfo.setStringPermissions(PermissionService.service.getPermissionsByUsername(username));

		return authorizationInfo;
	}

	@Override
	protected AuthenticationInfo doGetAuthenticationInfo(AuthenticationToken token) throws AuthenticationException {
		String username = (String) token.getPrincipal();
		Admin adminUser = AdminService.service.getAdminByUsername(username);
		if (adminUser == null) {
			throw new UnknownAccountException();// 没找到帐号
		}else if (Boolean.TRUE.equals(!adminUser.getStatus())) {
			throw new LockedAccountException(); // 帐号锁定
		}
		SimpleAuthenticationInfo authenticationInfo = new SimpleAuthenticationInfo(adminUser.getUsername(), // 用户名
				adminUser.getPassword(), // 密码
				ByteSource.Util.bytes(adminUser.getSalt()), getName());
		return authenticationInfo;
	}

}
