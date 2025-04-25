package com.example.nguyenthihaiyenph53124asm1.Controller;

import com.example.nguyenthihaiyenph53124asm1.DAO.AccountDAO;
import com.example.nguyenthihaiyenph53124asm1.Entity.Account;
import jakarta.servlet.http.HttpSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import java.util.List;

@Controller
@RequestMapping("/accounts")
public class QliAccountController {
    @Autowired
    private AccountDAO accountRepository;

    @GetMapping
    public String manageAccounts(Model model, HttpSession session, RedirectAttributes redirectAttributes) {
        List<Account> accounts = accountRepository.findAll();
        model.addAttribute("accounts", accounts);
        model.addAttribute("account", new Account());
        Boolean isAdmin = (Boolean) session.getAttribute("isAdmin");
        if (isAdmin != null && isAdmin) {
            return "account/manage";
        } else {
            redirectAttributes.addFlashAttribute("error","bạn không phải là admin");
            return "redirect:/Error";
        }
    }

    @PostMapping("/add")
    public String addAccount(@ModelAttribute Account account) {
        accountRepository.save(account);
        return "redirect:/accounts";
    }



    @GetMapping("/delete/{username}")
    public String deleteAccount(@PathVariable String username) {
        accountRepository.deleteById(username);
        return "redirect:/accounts";
    }
}
