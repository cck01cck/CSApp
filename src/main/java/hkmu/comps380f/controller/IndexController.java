package hkmu.comps380f.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;


@Controller
public class IndexController {
    @GetMapping("/")
    public String index() {
        return "redirect:/ticket/list";
    }

    @GetMapping("/login")
    public String login() {
        return "login";
    }
    @GetMapping("/history")
    public String history() {
        return "history";
    }
    @RequestMapping(value = { "/", "/login" })
    public String staticResource(Model model) {
        return "login";
    }
}

