package com.icms.common.quartz.job;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;
import org.quartz.JobExecutionContext;
import org.quartz.JobExecutionException;
import com.icms.cms.model.Content;
import com.icms.cms.model.TaskContent;
import com.icms.cms.service.ContentService;
import com.icms.cms.service.TaskService;
import com.icms.common.quartz.JFinalJob;
import com.icms.common.util.CmsUtil;
import com.jfinal.kit.LogKit;

public class ContentPostJob extends JFinalJob {

	@Override
	public void execute(JobExecutionContext context) throws JobExecutionException {
		List<TaskContent> tasks = TaskService.service.getTaskAll();
		if (!CmsUtil.isNullOrEmpty(tasks) || !tasks.isEmpty()) {
			SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd HH:mm");
			Date date = new Date();
			String currentDateTime = dateFormat.format(date);
			LogKit.info("当前时间：" + currentDateTime);
			for (TaskContent task : tasks) {
				String dataTime = dateFormat.format(task.getDateTime());
				if (CmsUtil.StrEquals(currentDateTime, dataTime)) {
					Content content = ContentService.service.getContentByContentId(task.getContentId());
					content.setStatus(true);
					content.update();
					task.setStatus(false);
					task.delete();
					LogKit.info("任务 ：" + task.getId() + " 已删除！");
					LogKit.info("内容 ： " + task.getContentId() + " 已发布！");
					TaskService.service.clearCacheAll();
					ContentService.service.clearCacheAll();
					LogKit.info("Task 和 Content 缓存更新！");
				} else {
					LogKit.info("任务编号： " + task.getId() + " 发布时间未到或者已过期！");
				}
			}

		} 

	}


}
