package com.spring.adminchart;

import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;


@Controller
public class ChartController {
	
	@Autowired
	private ChartService chartService;
	
	@RequestMapping(value = "/index.se", method = RequestMethod.GET)
	public String showCharts(Model model) {
		int new_users = 0;
		int total_subscribers = 0;
		int total_b2b = 0;
		List<RankingVO> rankingList = new ArrayList<RankingVO>();
		List<EBITVO> revenueList = new ArrayList<EBITVO>();
		List<EBITVO> expenseList = new ArrayList<EBITVO>();
		List<DNGraphVO> dngList = new ArrayList<DNGraphVO>();
		List<CountingPVO> countingpList = new ArrayList<CountingPVO>();
		List<VariationVO> variationTList = new ArrayList<VariationVO>();
		
		try {
			new_users = chartService.countNewUsers(); 
			total_subscribers = chartService.countTotalSubscribers();
			total_b2b = chartService.countTotalB2B();
			
			rankingList = chartService.getWishListRanking();
			dngList = chartService.getDoughnutGraph();
			for(int i = 0; i < dngList.size(); i++) {
				DNGraphVO dngvo = (DNGraphVO)dngList.get(i);
				int dngData = dngvo.getData();
				
				model.addAttribute("dngData"+i, dngData);
			}
			
			/* 영업이익 */
			revenueList = chartService.getRevenue();// 수익(매출) 
			expenseList = chartService.getExpenses();// 비용
			
			for(int i = 0; i < revenueList.size(); i++ ) {
				/*수익(매출)*/
				EBITVO ebitvo1 = (EBITVO)revenueList.get(i);
				Date month = ebitvo1.getMonth();
				String ebitMonth = new SimpleDateFormat("yyyy/MM").format(month);
				int ebitPrice = ebitvo1.getPrice();
				int ebitPoint_pirce = ebitvo1.getPoint_price();
				int revenue = ebitPrice + ebitPoint_pirce;
				model.addAttribute("ebitMonth"+i, ebitMonth);
				model.addAttribute("revenue"+i, revenue);
				
				/*비용*/
				EBITVO ebitvo2 = (EBITVO)expenseList.get(i);
				int expense = ebitvo2.getExpenses();
				model.addAttribute("expense"+i, expense);
				
				/*영업이익*/
				int ebit = revenue - expense;
				model.addAttribute("ebit"+i, ebit); 
				
				/*영업이익률*/
				double operatingMargin = ((double)ebit /(double)revenue ) * 100;
				model.addAttribute("om"+i, operatingMargin);
			}
			
			/* 가입한 회원 수 */
			variationTList = chartService.countTotalUsers();
			for(int i = 0; i < 14; i ++) {
				/*현재*/
				SimpleDateFormat sdf = new SimpleDateFormat("yyyyMMdd");
			    Calendar c = Calendar.getInstance();
				String strDate = sdf.format(c.getTime());
				/*기준이 되는 날*/
				c.setTime(sdf.parse(strDate));
				c.add(Calendar.DATE, -13+i); 
				strDate = sdf.format(c.getTime()); 
				
				VariationVO variationIvo = new VariationVO();
				VariationVO variationDvo = new VariationVO();
				variationIvo = chartService.increaseUsers(strDate);
				variationDvo = chartService.decreaseUsers(strDate);
				int vgIncrease = 0;
				int vgDecrease = 0;
				
				if(variationIvo != null) {
					vgIncrease = variationIvo.getIncrease();
				} 
				model.addAttribute("vgIncrease"+i, vgIncrease);
				
				if(variationDvo != null) {
					vgDecrease = variationDvo.getDecrease();
				} 
				model.addAttribute("vgDecrease"+i, vgDecrease);
		
				SimpleDateFormat sdf2 = new SimpleDateFormat("MM/dd");
				strDate = sdf2.format(c.getTime());
				model.addAttribute("vgDay"+i, strDate);
			}
			
			/* 총 회원 수*/
			for (int i = 0; i < variationTList.size(); i++) {
				VariationVO variationvo2 = (VariationVO)variationTList.get(i);
				int total = variationvo2.getTotal();
				model.addAttribute("total"+i, total);
			}

			/* 커뮤니티 게시글 수 카운트*/
			for(int i = 0; i < 7; i++) {
				/*현재*/
				SimpleDateFormat sdf = new SimpleDateFormat("yyyyMMdd");
			    Calendar c = Calendar.getInstance();
				String strDate = sdf.format(c.getTime());
				/*기준이 되는 날*/
				c.setTime(sdf.parse(strDate));
				c.add(Calendar.DATE, -6+i); 
				strDate = sdf.format(c.getTime());
				
				CountingPVO countingpvo = new CountingPVO();
				countingpvo = chartService.countPosts(strDate);
				int count = 0;
				
				if(countingpvo != null) {
					count = countingpvo.getCount();
				} 
				model.addAttribute("totalcp"+i, count);
			}
			model.addAttribute("new_users", new_users);
			model.addAttribute("total_subscribers", total_subscribers);
			model.addAttribute("total_b2b", total_b2b);
			model.addAttribute("rankingList", rankingList);
		}catch(Exception e) {
			e.printStackTrace();
		}
		return "admin/index";
	}

}
