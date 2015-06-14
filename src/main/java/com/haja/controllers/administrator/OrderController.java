package com.haja.controllers.administrator;

import com.haja.models.Order;
import com.haja.models.OrderRepository;
import com.haja.models.User;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import java.util.Collection;

/**
 * Created by alessio on 22/05/15.
 * Project: HAJA_progettoSIW
 * Package: com.haja.controllers.administrator
 */

@Controller
@RequestMapping(value = "/administrator/orders")
public class OrderController {

    @Autowired
    private OrderRepository orderRepository;

    @RequestMapping(method = RequestMethod.GET)
    public String listUsers(ModelMap model) {
        model.addAttribute("order", new Order());
        model.addAttribute("orders",orderRepository.findAll());
        return "orderViews/index";
    }

}
