package com.qzl.pojo;

import java.util.ArrayList;
import java.util.Date;
import java.util.Iterator;
import java.util.List;

public class PriceExample {
    protected String orderByClause;

    protected boolean distinct;

    protected List<Criteria> oredCriteria;

    public PriceExample() {
        oredCriteria = new ArrayList<Criteria>();
    }

    public void setOrderByClause(String orderByClause) {
        this.orderByClause = orderByClause;
    }

    public String getOrderByClause() {
        return orderByClause;
    }

    public void setDistinct(boolean distinct) {
        this.distinct = distinct;
    }

    public boolean isDistinct() {
        return distinct;
    }

    public List<Criteria> getOredCriteria() {
        return oredCriteria;
    }

    public void or(Criteria criteria) {
        oredCriteria.add(criteria);
    }

    public Criteria or() {
        Criteria criteria = createCriteriaInternal();
        oredCriteria.add(criteria);
        return criteria;
    }

    public Criteria createCriteria() {
        Criteria criteria = createCriteriaInternal();
        if (oredCriteria.size() == 0) {
            oredCriteria.add(criteria);
        }
        return criteria;
    }

    protected Criteria createCriteriaInternal() {
        Criteria criteria = new Criteria();
        return criteria;
    }

    public void clear() {
        oredCriteria.clear();
        orderByClause = null;
        distinct = false;
    }

    protected abstract static class GeneratedCriteria {
        protected List<Criterion> criteria;

        protected GeneratedCriteria() {
            super();
            criteria = new ArrayList<Criterion>();
        }

        public boolean isValid() {
            return criteria.size() > 0;
        }

        public List<Criterion> getAllCriteria() {
            return criteria;
        }

        public List<Criterion> getCriteria() {
            return criteria;
        }

        protected void addCriterion(String condition) {
            if (condition == null) {
                throw new RuntimeException("Value for condition cannot be null");
            }
            criteria.add(new Criterion(condition));
        }

        protected void addCriterion(String condition, Object value, String property) {
            if (value == null) {
                throw new RuntimeException("Value for " + property + " cannot be null");
            }
            criteria.add(new Criterion(condition, value));
        }

        protected void addCriterion(String condition, Object value1, Object value2, String property) {
            if (value1 == null || value2 == null) {
                throw new RuntimeException("Between values for " + property + " cannot be null");
            }
            criteria.add(new Criterion(condition, value1, value2));
        }

        protected void addCriterionForJDBCDate(String condition, Date value, String property) {
            if (value == null) {
                throw new RuntimeException("Value for " + property + " cannot be null");
            }
            addCriterion(condition, new java.sql.Date(value.getTime()), property);
        }

        protected void addCriterionForJDBCDate(String condition, List<Date> values, String property) {
            if (values == null || values.size() == 0) {
                throw new RuntimeException("Value list for " + property + " cannot be null or empty");
            }
            List<java.sql.Date> dateList = new ArrayList<java.sql.Date>();
            Iterator<Date> iter = values.iterator();
            while (iter.hasNext()) {
                dateList.add(new java.sql.Date(iter.next().getTime()));
            }
            addCriterion(condition, dateList, property);
        }

        protected void addCriterionForJDBCDate(String condition, Date value1, Date value2, String property) {
            if (value1 == null || value2 == null) {
                throw new RuntimeException("Between values for " + property + " cannot be null");
            }
            addCriterion(condition, new java.sql.Date(value1.getTime()), new java.sql.Date(value2.getTime()), property);
        }

        public Criteria andPIdIsNull() {
            addCriterion("p_id is null");
            return (Criteria) this;
        }

        public Criteria andPIdIsNotNull() {
            addCriterion("p_id is not null");
            return (Criteria) this;
        }

        public Criteria andPIdEqualTo(Integer value) {
            addCriterion("p_id =", value, "pId");
            return (Criteria) this;
        }

        public Criteria andPIdNotEqualTo(Integer value) {
            addCriterion("p_id <>", value, "pId");
            return (Criteria) this;
        }

        public Criteria andPIdGreaterThan(Integer value) {
            addCriterion("p_id >", value, "pId");
            return (Criteria) this;
        }

        public Criteria andPIdGreaterThanOrEqualTo(Integer value) {
            addCriterion("p_id >=", value, "pId");
            return (Criteria) this;
        }

        public Criteria andPIdLessThan(Integer value) {
            addCriterion("p_id <", value, "pId");
            return (Criteria) this;
        }

        public Criteria andPIdLessThanOrEqualTo(Integer value) {
            addCriterion("p_id <=", value, "pId");
            return (Criteria) this;
        }

        public Criteria andPIdIn(List<Integer> values) {
            addCriterion("p_id in", values, "pId");
            return (Criteria) this;
        }

