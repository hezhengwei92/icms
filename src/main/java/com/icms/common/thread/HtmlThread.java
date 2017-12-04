package com.icms.common.thread;

import com.icms.common.vo.HtmlObject;

import java.io.File;
import java.io.FileOutputStream;
import java.io.OutputStreamWriter;
import java.util.concurrent.LinkedBlockingQueue;

public class HtmlThread implements Runnable {

    private static LinkedBlockingQueue<HtmlObject> htmlQueue = new LinkedBlockingQueue<HtmlObject>();

    @Override
    public void run() {
        while (true) {
            try {
                HtmlObject obj = htmlQueue.take();
                File file = new File(obj.getFileUrl());
                System.out.println("------------------" + obj.getFileUrl());
                if (!file.exists())
                    file.getParentFile().mkdirs();
                OutputStreamWriter os = new OutputStreamWriter(new FileOutputStream(file), "utf-8");
                os.write(obj.getContent());
                os.flush();
                os.close();

            } catch (Exception e) {
                e.printStackTrace();
            } finally {

            }
        }
    }

    public static void addHtml(HtmlObject htmlObj) {
        htmlQueue.offer(htmlObj);
    }

    public static Boolean isEmpty() {
        return htmlQueue.isEmpty();
    }

    public static void main(String[] args) {
        for (int i = 0; i < 10000; i++) {
            HtmlObject h = new HtmlObject();
            h.setContent("conntent" + i);
            h.setFileUrl("F:\\web\\" + i + ".html");
            addHtml(h);
        }
        Thread t = new Thread(new HtmlThread());
        t.start();
        while (true) {
            System.out.println(htmlQueue.isEmpty());
            // if(htmlQueue.isEmpty()){
            // break;
            // }
        }

    }
}
