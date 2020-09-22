package com.qzl.service;

import com.qzl.pojo.Price;
import com.qzl.util.ResultEntity;

public interface IPriceService {

	public ResultEntity<String> addPrice(Price price);
}
