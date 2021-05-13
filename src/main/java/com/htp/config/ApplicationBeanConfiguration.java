package com.htp.config;

import org.springframework.context.annotation.Configuration;
import org.springframework.web.servlet.config.annotation.ResourceHandlerRegistry;
import org.springframework.web.servlet.config.annotation.ViewControllerRegistry;
import org.springframework.web.servlet.config.annotation.WebMvcConfigurer;

//import java.net.http.HttpClient;


@Configuration
public class ApplicationBeanConfiguration implements WebMvcConfigurer {
//    @Bean
//    public HttpClient httpClient() {
//        return HttpClient.newBuilder()
//                .version(HttpClient.Version.HTTP_2)
//                .build();
//    }

    public void addViewControllers(ViewControllerRegistry registry) {
        registry.addViewController("/login").setViewName("login");
    }

    @Override
    public void addResourceHandlers(ResourceHandlerRegistry registry) {
        registry.addResourceHandler("/**")
                .addResourceLocations("classpath:/images/");
    }
}
