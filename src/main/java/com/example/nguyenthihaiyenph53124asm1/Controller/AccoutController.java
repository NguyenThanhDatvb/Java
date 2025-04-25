package com.example.nguyenthihaiyenph53124asm1.Controller;


import com.example.nguyenthihaiyenph53124asm1.DAO.AccountDAO;
import com.example.nguyenthihaiyenph53124asm1.Entity.Account;
import jakarta.servlet.http.HttpSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

@Controller
public class AccoutController {
    @Autowired
    private AccountDAO accountDAO;
    @Autowired
    private HttpSession session;
    @GetMapping("/account/edit")
    public String editAccount(Model model) {
        Account user = (Account) session.getAttribute("user");
        model.addAttribute("user", user);
        return "quanlitaikhoan";
    }

    @PostMapping("/account/edit")
    public String updateAccount(@RequestParam("username") String username,
                                @RequestParam("password") String password,
                                @RequestParam("fullname") String fullname,
                                @RequestParam("email") String email ){

        Account user = (Account) session.getAttribute("user");


        user.setUsername(username);
        user.setPassword(password);
        user.setFullname(fullname);
        user.setEmail(email);

        accountDAO.save(user);

        session.setAttribute("user", user);

        return "redirect:/account/edit";
    }
}

