package com.work.employee;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.ibatis.annotations.Param;
import org.apache.tomcat.util.json.JSONParser;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.google.gson.Gson;
import com.google.gson.JsonElement;
import com.google.gson.JsonObject;
import com.google.gson.JsonParser;

@Controller
public class EmployeeController {
	@Autowired
	EmployeeService empService;
	
	@GetMapping("/insert")
	public ModelAndView empInsert() {
		ModelAndView mav = new ModelAndView();
		
		mav.setViewName("/employee/insert");
		
		return mav;
	}
	
	@PostMapping("/create")
    public ModelAndView create(EmployeeDto empDto){
      ModelAndView mav = new ModelAndView();
    
      System.out.println(empDto.getEmpnm());
    
      int cnt= empService.empInsert(empDto);
    
      if (cnt == 1) {
        mav.setViewName("/employee/ok");
      
      }
    
      mav.addObject("cnt", cnt); // request.setAttribute("cnt", cnt)
    
      return mav;
    }
	
	@GetMapping("/loginView")
	public ModelAndView loginView(HttpServletRequest request) {
		ModelAndView mav = new ModelAndView();
		Cookie[] cookies = request.getCookies();
	    Cookie cookie = null;

	    String ck_id = ""; // id 저장
	    String ck_id_save = ""; // id 저장 여부를 체크
	    String ck_passwd = ""; // passwd 저장
	    String ck_passwd_save = ""; // passwd 저장 여부를 체크
	    
	    if (cookies != null) {
	        for (int i=0; i < cookies.length; i++){
	          cookie = cookies[i]; // 쿠키 객체 추출
	          
	          if (cookie.getName().equals("ck_id")){
	            ck_id = cookie.getValue(); 
	          }else if(cookie.getName().equals("ck_id_save")){
	            ck_id_save = cookie.getValue();  // Y, N
	          }else if (cookie.getName().equals("ck_passwd")){
	            ck_passwd = cookie.getValue();         // 1234
	          }else if(cookie.getName().equals("ck_passwd_save")){
	            ck_passwd_save = cookie.getValue();  // Y, N
	          }
	        }
	    }
	    
	    mav.addObject("ck_id", ck_id); 
	    mav.addObject("ck_id_save", ck_id_save);
	    mav.addObject("ck_passwd", ck_passwd);
	    mav.addObject("ck_passwd_save", ck_passwd_save);
	    
		mav.setViewName("/employee/login_view");
		
		return mav;
	}
	
	@PostMapping("/pwdChk")
	public ModelAndView pwdChk(HttpServletRequest request,
            HttpServletResponse response,
            HttpSession session,
            int empno,
            String pwd,
            @RequestParam(value="id_save", defaultValue="") String id_save,
            @RequestParam(value="passwd_save", defaultValue="") String passwd_save) {
		ModelAndView mav = new ModelAndView();
		Map<String, Object> map = new HashMap<String, Object>();
	    map.put("empno", empno);
	    map.put("pwd", pwd);
	    
	    int cnt = empService.pwdCheck(map);
	    if (cnt == 1) { // 로그인 성공
	      System.out.println(empno + " 로그인 성공");
	      EmployeeDto empDto = empService.selectEmp(empno);
	      session.setAttribute("empno", empDto.getEmpno()); // 서버의 메모리에 기록
	      
	      // id 관련 쿠기 저장
	      if (id_save.equals("Y")) { // id를 저장할 경우, Checkbox를 체크한 경우
	        Cookie ck_id = new Cookie("ck_id", empno+"");
	        ck_id.setPath("/");  // root 폴더에 쿠키를 기록함으로 모든 경로에서 쿠기 접근 가능
	        ck_id.setMaxAge(60 * 60 * 24 * 30); // 30 day, 초단위
	        response.addCookie(ck_id); // id 저장
	      } else { // N, id를 저장하지 않는 경우, Checkbox를 체크 해제한 경우
	        Cookie ck_id = new Cookie("ck_id", "");
	        ck_id.setPath("/");
	        ck_id.setMaxAge(0);
	        response.addCookie(ck_id); // id 저장
	      }
	      // id를 저장할지 선택하는  CheckBox 체크 여부
	      Cookie ck_id_save = new Cookie("ck_id_save", id_save);
	      ck_id_save.setPath("/");
	      ck_id_save.setMaxAge(60 * 60 * 24 * 30); // 30 day
	      response.addCookie(ck_id_save);
	     
	      // Password 관련 쿠기 저장
	      if (passwd_save.equals("Y")) { // 패스워드 저장할 경우
	        Cookie ck_passwd = new Cookie("ck_passwd", pwd);
	        ck_passwd.setPath("/");
	        ck_passwd.setMaxAge(60 * 60 * 24 * 30); // 30 day
	        response.addCookie(ck_passwd);
	      } else { // N, 패스워드를 저장하지 않을 경우
	        Cookie ck_passwd = new Cookie("ck_passwd", "");
	        ck_passwd.setPath("/");
	        ck_passwd.setMaxAge(0);
	        response.addCookie(ck_passwd);
	      }
	      // passwd를 저장할지 선택하는  CheckBox 체크 여부
	      Cookie ck_passwd_save = new Cookie("ck_passwd_save", passwd_save);
	      ck_passwd_save.setPath("/");
	      ck_passwd_save.setMaxAge(60 * 60 * 24 * 30); // 30 day
	      response.addCookie(ck_passwd_save);
	      // -------------------------------------------------------------------
	      
	      mav.setViewName("redirect:/hello");  
	    }
		return mav;
	}
	
	@GetMapping("/logout")
	public ModelAndView logout(HttpSession session){
		ModelAndView mav = new ModelAndView();
		session.invalidate(); // 모든 session 변수 삭제
		
		mav.setViewName("redirect:/loginView"); 
		
		return mav;
	}
	
	@GetMapping("/updateView")
	public ModelAndView updateView(int empno) {
		ModelAndView mav = new ModelAndView();
		
		EmployeeDto empDto = empService.selectEmp(empno);
		mav.addObject("empDto", empDto);
		mav.setViewName("/employee/updateView");
				
		return mav;
	}
	
	@PostMapping("/updateEmp")
	public ModelAndView updateEmp(EmployeeDto empDto) {
		ModelAndView mav = new ModelAndView();
		
		int cnt = empService.updateEmp(empDto);
		
		if(cnt == 1) {
			mav.setViewName("/employee/ok");
		}
		return mav;
	}
	
	@PostMapping("/deleteEmp")
	public ModelAndView deleteEmp(int empno) {
		ModelAndView mav = new ModelAndView();
		
		int cnt = empService.deleteEmp(empno);
		
		if(cnt == 1) {
			mav.setViewName("/employee/ok");
		}
		
		return mav;
		
		
	}
	
	@GetMapping("/orgChart")
	public ModelAndView orgChart() {
		ModelAndView mav = new ModelAndView();
		
		mav.setViewName("/employee/orgchart");
		
		return mav;
	}
}
