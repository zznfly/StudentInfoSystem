package com.action;

import java.sql.Connection;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import net.sf.json.JSONObject;

import org.apache.struts2.ServletActionContext;
import org.apache.struts2.interceptor.ServletRequestAware;

import com.dao.UserDao;
import com.model.User;
import com.opensymphony.xwork2.ActionSupport;
import com.utill.DbUtil;
import com.utill.NavUtil;
import com.utill.NavUtil2;
import com.utill.ResponseUtil;
import com.utill.StringUtil;

public class UserAction extends ActionSupport implements ServletRequestAware {

	private HttpServletRequest request;

	private User user;
	private String error;
	private String imageCode;

	private int userId;
	private String password;

	private String mainPage;
	private String navCode;

	public int getUserId() {
		return userId;
	}

	public void setUserId(int userId) {
		this.userId = userId;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public String getMainPage() {
		return mainPage;
	}

	public void setMainPage(String mainPage) {
		this.mainPage = mainPage;
	}

	public String getNavCode() {
		return navCode;
	}

	public void setNavCode(String navCode) {
		this.navCode = navCode;
	}

	public User getUser() {
		return user;
	}

	public void setUser(User user) {
		this.user = user;
	}

	public String getError() {
		return error;
	}

	public void setError(String error) {
		this.error = error;
	}

	public String getImageCode() {
		return imageCode;
	}

	public void setImageCode(String imageCode) {
		this.imageCode = imageCode;
	}

	private DbUtil dbUtil = new DbUtil();
	private UserDao userDao = new UserDao();

	public String login() {
		HttpSession session = request.getSession();
		if (StringUtil.isEmpty(user.getUserName())
				|| StringUtil.isEmpty(user.getPassword())) {
			error = "�û���������Ϊ�գ�";
			return ERROR;
		}
		/*
		 * if(StringUtil.isEmpty(imageCode)){ error="��֤��Ϊ�գ�"; return ERROR; }
		 * if(!imageCode.equals(session.getAttribute("sRand"))){ error="��֤�����";
		 * return ERROR; }
		 */
		Connection con = null;
		System.out.println(user.getUserName());

		if ((user.getUserName()).equals("admin")) {
			try {
				con = dbUtil.getCon();
				User currentUser = userDao.login(con, user);
				if (currentUser == null) {
					error = "�û������������";
					return ERROR;
				} else {
					session.setAttribute("currentUser", currentUser);
					
					return SUCCESS;
				}
			} catch (Exception e) {
				e.printStackTrace();
			} finally {

				try {
					dbUtil.closeCon(con);
				} catch (Exception e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
			}
			return SUCCESS;
		} else {
			try {
				
				con = dbUtil.getCon();
				User currentUser = userDao.login(con, user);
				if (currentUser == null) {
					error = "�û������������";
					return ERROR;
				} else {
					session.setAttribute("currentUser", currentUser);
				
					return "student";
				}
			} catch (Exception e) {
				e.printStackTrace();
			} finally {
				try {
					dbUtil.closeCon(con);
				} catch (Exception e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
			}
			return "student";
		}
	}

	public String preSave() {
			navCode = NavUtil.getNavgation("ϵͳ����", "�޸�����");
			System.out.println("����Ա");
		mainPage = "user/modifyPassword.jsp";
		return SUCCESS;
	}

	public String preSaves() {
		navCode = NavUtil2.getNavgation("ϵͳ����", "�޸�����");
		System.out.println("ѧ��");
	mainPage = "user/modifyPassword.jsp";
	return "student";
}
	
	public String save() {
		User user = new User();
		user.setUserId(userId);
		user.setPassword(password);
		Connection con = null;
		try {
			con = dbUtil.getCon();
			int updateNums = userDao.modifyPassword(con, user);
			JSONObject resultJson = new JSONObject();
			if (updateNums > 0) {
				resultJson.put("success", true);
			} else {
				resultJson.put("errorMsg", "�޸�����ʧ��");
			}
			ResponseUtil.write(resultJson, ServletActionContext.getResponse());
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			try {
				dbUtil.closeCon(con);
			} catch (Exception e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
		return null;
	}

	public String logOut() {
		HttpSession session = request.getSession();
		session.removeAttribute("currentUser");
		return "logOut";
	}

	@Override
	public void setServletRequest(HttpServletRequest request) {
		this.request = request;
	}

}
