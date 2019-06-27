package com.utill;

public class NavUtil2 {

	public static String getNavgation(String mainMenu,String subMenu){
		StringBuffer navCode=new StringBuffer();
		navCode.append("当前位置：&nbsp;&nbsp;");
		navCode.append("<a href='"+PropertiesUtil.getValue("projectName")+"/ad.jsp'>主页</a>&nbsp;&nbsp;>&nbsp;&nbsp;");
		navCode.append("<a href='#'>"+mainMenu+"</a>&nbsp;&nbsp;>&nbsp;&nbsp;");
		navCode.append("<a href='#'>"+subMenu+"</a>");
		return navCode.toString();
	}
}