        public Criteria andPIdNotIn(List<Integer> values) {
            addCriterion("p_id not in", values, "pId");
            return (Criteria) this;
        }

        public Criteria andPIdBetween(Integer value1, Integer value2) {
            addCriterion("p_id between", value1, value2, "pId");
            return (Criteria) this;
        }

        public Criteria andPIdNotBetween(Integer value1, Integer value2) {
            addCriterion("p_id not between", value1, value2, "pId");
            return (Criteria) this;
        }

        public Criteria andPNameIsNull() {
            addCriterion("p_name is null");
            return (Criteria) this;
        }

        public Criteria andPNameIsNotNull() {
            addCriterion("p_name is not null");
            return (Criteria) this;
        }

        public Criteria andPNameEqualTo(String value) {
            addCriterion("p_name =", value, "pName");
            return (Criteria) this;
        }

        public Criteria andPNameNotEqualTo(String value) {
            addCriterion("p_name <>", value, "pName");
            return (Criteria) this;
        }

        public Criteria andPNameGreaterThan(String value) {
            addCriterion("p_name >", value, "pName");
            return (Criteria) this;
        }

        public Criteria andPNameGreaterThanOrEqualTo(String value) {
            addCriterion("p_name >=", value, "pName");
            return (Criteria) this;
        }

        public Criteria andPNameLessThan(String value) {
            addCriterion("p_name <", value, "pName");
            return (Criteria) this;
        }

        public Criteria andPNameLessThanOrEqualTo(String value) {
            addCriterion("p_name <=", value, "pName");
            return (Criteria) this;
        }

        public Criteria andPNameLike(String value) {
            addCriterion("p_name like", value, "pName");
            return (Criteria) this;
        }

        public Criteria andPNameNotLike(String value) {
            addCriterion("p_name not like", value, "pName");
            return (Criteria) this;
        }

        public Criteria andPNameIn(List<String> values) {
            addCriterion("p_name in", values, "pName");
            return (Criteria) this;
        }

        public Criteria andPNameNotIn(List<String> values) {
            addCriterion("p_name not in", values, "pName");
            return (Criteria) this;
        }

        public Criteria andPNameBetween(String value1, String value2) {
            addCriterion("p_name between", value1, value2, "pName");
            return (Criteria) this;
        }

        public Criteria andPNameNotBetween(String value1, String value2) {
            addCriterion("p_name not between", value1, value2, "pName");
            return (Criteria) this;
        }

        public Criteria andPImageIsNull() {
            addCriterion("p_image is null");
            return (Criteria) this;
        }

        public Criteria andPImageIsNotNull() {
            addCriterion("p_image is not null");
            return (Criteria) this;
        }

        public Criteria andPImageEqualTo(String value) {
            addCriterion("p_image =", value, "pImage");
            return (Criteria) this;
        }

        public Criteria andPImageNotEqualTo(String value) {
            addCriterion("p_image <>", value, "pImage");
            return (Criteria) this;
        }

        public Criteria andPImageGreaterThan(String value) {
            addCriterion("p_image >", value, "pImage");
            return (Criteria) this;
        }

        public Criteria andPImageGreaterThanOrEqualTo(String value) {
            addCriterion("p_image >=", value, "pImage");
            return (Criteria) this;
        }

        public Criteria andPImageLessThan(String value) {
            addCriterion("p_image <", value, "pImage");
            return (Criteria) this;
        }

        public Criteria andPImageLessThanOrEqualTo(String value) {
            addCriterion("p_image <=", value, "pImage");
            return (Criteria) this;
        }

        public Criteria andPImageLike(String value) {
            addCriterion("p_image like", value, "pImage");
            return (Criteria) this;
        }

        public Criteria andPImageNotLike(String value) {
            addCriterion("p_image not like", value, "pImage");
            return (Criteria) this;
        }

        public Criteria andPImageIn(List<String> values) {
            addCriterion("p_image in", values, "pImage");
            return (Criteria) this;
        }

        public Criteria andPImageNotIn(List<String> values) {
            addCriterion("p_image not in", values, "pImage");
            return (Criteria) this;
        }

        public Criteria andPImageBetween(String value1, String value2) {
            addCriterion("p_image between", value1, value2, "pImage");
            return (Criteria) this;
        }

        public Criteria andPImageNotBetween(String value1, String value2) {
            addCriterion("p_image not between", value1, value2, "pImage");
            return (Criteria) this;
        }

        public Criteria andPAfterDescriptionIsNull() {
            addCriterion("p_after_description is null");
            return (Criteria) this;
        }

        public Criteria andPAfterDescriptionIsNotNull() {
            addCriterion("p_after_description is not null");
            return (Criteria) this;
        }

