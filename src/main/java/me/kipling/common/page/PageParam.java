package me.kipling.common.page;

public class PageParam {

	private Integer pageNum;
	private Integer pageSize;

	public PageParam() {
	}

	public Integer getPageNum() {
		return pageNum;
	}

	public PageParam(Integer pageNum, Integer pageSize) {
		super();
		this.pageNum = pageNum;
		this.pageSize = pageSize;
	}

	public void setPageNum(Integer pageNum) {
		this.pageNum = pageNum;
	}

	public Integer getPageSize() {
		return pageSize;
	}

	public void setPageSize(Integer pageSize) {
		this.pageSize = pageSize;
	}

}
