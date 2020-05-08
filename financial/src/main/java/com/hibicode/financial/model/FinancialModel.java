package com.hibicode.financial.model;

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
}