        public Criteria andPAfterDescriptionEqualTo(String value) {
            addCriterion("p_after_description =", value, "pAfterDescription");
            return (Criteria) this;
        }

        public Criteria andPAfterDescriptionNotEqualTo(String value) {
            addCriterion("p_after_description <>", value, "pAfterDescription");
            return (Criteria) this;
        }

        public Criteria andPAfterDescriptionGreaterThan(String value) {
            addCriterion("p_after_description >", value, "pAfterDescription");
            return (Criteria) this;
        }

        public Criteria andPAfterDescriptionGreaterThanOrEqualTo(String value) {
            addCriterion("p_after_description >=", value, "pAfterDescription");
            return (Criteria) this;
        }

        public Criteria andPAfterDescriptionLessThan(String value) {
            addCriterion("p_after_description <", value, "pAfterDescription");
            return (Criteria) this;
        }

        public Criteria andPAfterDescriptionLessThanOrEqualTo(String value) {
            addCriterion("p_after_description <=", value, "pAfterDescription");
            return (Criteria) this;
        }

        public Criteria andPAfterDescriptionLike(String value) {
            addCriterion("p_after_description like", value, "pAfterDescription");
            return (Criteria) this;
        }

        public Criteria andPAfterDescriptionNotLike(String value) {
            addCriterion("p_after_description not like", value, "pAfterDescription");
            return (Criteria) this;
        }

        public Criteria andPAfterDescriptionIn(List<String> values) {
            addCriterion("p_after_description in", values, "pAfterDescription");
            return (Criteria) this;
        }

        public Criteria andPAfterDescriptionNotIn(List<String> values) {
            addCriterion("p_after_description not in", values, "pAfterDescription");
            return (Criteria) this;
        }

        public Criteria andPAfterDescriptionBetween(String value1, String value2) {
            addCriterion("p_after_description between", value1, value2, "pAfterDescription");
            return (Criteria) this;
        }

        public Criteria andPAfterDescriptionNotBetween(String value1, String value2) {
            addCriterion("p_after_description not between", value1, value2, "pAfterDescription");
            return (Criteria) this;
        }

        public Criteria andPDescriptionIsNull() {
            addCriterion("p_description is null");
            return (Criteria) this;
        }

        public Criteria andPDescriptionIsNotNull() {
            addCriterion("p_description is not null");
            return (Criteria) this;
        }

        public Criteria andPDescriptionEqualTo(String value) {
            addCriterion("p_description =", value, "pDescription");
            return (Criteria) this;
        }

        public Criteria andPDescriptionNotEqualTo(String value) {
            addCriterion("p_description <>", value, "pDescription");
            return (Criteria) this;
        }

        public Criteria andPDescriptionGreaterThan(String value) {
            addCriterion("p_description >", value, "pDescription");
            return (Criteria) this;
        }

        public Criteria andPDescriptionGreaterThanOrEqualTo(String value) {
            addCriterion("p_description >=", value, "pDescription");
            return (Criteria) this;
        }

        public Criteria andPDescriptionLessThan(String value) {
            addCriterion("p_description <", value, "pDescription");
            return (Criteria) this;
        }

        public Criteria andPDescriptionLessThanOrEqualTo(String value) {
            addCriterion("p_description <=", value, "pDescription");
            return (Criteria) this;
        }

        public Criteria andPDescriptionLike(String value) {
            addCriterion("p_description like", value, "pDescription");
            return (Criteria) this;
        }

        public Criteria andPDescriptionNotLike(String value) {
            addCriterion("p_description not like", value, "pDescription");
            return (Criteria) this;
        }

        public Criteria andPDescriptionIn(List<String> values) {
            addCriterion("p_description in", values, "pDescription");
            return (Criteria) this;
        }

        public Criteria andPDescriptionNotIn(List<String> values) {
            addCriterion("p_description not in", values, "pDescription");
            return (Criteria) this;
        }

        public Criteria andPDescriptionBetween(String value1, String value2) {
            addCriterion("p_description between", value1, value2, "pDescription");
            return (Criteria) this;
        }

        public Criteria andPDescriptionNotBetween(String value1, String value2) {
            addCriterion("p_description not between", value1, value2, "pDescription");
            return (Criteria) this;
        }

        public Criteria andPTypeIsNull() {
            addCriterion("p_type is null");
            return (Criteria) this;
        }

        public Criteria andPTypeIsNotNull() {
            addCriterion("p_type is not null");
            return (Criteria) this;
        }

        public Criteria andPTypeEqualTo(Integer value) {
            addCriterion("p_type =", value, "pType");
            return (Criteria) this;
        }

        public Criteria andPTypeNotEqualTo(Integer value) {
            addCriterion("p_type <>", value, "pType");
            return (Criteria) this;
        }

