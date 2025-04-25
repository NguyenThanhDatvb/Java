package com.example.nguyenthihaiyenph53124asm1.Controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class ErrorController {
    @GetMapping("/Error")
    public String error() {
        return "error";
    }
}
