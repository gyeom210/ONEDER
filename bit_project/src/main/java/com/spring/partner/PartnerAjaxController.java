package com.spring.partner;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;

@RestController
public class PartnerAjaxController {
	
	@Autowired
	private PartnerService service;

	@RequestMapping(value="/getChartJSON.pr", produces = "application/json;charset=utf-8")
	@ResponseBody
	public List<PartnerVO> getChartJSONGET() {
		List<PartnerVO> list = service.getChartjson();
		return list;
	}
	
	@RequestMapping(value="/getChartJSON_filter.pr", produces = "application/json;charset=utf-8")
	@ResponseBody
	public List<PartnerVO> getChartJSONGET_filter() {
		List<PartnerVO> list = service.getChartjson();
		return list;
	}
}
