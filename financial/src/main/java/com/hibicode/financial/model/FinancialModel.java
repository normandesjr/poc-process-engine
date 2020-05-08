package com.hibicode.financial.model;

import org.json.JSONObject;

import java.io.Serializable;

public class FinancialModel implements Serializable {

    private PersonalInfo personalInfo;
    private ValueInfo valueInfo;
    private DateInfo dateInfo;
    private PortionInfo portionInfo;

    public PersonalInfo getPersonalInfo() {
        return personalInfo;
    }

    public void setPersonalInfo(PersonalInfo personalInfo) {
        this.personalInfo = personalInfo;
    }

    public ValueInfo getValueInfo() {
        return valueInfo;
    }

    public void setValueInfo(ValueInfo valueInfo) {
        this.valueInfo = valueInfo;
    }

    public DateInfo getDateInfo() {
        return dateInfo;
    }

    public void setDateInfo(DateInfo dateInfo) {
        this.dateInfo = dateInfo;
    }

    public PortionInfo getPortionInfo() {
        return portionInfo;
    }

    public void setPortionInfo(PortionInfo portionInfo) {
        this.portionInfo = portionInfo;
    }

    public String getJsonString() {
        JSONObject sfnInput = new JSONObject();
        sfnInput.put("name", getPersonalInfo().getName());
        sfnInput.put("cpf", getPersonalInfo().getCpf());
        sfnInput.put("value", Integer.valueOf(getValueInfo().getValue()));
        sfnInput.put("date", getDateInfo().getDate());
        sfnInput.put("quantity", Integer.valueOf(getPortionInfo().getQuantity()));
        return sfnInput.toString();
    }
}
