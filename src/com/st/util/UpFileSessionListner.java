package com.st.util;

import java.io.File;
import java.util.List;

import javax.servlet.annotation.WebListener;
import javax.servlet.http.HttpSession;
import javax.servlet.http.HttpSessionEvent;
import javax.servlet.http.HttpSessionListener;

import com.st.bean.Config;

/**
 * Application Lifecycle Listener implementation class UpFileSessionListner
 *
 */
@WebListener
public class UpFileSessionListner implements HttpSessionListener {

    /**
     * Default constructor. 
     */
    public UpFileSessionListner() {
        // TODO Auto-generated constructor stub
    }

	/**
     * @see HttpSessionListener#sessionCreated(HttpSessionEvent)
     */
    public void sessionCreated(HttpSessionEvent se)  { 
         // TODO Auto-generated method stub
    }

	/**
     * @see HttpSessionListener#sessionDestroyed(HttpSessionEvent)
     */
    public void sessionDestroyed(HttpSessionEvent se)  { 
         // TODO Auto-generated method stub
    	HttpSession session=se.getSession();
    	List uploadGoodsFileList=(List)session.getAttribute(Config.GOODS_UP_LIST_KEY);
    	   String src = "D:\\jiava1909\\springmvc2\\WebContent\\file\\";
    	   if(uploadGoodsFileList!=null&&uploadGoodsFileList.size()>0) {
    			//不为空，长度大于零代表有垃圾文件
    			for(int i=0;i<uploadGoodsFileList.size();i++) {
    				String filename=uploadGoodsFileList.get(i)+"";
    				boolean b=new File(src+filename).delete();
    			}
    		}
    }
	
}
