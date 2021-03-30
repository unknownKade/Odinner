package com.ko.eat.controller;

import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.ko.eat.service.BoardService;
import com.ko.eat.service.MealService;
import com.ko.eat.service.ReplyService;
import com.ko.eat.vo.BoardVO;
import com.ko.eat.vo.SearchCriteria;

@Controller
@RequestMapping("/board/*")
public class ContentController {
	private static final Logger logger =LoggerFactory.getLogger(BoardController.class);
    
	   @Inject
	   BoardService service;
	   
	   @Inject
	   ReplyService replyService;
	   
	   @Inject
	   MealService mealService;
	   
	   
	   @RequestMapping(value="/write", method= RequestMethod.POST)
	   public String write(BoardVO boardVO, MultipartHttpServletRequest mtfRequest) throws Exception{
		   logger.info("write ##");
		   
		   List<String> mfList = new ArrayList<String>();
		   
		   String path = "C:\\dev\\workplace\\.metadata\\.plugins\\org.eclipse.wst.server.core\\tmp0\\webapps\\recipe_images\\";
		   
		      for(int i = 0; i <16; i ++) {
		          MultipartFile mf = null;
		          
		          if(mtfRequest.getFile("imgFile[" + i +"]")==null) {
		        	  continue;
		          }
		          mf = mtfRequest.getFile("imgFile["+ i+ "]");
		          System.out.println("turn" + i);
		          
		          String originFileName =  "b"+ i + "_" +System.currentTimeMillis()+ "_"+ mf.getOriginalFilename();
		          String saveFile = path + originFileName;
		          mfList.add(i, originFileName);

		          try {
		             mf.transferTo(new File(saveFile));
		          }catch(Exception e) {
		             e.printStackTrace();
		          }
		       }
		   boardVO.setImgFileList(mfList);
		   service.write(boardVO);
		   service.writeContent(boardVO);
		   
		   return "redirect:/board/list";
	   }
	   @RequestMapping(value="/update", method=RequestMethod.POST)
	   public String update(BoardVO boardVO, @ModelAttribute("scri")SearchCriteria scri, RedirectAttributes rttr)throws Exception{
		   logger.info("update up up up");
		   
		   service.update(boardVO);
		   
		   rttr.addAttribute("page", scri.getPage());
		   rttr.addAttribute("perPageNum", scri.getPerPageNum());
		   rttr.addAttribute("searchType", scri.getSearchType());
		   rttr.addAttribute("keyword", scri.getKeyword());
		   
		   return "redirect:/board/list";
	   }
	   
	   
	   @RequestMapping(value="/updateLike", method= RequestMethod.POST)
	   public String likeUpdate(HttpServletRequest request, HttpServletResponse response)throws Exception{
		   
		   Map<String, Object> m = new HashMap<>();
		   m.put("userId", request.getParameter("userId"));
		   m.put("bno", request.getParameter("bno"));

		   int result = service.checkLike(m);
			
		   if(result == 0){
				service.addLike(m);
		   }else{
				service.deleteLike(m);
		   }
		   return null;
	   }
	   
	   
	   @RequestMapping(value="/countLike", method= RequestMethod.GET)
	   public String likeCount(BoardVO boardVO, HttpServletRequest request, HttpServletResponse response)throws Exception{
			request.setCharacterEncoding("utf-8");
			response.setContentType("text/html;charset=utf-8");
			PrintWriter out = response.getWriter();
			
			int bno = Integer.parseInt(request.getParameter("bno"));
					
			out.println(service.countLike(bno));
			out.close();
			
			return null;
	   }
	   
	   
	   @RequestMapping(value = "/search", method = RequestMethod.GET)
	   public String search(Model model, @ModelAttribute SearchCriteria scri) throws Exception {
	      logger.info("searchFood==========");          //SearchCriteria : �궡�슜�쑝濡� 寃��깋, �젣紐⑹쑝濡� 寃��깋 (寃��깋 湲곗�)
	      model.addAttribute("search", service.searchFood(scri));
		   
	      return "board/search";
	   }
}
