package com.haja.controllers.customer;

import com.haja.models.User;
import com.haja.models.UserRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.validation.BindingResult;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import javax.validation.Valid;

/**
 * Created by alessio on 24/05/15.
 * Project: HAJA_progettoSIW
 * Package: com.haja.controllers.customer
 */
@Controller
public class AuthenticationController {

    @Autowired
    private UserRepository userRepository;

    @RequestMapping(value = "/signup", method = RequestMethod.GET)
    public String signup(ModelMap model) {
        model.addAttribute("user", new User());
        return "userViews/signup";
    }

    @RequestMapping(value = "/signup", method = RequestMethod.POST)
    public String sendSignup(@ModelAttribute("user") @Validated User user, BindingResult result) {
        if(result.hasErrors()){
            return "userViews/signup";
        }
        userRepository.save(user);
        return "userViews/confirmRegistration";
    }

    @RequestMapping(value = "/login", method = RequestMethod.GET)
    public String login(ModelMap model) {
        model.addAttribute("user", new User());
        return "userViews/login";
    }
}
