package com.icms.cms.web.admin;

import com.icms.cms.base.AController;
import com.icms.config.AppConst;
import com.jfinal.plugin.ehcache.CacheKit;

public class CacheController extends AController {

	public void initCache(){
		for(String cache : AppConst.SERVICE_CACHE){
			CacheKit.removeAll(cache);
		}
	}

	@Override
	public void index() {
		// TODO Auto-generated method stub
		
	}

	@Override
	public void input() {
		// TODO Auto-generated method stub
		
	}

	@Override
	public void save() {
		// TODO Auto-generated method stub
		
	}

	@Override
	public void del() {
		// TODO Auto-generated method stub
		
	}
	
}
