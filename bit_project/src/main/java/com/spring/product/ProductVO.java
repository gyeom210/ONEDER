package com.spring.product;

import java.util.Date;

public class ProductVO {
	/*
	 * product_num NUMBER product_name VARCHAR2(50) total_amount NUMBER
	 * rental_amount NUMBER share_amount NUMBER manufacturer VARCHAR2(20)
	 * product_content VARCHAR2(1000) gpa NUMBER category_L VARCHAR2(20) category_M
	 * VARCHAR2(20) category_S VARCHAR2(20) img_sum VARCHAR2(50) img_main
	 * VARCHAR2(50) img_detail VARCHAR2(500) regist DATE
	 */
	
	/* DATE type 사용할 경우, 시분초까지 데이터를 얻으려면 java.util.date 써야됩니다.*/
	/*
	 * SimpleDateFormat format1 = new SimpleDateFormat ( "yyyy-MM-dd HH:mm:ss");
	 * SimpleDateFormat format2 = new SimpleDateFormat ( "yyyy년 MM월dd일 HH시mm분ss초");
	 * 
	 * Calendar time = Calendar.getInstance();
	 * 
	 * String format_time1 = format1.format(time.getTime()); String format_time2 =
	 * format2.format(time.getTime());
	 */
	
	private int product_num;
	private String product_name;
	private int total_amount;
	private int rental_amount;
	private int current_amount;
	private String manufacturer;
	private String product_content;
	private double gpa;
	private String category_l;
	private String category_m;
	private String category_s;
	private String img_sum;
	private String img_main;
	private String img_detail;
	private Date regist;
	private int readcount;
    private String main_img;
    
	public String getMain_img() {
		return main_img;
	}
	public void setMain_img(String main_img) {
		this.main_img = main_img;
	}
	public int getReadcount() {
		return readcount;
	}
	public void setReadcount(int readcount) {
		this.readcount = readcount;
	}
	public int getProduct_num() {
		return product_num;
	}
	public void setProduct_num(int product_num) {
		this.product_num = product_num;
	}
	public String getProduct_name() {
		return product_name;
	}
	public void setProduct_name(String product_name) {
		this.product_name = product_name;
	}
	public int getTotal_amount() {
		return total_amount;
	}
	public void setTotal_amount(int total_amount) {
		this.total_amount = total_amount;
	}
	public int getRental_amount() {
		return rental_amount;
	}
	public void setRental_amount(int rental_amount) {
		this.rental_amount = rental_amount;
	}

	public int getCurrent_amount() {
		return current_amount;
	}
	public void setCurrent_amount(int current_amount) {
		this.current_amount = current_amount;
	}
	public String getManufacturer() {
		return manufacturer;
	}
	public void setManufacturer(String manufacturer) {
		this.manufacturer = manufacturer;
	}
	public String getProduct_content() {
		return product_content;
	}
	public void setProduct_content(String product_content) {
		this.product_content = product_content;
	}

	public double getGpa() {
		return gpa;
	}
	public void setGpa(double gpa) {
		this.gpa = gpa;
	}
	public String getCategory_l() {
		return category_l;
	}
	public void setCategory_l(String category_l) {
		this.category_l = category_l;
	}
	public String getCategory_m() {
		return category_m;
	}
	public void setCategory_m(String category_m) {
		this.category_m = category_m;
	}
	public String getCategory_s() {
		return category_s;
	}
	public void setCategory_s(String category_s) {
		this.category_s = category_s;
	}
	public String getImg_sum() {
		return img_sum;
	}
	public void setImg_sum(String img_sum) {
		this.img_sum = img_sum;
	}
	public String getImg_main() {
		return img_main;
	}
	public void setImg_main(String img_main) {
		this.img_main = img_main;
	}
	public String getImg_detail() {
		return img_detail;
	}
	public void setImg_detail(String img_detail) {
		this.img_detail = img_detail;
	}
	public Date getRegist() {
		return regist;
	}
	public void setRegist(Date regist) {
		this.regist = regist;
	}
	
}
