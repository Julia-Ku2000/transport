package com.htp;

import com.htp.config.ApplicationBeanConfiguration;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.context.annotation.EnableAspectJAutoProxy;
import org.springframework.context.annotation.Import;

@EnableAspectJAutoProxy(proxyTargetClass = true)
@SpringBootApplication(scanBasePackages = {"com.htp"})
@Import({
        ApplicationBeanConfiguration.class
})

public class Application {

    public static void main(String[] args) {
        SpringApplication.run(Application.class, args);
    }

}
