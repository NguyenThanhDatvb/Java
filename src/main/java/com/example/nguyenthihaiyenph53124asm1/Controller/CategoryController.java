package com.example.nguyenthihaiyenph53124asm1.Controller;

import com.example.nguyenthihaiyenph53124asm1.DAO.CategoryDAO;
import com.example.nguyenthihaiyenph53124asm1.Entity.Category;
import jakarta.servlet.http.HttpSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Sort;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import java.util.List;
import java.util.Optional;

@Controller
public class CategoryController {
    @Autowired
    CategoryDAO categoryDAO;
        @RequestMapping("/category/index")
    public String index(Model model, @RequestParam("field") Optional<String> field, HttpSession session, RedirectAttributes redirectAttributes) {

            Sort sort = Sort.by(Sort.Direction.ASC, field.orElse("id"));
        Category item = new Category();
        model.addAttribute("item", item);
        List<Category> items = categoryDAO.findAll(sort);
        model.addAttribute("items", items);
            Boolean isAdmin = (Boolean) session.getAttribute("isAdmin");
            if (isAdmin != null && isAdmin) {
                return "admin/index";
            } else {
                redirectAttributes.addFlashAttribute("error","bạn không phải là admin");
                return "redirect:/Error";
            }

    }


    @RequestMapping("/category/edit/{id}")
    public String edit(Model model, @PathVariable("id") Integer id) {
        Category item = categoryDAO.findById(id).get();
        model.addAttribute("item", item);
        List<Category> items = categoryDAO.findAll();
        model.addAttribute("items", items);
        return "Category/index";
    }

    @RequestMapping("/category/create")
    public String create(Category item) {
        categoryDAO.save(item);
        return "redirect:/category/index";
    }

    @RequestMapping("/category/update")
    public String update(Category item) {
        categoryDAO.save(item);
        return "redirect:/category/edit/" + item.getId();
    }
    @RequestMapping("/category/delete/{id}")
    public String create(@PathVariable("id") Integer id) {
        categoryDAO.deleteById(id);
        return "redirect:/category/index";
    }



}
