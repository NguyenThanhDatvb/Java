package com.example.nguyenthihaiyenph53124asm1.Controller;

import com.example.nguyenthihaiyenph53124asm1.DAO.AccountDAO;
import com.example.nguyenthihaiyenph53124asm1.Entity.Account;
import jakarta.servlet.http.HttpSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;

@Controller
public class DangKyController {

    @Autowired
    private AccountDAO accountDAO;

    @Autowired
    private HttpSession session;
    @GetMapping("/dangKy")
    public String dangky(@ModelAttribute Account account, Model model) {
        Account user = (Account) session.getAttribute("user");
        model.addAttribute("user", user);
        return "register.html";
    }

    @PostMapping("/dangKy/add")
    public String add(@ModelAttribute Account account) {
        accountDAO.save(account);
        return "redirect:/auth/login";
    }
}
