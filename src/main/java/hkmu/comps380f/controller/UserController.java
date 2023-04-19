package hkmu.comps380f.controller;


import hkmu.comps380f.model.TicketUser;
import hkmu.comps380f.service.TicketUserService2;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class UserController {

    @Autowired
    private TicketUserService2 ticketUserService2;

    @GetMapping("/register")
    public String showRegistrationForm() {
        return "register";
    }

    @GetMapping(value ="/register2")
    public String processRegistrationForm(
            @RequestParam String username,
            @RequestParam String password,
            Model model
    ) {

        TicketUser user = new TicketUser(username, password, new String[] {"ROLE_USER"});

        if (ticketUserService2.saveUser(user)) {
            model.addAttribute("message", "User registered successfully!");
        } else {
            model.addAttribute("error", "An error occurred while registering user");
        }

        return "login";
    }
}
