package com.example.nguyenthihaiyenph53124asm1.Controller;


import com.example.nguyenthihaiyenph53124asm1.Service.ShopingCartService;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;



@Controller
public class ShopingCartController {
    @Autowired
    ShopingCartService shopingCartService;

    // Thêm model attribute cho tất cả các request
    @ModelAttribute
    public void addCartAttributes(Model model) {
        model.addAttribute("cartCount", shopingCartService.getCount());
    }

    @RequestMapping("/cart/view")
    public String view(Model model) {
        model.addAttribute("cart", shopingCartService.getAll());
        model.addAttribute("totalAmount", shopingCartService.getAmount());
        model.addAttribute("count", shopingCartService.getCount());
        return "gio";
    }
    @RequestMapping("/cart/add/{id}")
    public String add(@PathVariable("id") Integer id) {
        shopingCartService.add(id);
        return "redirect:/cart/view";
    }


    @RequestMapping("/cart/remove/{id}")
    public String remove(@PathVariable("id") Integer id) {
        shopingCartService.remove(id);
        return "redirect:/cart/view";
    }

    @RequestMapping("/cart/update/{id}")
    public String update(@PathVariable("id") Integer id, @RequestParam("qty") Integer qty) {
        if (qty != 0) {
            shopingCartService.update(id, qty);
        }
        return "redirect:/cart/view";
    }

    @RequestMapping("/cart/clear")
    public String clear() {
        shopingCartService.clear();
        return "redirect:/cart/view";
    }


}
