package com.lin.Entity;

import java.util.List;

public class Page<T> {

    private List<T> list;
    private int totalRecords;
    private int pageSize;
    private int pageNo;

    public Page() {

    }

    public int getTotalPages() {
        return (totalRecords + pageSize - 1) / pageSize;
    }

    public int countOffset(int currentPage, int pageSize) {
        int offset = pageSize * (currentPage - 1);
        return offset;
    }

    public int getTopPageNo() {
        return 1;
    }

    public int getPreviousPageNo() {
        if (pageNo <= 1) {
            return 1;
        }
        return pageNo - 1;
    }

    public int getNextPageNo() {
        if (pageNo >= getBottomPageNo()) {
            return getBottomPageNo();
        }
        return pageNo + 1;
    }

    public int getBottomPageNo() {
        return getTotalPages();
    }

    public List<T> getList() {
        return list;
    }

    public void setList(List<T> list) {
        this.list = list;
    }

    public int getTotalRecords() {
        return totalRecords;
    }

    public void setTotalRecords(int totalRecords) {
        this.totalRecords = totalRecords;
    }

    public int getPageSize() {
        return pageSize;
    }

    public void setPageSize(int pageSize) {
        this.pageSize = pageSize;
    }

    public int getPageNo() {
        return pageNo;
    }

    public void setPageNo(int pageNo) {
        this.pageNo = pageNo;
    }
}

