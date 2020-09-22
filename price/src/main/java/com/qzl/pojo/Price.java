package com.qzl.pojo;

import java.util.Date;

public class Price {
    private Integer pId;

    private String pName;

    private String pImage;

    private String pAfterDescription;

    private String pDescription;

    private Integer pType;

    private Date pDate;

    public Integer getpId() {
        return pId;
    }

    public void setpId(Integer pId) {
        this.pId = pId;
    }

    public String getpName() {
        return pName;
    }

    public void setpName(String pName) {
        this.pName = pName == null ? null : pName.trim();
    }

    public String getpImage() {
        return pImage;
    }

    public void setpImage(String pImage) {
        this.pImage = pImage == null ? null : pImage.trim();
    }

    public String getpAfterDescription() {
        return pAfterDescription;
    }

    public void setpAfterDescription(String pAfterDescription) {
        this.pAfterDescription = pAfterDescription == null ? null : pAfterDescription.trim();
    }

    public String getpDescription() {
        return pDescription;
    }

    public void setpDescription(String pDescription) {
        this.pDescription = pDescription == null ? null : pDescription.trim();
    }

    public Integer getpType() {
        return pType;
    }

    public void setpType(Integer pType) {
        this.pType = pType;
    }

    public Date getpDate() {
        return pDate;
    }

    public void setpDate(Date pDate) {
        this.pDate = pDate;
    }
}