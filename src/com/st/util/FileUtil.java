package com.st.util;

import java.io.File;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.io.IOException;

import org.springframework.web.multipart.MultipartFile;

public class FileUtil {
	//原文件名
	public static String getFileType(MultipartFile file) {
		//原始文件名
		String oldName=file.getOriginalFilename();
		//最后一个点出现的位置(下标)
		int lastIndex=oldName.lastIndexOf(".");
		//从.出现的位置截取字符串就是后缀名
		String fileType=oldName.substring(lastIndex);
		return fileType;
	}
	
	public static void copy(File f1,File f2) {
		try {
			FileInputStream fis=new FileInputStream(f1);
			FileOutputStream fos=new FileOutputStream(f1);
			byte[]b_arr=new byte[1024];
			int c=0;
			while((c=fis.read(b_arr))>0) {
				fos.write(b_arr,0,c);
			}
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
	}
	
	

}
