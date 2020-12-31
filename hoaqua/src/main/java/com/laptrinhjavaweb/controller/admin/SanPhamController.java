package com.laptrinhjavaweb.controller.admin;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.support.PagedListHolder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.ServletRequestUtils;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.laptrinhjavaweb.model.SanPham;
import com.laptrinhjavaweb.service.ProductService;

@Controller(value = "productControllerOfAdmin")
public class SanPhamController {
	@Autowired
	private ProductService productService;

	@RequestMapping(value = "/quan-tri/san-pham/danh-sach", method = RequestMethod.GET)
	public ModelAndView showList(HttpServletRequest request) {
		List<SanPham> listProduct = productService.listAll();
		PagedListHolder pagedListHolder = new PagedListHolder(listProduct);
		int page = ServletRequestUtils.getIntParameter(request, "page", 0);
		pagedListHolder.setPage(page);
		pagedListHolder.setPageSize(5);
		ModelAndView mav = new ModelAndView("admin/product/list");
		mav.addObject("pagedListHolder", pagedListHolder);
		return mav;
	}

	@RequestMapping(value = "/quan-tri/san-pham/them-moi", method = RequestMethod.GET)
	public ModelAndView newProduct() {
		SanPham product = new SanPham();
		ModelAndView mav = new ModelAndView("admin/product/new");
		mav.addObject("product", product);
		return mav;
	}

	@RequestMapping(value = "/quan-tri/san-pham/luu", method = RequestMethod.POST)
	public String saveCustomer(@ModelAttribute("product") SanPham product) {
		productService.save(product);
		return "redirect:/quan-tri/san-pham/danh-sach";
	}

	@RequestMapping(value = "/quan-tri/san-pham/chinh-sua", method = RequestMethod.GET)
	public ModelAndView editCustomerForm(@RequestParam long id) {
		ModelAndView mav = new ModelAndView("admin/product/edit");
		SanPham product = productService.get(id);
		mav.addObject("product", product);
		return mav;
	}

	@RequestMapping(value = "/quan-tri/san-pham/xoa", method = RequestMethod.GET)
	public String deleteCustomerForm(@RequestParam long id) {
		productService.delete(id);
		return "redirect:/quan-tri/san-pham/danh-sach";
	}

	@RequestMapping(value="/quan-tri/san-pham/validateName",method = RequestMethod.POST)
	public @ResponseBody String checkNameValidate(HttpServletRequest req,Model model){
		String tensanpham=req.getParameter("tensanpham");
		return productService.findByTensanpham(tensanpham);
	}
	@RequestMapping(value = "/quan-tri/san-pham/autocompletesearch", method = RequestMethod.GET)
	@ResponseBody
	public List<String> autocompletesearch(HttpServletRequest request) {
		return productService.autocompletesearch(request.getParameter("term"));
	}
	@RequestMapping("/quan-tri/san-pham/search")
	public String search(@RequestParam String keyword,Model model) {
		if(keyword==""){
			return "redirect:/quan-tri/san-pham/danh-sach";
		}else{
	    List<SanPham> result = productService.search(keyword);
	    model.addAttribute("result", result);
	 
	    return "admin/product/search";    
		}
	    
	}
}
