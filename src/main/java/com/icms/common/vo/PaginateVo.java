package com.icms.common.vo;

import java.util.List;

public class PaginateVo implements java.io.Serializable {


    private static final long serialVersionUID = 1L;

    private int total;
    private int current;
    private String last;
    private List<PageActionVo> changePage;
    private String next;


    public List<PageActionVo> getChangePage() {
        return changePage;
    }

    public void setChangePage(List<PageActionVo> changePages) {
        this.changePage = changePages;
    }

    public String getLast() {
        return last;
    }

    public void setLast(String last) {
        this.last = last;
    }

    public String getNext() {
        return next;
    }

    public void setNext(String next) {
        this.next = next;
    }

    public int getTotal() {
        return total;
    }

    public void setTotal(int total) {
        this.total = total;
    }

    public int getCurrent() {
        return current;
    }

    public void setCurrent(int current) {
        this.current = current;
    }

}
