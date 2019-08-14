package com.py.servlet;

import java.io.IOException;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.py.service.MemberService;
import com.py.service.impl.MemberServiceImpl;
import com.py.vo.Manager;
import com.py.vo.Member;

@SuppressWarnings("serial")
public class MemberServlet extends HttpServlet {
	private MemberService memberservice = new MemberServiceImpl();//��ʼ��Service����
	HttpSession session = null;//����HttpSession����
	private String result = null;//����result
	private boolean flag = false;//������ʶ��
	public void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String method = request.getParameter("method");// ��ȡmethod����
		
		if("selectMemberLogin".equals(method)){					
			String account = request.getParameter("account");// ��ȡaccount
			String password = request.getParameter("password");// ��ȡpassword
			Member member = null;//����Member����	
			member = memberservice.selectMemberLogin(account,password);
			result = memberservice.getResult();
			if (result==null) {
				HttpSession session = request.getSession();// �õ�session
				session.setAttribute("member", member);// ��member������request��Χ��
				response.sendRedirect("index.jsp");
			}else{
				request.setAttribute("result", result);
				request.getRequestDispatcher("fg-memberLogin.jsp").forward(
						request, response);
			}
		}
		else if("insertMember".equals(method)){
			Member member = new Member();
			HttpSession session = request.getSession();// �õ�session
			member.setAccount(request.getParameter("account"));
			member.setPassword(request.getParameter("password"));
			member.setReallyName(request.getParameter("reallyName"));
			member.setEmail(request.getParameter("email"));
			member.setTel(request.getParameter("tel"));
			member.setIdCard(request.getParameter("idCard"));
			flag = memberservice.insertMember(member);
			result = memberservice.getResult();
			if(flag){
				session.setAttribute("member", member);
				response.sendRedirect("index.jsp");
			}else{
				request.setAttribute("result", result);
				request.getRequestDispatcher("fg-memberRegister.jsp")
						.forward(request, response);
			}
		}
		else if("updateMember".equals(method)){
			Member member = new Member();
			HttpSession session = request.getSession();// �õ�session
			member.setAccount(request.getParameter("account"));
			member.setPassword(request.getParameter("password"));
			member.setReallyName(request.getParameter("reallyName"));
			member.setEmail(request.getParameter("email"));
			member.setTel(request.getParameter("tel"));
			member.setIdCard(request.getParameter("idCard"));
			flag = memberservice.updateMember(member);
			result = memberservice.getResult();
			if(flag){
				session.removeAttribute("member");// ɾ��session��Χ�ڵ�member����
				session.setAttribute("member", member);// ����member������session��Χ��
				response.sendRedirect("index.jsp");
			}else{
				request.setAttribute("result",result);
				request.getRequestDispatcher("fg-memberUpdate.jsp").forward(
						request, response);
			}
		}
		else if("checkLogin".equals(method)){
			String sign = request.getParameter("sign");
			HttpSession session = request.getSession();// �õ�session
			if (session.getAttribute("member") == null) {
				request.setAttribute("result", "���ȵ�¼");
				request.getRequestDispatcher("fg-memberLogin.jsp").forward(
						request, response);
			} else {
				if ("order".equals(sign)) {
					response.sendRedirect("fg-orderDetail.jsp");
				} else if ("cart".equals(sign)) {
					response.sendRedirect("fg-cartSee.jsp");
				} else if ("member".equals(sign)) {
					response.sendRedirect("fg-memberUpdate.jsp");
				}
			}
		}
		else if("logoutMember".equals(method)){
				HttpSession session = request.getSession();// �õ�session
				session.invalidate();
				response.sendRedirect("index.jsp");
		}
		else if("selectMember".equals(method)){
			List<Member> list = null;
			list = memberservice.selectMember();
				int pageNumber = list.size();
				int maxPage = pageNumber;
				String number = request.getParameter("i");
				if (maxPage % 10 == 0)
					maxPage = maxPage/10;
				else {
					maxPage = maxPage / 10 + 1;
				}
				if (number == null) {
					number = "0";
				}
				request.setAttribute("number", String.valueOf(number));
				request.setAttribute("maxPage", String.valueOf(maxPage));
				request.setAttribute("pageNumber", String.valueOf(pageNumber));
				request.setAttribute("list", list);
				request.getRequestDispatcher("background/bg-memberSelect.jsp")
				.forward(request, response);
		}
		else if("selectMemberByAccount".equals(method)){
			Member member = null;
			String account = request.getParameter("account");
			member = memberservice.selectMemberByAccount(account);
			request.setAttribute("member", member);
			request.getRequestDispatcher("background/bg-memberDetailSelect.jsp").forward(request, response);
			
		}
		else if("deleteMemberByAccount".equals(method)){
			String account = request.getParameter("account");
			flag = memberservice.deleteMemberByAccount(account);
			result = memberservice.getResult();
			if(flag){
				response.sendRedirect("MemberServlet.do?method=selectMember");
			}else{
				request.setAttribute("result", result);
				request.getRequestDispatcher(
						"MemberServlet.do?method=selectMember")
						.forward(request, response);
			}
		}
		else if("insertMemberbg".equals(method)){
			Member member = new Member();
			HttpSession session = request.getSession();// �õ�session
			member.setAccount(request.getParameter("account"));
			member.setPassword(request.getParameter("password"));
			member.setReallyName(request.getParameter("reallyName"));
			member.setEmail(request.getParameter("email"));
			member.setTel(request.getParameter("tel"));
			member.setIdCard(request.getParameter("idCard"));
			flag = memberservice.insertMember(member);
			result = memberservice.getResult();
			if(flag){
				session.setAttribute("member", member);
				response.sendRedirect("bg-memberSelect.jsp");
			}else{
				request.setAttribute("result", result);
				request.getRequestDispatcher("fg-memberRegister.jsp")
						.forward(request, response);
			}
	}
		else if("MemberCentre".equals(method)){
			Member member = null;
			String account = request.getParameter("account");
			member = memberservice.selectMember(account);
			request.setAttribute("member", member);
			request.getRequestDispatcher("fg-membercentre.jsp").forward(request, response);
	}
	}

	public void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		this.doPost(request, response);
	}
}
