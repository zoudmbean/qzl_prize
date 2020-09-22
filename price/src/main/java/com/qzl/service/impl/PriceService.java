package com.qzl.service.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.qzl.constant.QzlConstant;
import com.qzl.mapper.PriceMapper;
import com.qzl.pojo.Price;
import com.qzl.service.IPriceService;
import com.qzl.util.ResultEntity;

import lombok.extern.slf4j.Slf4j;

@Service
@Slf4j
public class PriceService implements IPriceService {
	
	@Autowired
	private PriceMapper priceMapper;

	@Override
	public ResultEntity<String> addPrice(Price price) {
		try {
			int num = priceMapper.insert(price);
			if(num > 0) {
				return  ResultEntity.successWithoutData();
			}
			return ResultEntity.failed(QzlConstant.PRICE_ADD_ERROR);
		} catch (Exception e) {
			log.debug(QzlConstant.PRICE_ADD_ERROR , e);
		}
		return ResultEntity.failed(QzlConstant.PRICE_ADD_ERROR);
	}

}
