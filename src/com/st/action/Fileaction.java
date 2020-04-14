package com.st.action;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.st.bean.Config;
import com.st.service.imp.FileService;
import com.st.util.FileRJSON;
@Controller
public class Fileaction {
	@Autowired
	FileService fileS;
	
	

	@RequestMapping("/fileUpload")
	@ResponseBody
	public FileRJSON fileUpload(MultipartFile file, HttpSession session) {
		FileRJSON frs=fileS.fileupload(file, session);
		return frs;
	}
	
	
	/**
	 * 跳转页面
	 * 
	 * @return
	 */
	@RequestMapping("/file")
	public String file(HttpSession session) {
		//判断session中是否有文件集合，如果有（上次没有保存的垃圾文件，需要删除）
		// 这个list是用来保存上传文件的名字--蒋这个集合保存在session中
		fileS.delBFile(session);
		List upFilelist = new ArrayList();
		session.setAttribute(Config.GOODS_UP_LIST_KEY, upFilelist);
		return "file";
	}
}
