package com.example.nguyenthihaiyenph53124asm1.Service;

import jakarta.servlet.http.HttpSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.context.annotation.SessionScope;

@Service
@SessionScope
public class SessionService {
    @Autowired
    private HttpSession session;
//get
    public String get(String key, String defaultValue) {
        Object value = session.getAttribute(key);
        return value != null ? value.toString() : defaultValue;
    }
//set
    public void set(String key, String value) {
        session.setAttribute(key, value);
    }

}
