package com.qzl.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.qzl.pojo.Price;
import com.qzl.service.IPriceService;
import com.qzl.util.ResultEntity;

/**奖品管理
 * @author Administrator
 *
 */
@RestController
@RequestMapping("/price")
public class PrizeController {
	
	@Autowired
	private IPriceService priceService;
	
	/** 添加奖品
	 * @param price
	 * @return
	 */
	@PostMapping("/add")
	public ResultEntity<String> addPrice(Price price){
		return priceService.addPrice(price);
	}

}
