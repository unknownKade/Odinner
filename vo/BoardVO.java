package com.ko.eat.vo;

import java.util.Date;
import java.util.List;

import org.springframework.web.multipart.MultipartFile;

public class BoardVO {
	
	private int bno;
	private String title;
	private String writer;
	private Date regdate;
	private String ingredient;
	private String menu;
	private String lev;
	private String time;
	private String serving;
	private String tip;
	private int count;
	private List<String> content;
	private MultipartFile mainImg;
	private List<MultipartFile> imgFile;
	private List<String> imgFileList;

	public int getBno() {
		return bno;
	}
	public void setBno(int bno) {
		this.bno = bno;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getWriter() {
		return writer;
	}
	public void setWriter(String writer) {
		this.writer = writer;
	}
	public Date getRegdate() {
		return regdate;
	}
	public void setRegdate(Date regdate) {
		this.regdate = regdate;
	}
	public String getIngredient() {
		return ingredient;
	}
	public void setIngredient(String ingredient) {
		this.ingredient = ingredient;
	}
	public String getMenu() {
		return menu;
	}
	public void setMenu(String menu) {
		this.menu = menu;
	}
	public String getLev() {
		return lev;
	}
	public void setLev(String lev) {
		this.lev = lev;
	}
	public String getTime() {
		return time;
	}
	public void setTime(String time) {
		this.time = time;
	}
	public String getServing() {
		return serving;
	}
	public void setServing(String serving) {
		this.serving = serving;
	}
	public String getTip() {
		return tip;
	}
	public void setTip(String tip) {
		this.tip = tip;
	}
	public int getCount() {
		return count;
	}
	public void setCount(int count) {
		this.count = count;
	}
	public MultipartFile getMainImg() {
		return mainImg;
	}
	public void setMainImg(MultipartFile mainImg) {
		this.mainImg = mainImg;
	}
	public List<String> getContent() {
		return content;
	}
	public void setContent(List<String> content) {
		this.content = content;
	}
	public List<String> getImgFileList() {
		return imgFileList;
	}
	public void setImgFileList(List<String> imgFileList) {
		this.imgFileList = imgFileList;
	}
	public List<MultipartFile> getImgFile() {
		return imgFile;
	}
	public void setImgFile(List<MultipartFile> imgFile) {
		this.imgFile = imgFile;
	}
	

}