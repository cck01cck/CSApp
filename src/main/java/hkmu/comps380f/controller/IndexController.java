package hkmu.comps380f.controller;

import hkmu.comps380f.dao.CommentService;
import hkmu.comps380f.dao.TicketService;
import jakarta.annotation.Resource;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;


@Controller
public class IndexController {
    @Resource
    private CommentService commentService;
    @Resource
    private TicketService tService;
    @GetMapping("/")
    public String index() {
        return "redirect:/ticket/list";
    }
    @GetMapping("/test")
    public String list(ModelMap model) {
        model.addAttribute("CommentDatabase", commentService.getComments());
        return "login";
    }
    @GetMapping("/login")
    public String login() {
        return "login";
    }
    @GetMapping("/history")
    public String history(ModelMap model) {
        model.addAttribute("ticketDatabase", tService.getTickets());
        model.addAttribute("UserDatabase", tService.getImgs());
        return "history";
    }
    @RequestMapping(value = { "/", "/login" })
    public String staticResource(Model model) {
        return "login";
    }
}