        public Criteria andPTypeGreaterThan(Integer value) {
            addCriterion("p_type >", value, "pType");
            return (Criteria) this;
        }

        public Criteria andPTypeGreaterThanOrEqualTo(Integer value) {
            addCriterion("p_type >=", value, "pType");
            return (Criteria) this;
        }

        public Criteria andPTypeLessThan(Integer value) {
            addCriterion("p_type <", value, "pType");
            return (Criteria) this;
        }

        public Criteria andPTypeLessThanOrEqualTo(Integer value) {
            addCriterion("p_type <=", value, "pType");
            return (Criteria) this;
        }

        public Criteria andPTypeIn(List<Integer> values) {
            addCriterion("p_type in", values, "pType");
            return (Criteria) this;
        }

        public Criteria andPTypeNotIn(List<Integer> values) {
            addCriterion("p_type not in", values, "pType");
            return (Criteria) this;
        }

        public Criteria andPTypeBetween(Integer value1, Integer value2) {
            addCriterion("p_type between", value1, value2, "pType");
            return (Criteria) this;
        }

        public Criteria andPTypeNotBetween(Integer value1, Integer value2) {
            addCriterion("p_type not between", value1, value2, "pType");
            return (Criteria) this;
        }

        public Criteria andPDateIsNull() {
            addCriterion("p_date is null");
            return (Criteria) this;
        }

        public Criteria andPDateIsNotNull() {
            addCriterion("p_date is not null");
            return (Criteria) this;
        }

        public Criteria andPDateEqualTo(Date value) {
            addCriterionForJDBCDate("p_date =", value, "pDate");
            return (Criteria) this;
        }

        public Criteria andPDateNotEqualTo(Date value) {
            addCriterionForJDBCDate("p_date <>", value, "pDate");
            return (Criteria) this;
        }

        public Criteria andPDateGreaterThan(Date value) {
            addCriterionForJDBCDate("p_date >", value, "pDate");
            return (Criteria) this;
        }

        public Criteria andPDateGreaterThanOrEqualTo(Date value) {
            addCriterionForJDBCDate("p_date >=", value, "pDate");
            return (Criteria) this;
        }

        public Criteria andPDateLessThan(Date value) {
            addCriterionForJDBCDate("p_date <", value, "pDate");
            return (Criteria) this;
        }

        public Criteria andPDateLessThanOrEqualTo(Date value) {
            addCriterionForJDBCDate("p_date <=", value, "pDate");
            return (Criteria) this;
        }

        public Criteria andPDateIn(List<Date> values) {
            addCriterionForJDBCDate("p_date in", values, "pDate");
            return (Criteria) this;
        }

        public Criteria andPDateNotIn(List<Date> values) {
            addCriterionForJDBCDate("p_date not in", values, "pDate");
            return (Criteria) this;
        }

        public Criteria andPDateBetween(Date value1, Date value2) {
            addCriterionForJDBCDate("p_date between", value1, value2, "pDate");
            return (Criteria) this;
        }

        public Criteria andPDateNotBetween(Date value1, Date value2) {
            addCriterionForJDBCDate("p_date not between", value1, value2, "pDate");
            return (Criteria) this;
        }
    }

    public static class Criteria extends GeneratedCriteria {

        protected Criteria() {
            super();
        }
    }

    public static class Criterion {
        private String condition;

        private Object value;

        private Object secondValue;

        private boolean noValue;

        private boolean singleValue;

        private boolean betweenValue;

        private boolean listValue;

        private String typeHandler;

        public String getCondition() {
            return condition;
        }

        public Object getValue() {
            return value;
        }

        public Object getSecondValue() {
            return secondValue;
        }

        public boolean isNoValue() {
            return noValue;
        }

        public boolean isSingleValue() {
            return singleValue;
        }

        public boolean isBetweenValue() {
            return betweenValue;
        }

        public boolean isListValue() {
            return listValue;
        }

        public String getTypeHandler() {
            return typeHandler;
        }

        protected Criterion(String condition) {
            super();
            this.condition = condition;
            this.typeHandler = null;
            this.noValue = true;
        }

        protected Criterion(String condition, Object value, String typeHandler) {
            super();
            this.condition = condition;
            this.value = value;
            this.typeHandler = typeHandler;
            if (value instanceof List<?>) {
                this.listValue = true;
            } else {
                this.singleValue = true;
            }
        }

        protected Criterion(String condition, Object value) {
            this(condition, value, null);
        }

        protected Criterion(String condition, Object value, Object secondValue, String typeHandler) {
            super();
            this.condition = condition;
            this.value = value;
            this.secondValue = secondValue;
            this.typeHandler = typeHandler;
            this.betweenValue = true;
        }

        protected Criterion(String condition, Object value, Object secondValue) {
            this(condition, value, secondValue, null);
        }
    }
}