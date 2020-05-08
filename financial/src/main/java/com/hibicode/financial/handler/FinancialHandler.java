package com.hibicode.financial.handler;

import com.hibicode.financial.model.*;
import org.springframework.binding.message.MessageBuilder;
import org.springframework.binding.message.MessageContext;
import org.springframework.stereotype.Component;

@Component
public class FinancialHandler {

    public FinancialModel init() {
        return new FinancialModel();
    }

    public void addPersonalInfo(FinancialModel financialModel, PersonalInfo personalInfo) {
        financialModel.setPersonalInfo(personalInfo);
    }

    public void addValueInfo(FinancialModel financialModel, ValueInfo valueInfo) {
        financialModel.setValueInfo(valueInfo);
    }

    public void addDateInfo(FinancialModel financialModel, DateInfo dateInfo) {
        financialModel.setDateInfo(dateInfo);
    }

    public void addPortionInfo(FinancialModel financialModel, PortionInfo portionInfo) {
        financialModel.setPortionInfo(portionInfo);
    }

    public String validatePersonalInfo(PersonalInfo personalInfo, MessageContext error) {
        String transitionValue = "success";

        if (personalInfo.getCpf().equalsIgnoreCase("000")) {
            error.addMessage(new MessageBuilder()
                    .error()
                    .source("cpf")
                    .defaultText("Esse CPF está na nossa blacklist!") //
                    .build());

            transitionValue = "failure";
        }
        return transitionValue;
    }

    public String save(FinancialModel financialModel, MessageContext messageContext) {

        return "success";
    }

}
