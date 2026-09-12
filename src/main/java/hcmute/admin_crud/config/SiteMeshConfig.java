package hcmute.admin_crud.config;

import jakarta.servlet.DispatcherType;
import org.sitemesh.config.ConfigurableSiteMeshFilter;
import org.springframework.boot.web.servlet.FilterRegistrationBean;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.core.Ordered;

@Configuration
public class SiteMeshConfig {

    @Bean
    public FilterRegistrationBean<ConfigurableSiteMeshFilter> siteMeshFilter() {
        FilterRegistrationBean<ConfigurableSiteMeshFilter> registration = new FilterRegistrationBean<>();

        // Use ConfigurableSiteMeshFilter which reads /WEB-INF/sitemesh3.xml
        registration.setFilter(new ConfigurableSiteMeshFilter());
        registration.addUrlPatterns("/*");
        // Only intercept FORWARD - Spring MVC forwards to JSP via FORWARD dispatch
        registration.setDispatcherTypes(DispatcherType.FORWARD);
        registration.setOrder(Ordered.LOWEST_PRECEDENCE - 100);
        registration.setName("sitemeshFilter");

        return registration;
    }
}
