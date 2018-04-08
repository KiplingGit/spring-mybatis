package me.kipling.common.config;


import java.util.concurrent.Executor;
import java.util.concurrent.Executors;

import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.scheduling.annotation.EnableScheduling;
import org.springframework.scheduling.annotation.SchedulingConfigurer;
import org.springframework.scheduling.config.ScheduledTaskRegistrar;

import me.kipling.common.job.RefreshTokenJob;

/**
 * 
 * 定时任务配置
 * 
 * @author Kipling
 *
 */
@Configuration
@EnableScheduling
public class JobConfig implements SchedulingConfigurer {
 
    @Bean
    public RefreshTokenJob bean() {
        return new RefreshTokenJob();
    }
    
    /**
     * 配置线程池
     */
    public void configureTasks(ScheduledTaskRegistrar taskRegistrar) {
        taskRegistrar.setScheduler(taskExecutor());
    }
 
    @Bean(destroyMethod="shutdown")
    public Executor taskExecutor() {
        return Executors.newScheduledThreadPool(10);
    }
}