package com.st.session;

import javax.servlet.annotation.WebListener;
import javax.servlet.http.HttpSessionEvent;
import javax.servlet.http.HttpSessionListener;

@WebListener
public class SessionCounter implements HttpSessionListener {
	private static int Onlinenumber = 0;

	/**
	 * Default constructor.
	 */
	public SessionCounter() {
		// TODO Auto-generated constructor stub
	}

	/**
	 * @see HttpSessionListener#sessionCreated(HttpSessionEvent)
	 *      在session出现时记录，在线人数加一
	 */
	public void sessionCreated(HttpSessionEvent session) {
		// TODO Auto-generated method stub
		Onlinenumber++;

	}

	/**
	 * @see HttpSessionListener#sessionDestroyed(HttpSessionEvent)
	 *      在session出现时记录，在线人数减一
	 */
	public void sessionDestroyed(HttpSessionEvent session) {
		// TODO Auto-generated method stub
		if (Onlinenumber > 0) {
			Onlinenumber--;
		}

	}

	public static int getOnlinenumber() {
		return Onlinenumber;
	}

}
