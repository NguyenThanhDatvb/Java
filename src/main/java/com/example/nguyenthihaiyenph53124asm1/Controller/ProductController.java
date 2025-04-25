package com.example.nguyenthihaiyenph53124asm1.Controller;

import com.example.nguyenthihaiyenph53124asm1.DAO.CategoryDAO;
import com.example.nguyenthihaiyenph53124asm1.DAO.ProductDAO;
import com.example.nguyenthihaiyenph53124asm1.Entity.Product;
import com.example.nguyenthihaiyenph53124asm1.Service.ProductService;
import com.example.nguyenthihaiyenph53124asm1.Service.SessionService;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpSession;
import org.springframework.beans.factory.annotation.Autowired;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import java.util.List;
import java.util.Optional;

@Controller
public class ProductController {
    @Autowired
    SessionService sessionService;
    @Autowired
private ProductDAO productDAO;
    @Autowired
    ProductService productService;
    @Autowired
    private CategoryDAO categoryDAO;
    @GetMapping("/ao-hoodie")
    public String showaohoodie(Model model) {
        List<Product> products = productDAO.findByCategory_Id(1);
        model.addAttribute("products", products);
        return "Ao/Hoodie";
    }
    @GetMapping("/ao-so-mi")
    public String showaosomi(Model model) {
        List<Product> products = productDAO.findByCategory_Id(2);
        model.addAttribute("products", products);
        return "Ao/somi";
    }
    @GetMapping("/ao-dai")
    public String showaodai(Model model) {
        List<Product> products = productDAO.findByCategory_Id(3);
        model.addAttribute("products", products);
        return "Ao/aodai";
    }
    @GetMapping("/ao-khoac")
    public String showaokhoac(Model model) {
        List<Product> products = productDAO.findByCategory_Id(4);
        model.addAttribute("products", products);
        return "Ao/aokhoac";
    }
    @GetMapping("/chan-vay-midi")
    public String showchanvaymmidi(Model model) {
        List<Product> products = productDAO.findByCategory_Id(6);
        model.addAttribute("products", products);
        return "vay/Midi";
    }
    @GetMapping("/vay-body")
    public String showvaybody(Model model) {
        List<Product> products = productDAO.findByCategory_Id(7);
        model.addAttribute("products", products);
        return "vay/ombody";
    }



    @RequestMapping("/admin/product")
    public String searchAndPage(Model model,

                                @RequestParam("keywords") Optional<String> kw,
                                @RequestParam("p") Optional<Integer> p, HttpSession session, RedirectAttributes redirectAttributes) {
        String kwords = kw.orElse(sessionService.get("keywords", ""));
        sessionService.set("keywords", kwords);
        Pageable pageable = PageRequest.of(p.orElse(0), 5);
        Page<Product> page = productDAO.findByKeywords("%" + kwords + "%", pageable);
        model.addAttribute("page", page);
        Boolean isAdmin = (Boolean) session.getAttribute("isAdmin");
        if (isAdmin != null && isAdmin) {
            return "product";
        } else {
            redirectAttributes.addFlashAttribute("error","bạn không phải là admin");
            return "redirect:/Error";
        }
    }

    @PostMapping("/admin/product/save")
    public String saveProduct(@ModelAttribute Product product) {
        productService.save(product);
        return "redirect:/admin/product";
    }

    @GetMapping("/admin/product/edit/{id}")
    public String editProduct(@PathVariable("id") Integer id, Model model) {
        Product product = productService.findById(id);
        model.addAttribute("product", product);
        return "product-form";
    }

    @GetMapping("/admin/product/delete")
    public String deleteProduct(@RequestParam("id") Integer id) {
        productService.delete(id);
        return "redirect:/admin/product";
    }
}





