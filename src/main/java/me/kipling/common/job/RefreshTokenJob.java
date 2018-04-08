package me.kipling.common.job;

import java.text.SimpleDateFormat;
import java.util.Date;

import org.apache.commons.lang3.StringUtils;
import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.springframework.scheduling.annotation.Scheduled;

import com.alibaba.fastjson.JSONObject;

import me.kipling.common.Constants;
import me.kipling.common.util.HttpClientUtil;

/**
 * 
 * 定时任务刷新Token
 * 
 * @author Kipling
 *
 */
public class RefreshTokenJob {

	private static Log log = LogFactory.getLog(RefreshTokenJob.class);

	/**
	 * cron表达式：* * * * * *（共6位，使用空格隔开，具体如下） cron表达式：*(秒0-59) *(分钟0-59) *(小时0-23)
	 * *(日期1-31) *(月份1-12或是JAN-DEC) *(星期1-7或是SUN-SAT) 注意： 30 * * * * *
	 * 表示每分钟的第30秒执行，而（*斜杠30）表示每30秒执行
	 * 
	 */
	@Scheduled(cron = "0 0/30 * * * ?") // @Scheduled(fixedRate = 5000)
	public void job() {
	/*	if (log.isInfoEnabled()) {
			log.info("====RefreshTokenJob time：" + new SimpleDateFormat("yyyy-MM-dd HH:mm:ss").format(new Date()));
		}
	    String result = HttpClientUtil.post(Constants.QINIU_TOKEN_URL, Constants.NONE_STR);
		if (StringUtils.isNotBlank(result)) {
			JSONObject json = JSONObject.parseObject(result);
			if (json.getString("code").equals("0") && json.getString("msg").equals(Constants.SUCCESS)) {
				String token = json.getString("result");
				if (log.isInfoEnabled()) {
					log.info("====RefreshTokenJob get token=>" + token);
				}
				if (StringUtils.isNotBlank(token)) {
					Constants.QINIU_TOKEN = token;
				}
			}
		} else {
			log.error("========RefreshTokenJob get token occur an error========");
		}*/
	}
}