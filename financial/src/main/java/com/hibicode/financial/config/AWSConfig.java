package com.hibicode.financial.config;

import com.amazonaws.auth.AWSCredentialsProvider;
import com.amazonaws.auth.profile.ProfileCredentialsProvider;
import com.amazonaws.services.stepfunctions.AWSStepFunctionsClientBuilder;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.context.annotation.Primary;

@Configuration
public class AWSConfig {

    @Bean
    @Primary
    public AWSCredentialsProvider credentials() {
        return new ProfileCredentialsProvider("zup");
    }

    @Bean
    public AWSStepFunctionsClientBuilder awsStepFunctionsClientBuilder() {
        return AWSStepFunctionsClientBuilder.standard().withCredentials(credentials());
    }

}
