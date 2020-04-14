package com.st.service.imp;

import java.io.File;
import java.io.IOException;
import java.util.List;
import java.util.UUID;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import com.st.bean.Config;
import com.st.dao.IPro_Dao;
import com.st.util.FileRJSON;

@Service
public class FileService {
	@Autowired
	IPro_Dao pdao;

	public FileRJSON fileupload(MultipartFile file, HttpSession session) {
		// 获取文件的源文件名
		String oldName = file.getOriginalFilename();
		// 定义新的文件地址--绝对路径
		/*
		 * File nf2 = new File("D:\\jiava1909\\springmvc2\\WebContent\\file\\" +
		 * oldName);
		 */
		// 截取文件后缀名
		String fileTyle = oldName.substring(oldName.lastIndexOf("."), oldName.length());
		// 获取UUID
		String uuid = UUID.randomUUID().toString();
		// 拼接新文件名
		String newName = uuid + fileTyle;
		// 将上传的文件名字保存到session中的filelist集合中
		// 1、获取这个list
		// 2、添加add新的文件名
		addSessionFile(session, newName);
		// 定义新的文件地址
		String src = "D:\\jiava1909\\springmvc2\\WebContent\\file\\" + newName;
		// 项目正式运行路径中的文件
		File nf = new File(src);
		try {
			// 写出文件
			file.transferTo(nf);
			/* file.transferTo(nf2); */
		} catch (IllegalStateException | IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return new FileRJSON("123");
	}

	public void delBFile(HttpSession session) {
		List uploadGoodsFileList = (List) session.getAttribute(Config.GOODS_UP_LIST_KEY);
		String src = "D:\\jiava1909\\springmvc2\\WebContent\\file\\";
		if (uploadGoodsFileList != null && uploadGoodsFileList.size() > 0) {
			// 不为空，长度大于零代表有垃圾文件
			for (int i = 0; i < uploadGoodsFileList.size(); i++) {
				String filename = uploadGoodsFileList.get(i) + "";
				boolean b = new File(src + filename).delete();
			}
		}
	}

	public void addSessionFile(HttpSession session, String filename) {
		List list = (List) session.getAttribute(Config.GOODS_UP_LIST_KEY);
		list.add(filename);
	}

}
