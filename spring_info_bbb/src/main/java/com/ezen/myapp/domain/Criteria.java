package com.ezen.myapp.domain;


public class Criteria {
	
	private int page =1;   // ������ ���� �޴� ����
	
	private int perPageNum =15;	// ȭ�� ����Ʈ ��°���

	public int getPage() {
		return page;
	}

	public void setPage(int page) {
		this.page = page;
	}

	public int getPerPageNum() {
		return perPageNum;
	}

	public void setPerPageNum(int perPageNum) {
		this.perPageNum = perPageNum;
	}
	
}
