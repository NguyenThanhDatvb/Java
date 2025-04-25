package com.example.nguyenthihaiyenph53124asm1.Controller;

import com.example.nguyenthihaiyenph53124asm1.Entity.Account;
import com.example.nguyenthihaiyenph53124asm1.DAO.AccountService;
import jakarta.servlet.http.HttpSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

@Controller
public class AuthController {
    @Autowired
    private AccountService accountService;

    @Autowired
    private HttpSession session;

    @GetMapping("/auth/login")
    public String loginForm(Model model,
                            @RequestParam(value = "error", required = false) String error) {
        if (error != null) {
            model.addAttribute("message", "Tên đăng nhập hoặc mật khẩu không chính xác!");
        }
        return "dangnhap";
    }

    @PostMapping("/auth/login")
    public String loginProcess(
            @RequestParam("username") String username,
            @RequestParam("password") String password,
            RedirectAttributes redirectAttributes) {

        Account user = accountService.findById(username);

        if (user == null || !user.getPassword().equals(password)) {
            redirectAttributes.addAttribute("error", true);
            return "redirect:/auth/login";
        }

        session.setAttribute("user", user);
        session.setAttribute("isAdmin", user.isAdmin());
        return "redirect:/tranghome";
    }
}