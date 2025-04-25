package com.example.nguyenthihaiyenph53124asm1.Controller;

import com.example.nguyenthihaiyenph53124asm1.DAO.ProductDAO;
import com.example.nguyenthihaiyenph53124asm1.Entity.Account;
import com.example.nguyenthihaiyenph53124asm1.Entity.Product;
import com.example.nguyenthihaiyenph53124asm1.Service.SessionService;
import jakarta.servlet.http.HttpSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import java.util.List;
import java.util.Optional;

@Controller
public class HomeController {
    @Autowired
    private SessionService sessionService;
    @Autowired
    private ProductDAO productDAO;
    @Autowired
    private HttpSession session;
    @GetMapping("/sell")
    public String showNintendoSwitchhome(Model model) {


        List<Product> sp2 = productDAO.findByCategory_Id(7);
        model.addAttribute("productss", sp2);
        List<Product> sp1 = productDAO.findByCategory_Id(4);
        model.addAttribute("products", sp1);
        List<Product> sp3 = productDAO.findByCategory_Id(2);
        model.addAttribute("productsss", sp3);
        return "best";
    }
    @GetMapping("/tranghome")
    public String tranghome( Model model) {
        Account user = (Account) session.getAttribute("user");
        model.addAttribute("user", user);
        return "Home";
    }
    @RequestMapping("/search")
    public String search(Model model,
                         @RequestParam("keywords") Optional<String> kw) {
        String kwords = kw.orElse(sessionService.get("keywords", ""));
        sessionService.set("keywords", kwords);

        List<Product> products = productDAO.findAllByNameLike("%" + kwords + "%");
        model.addAttribute("products", products);

        return "Search";
    }
}
