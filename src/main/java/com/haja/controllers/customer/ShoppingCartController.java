package com.haja.controllers.customer;

import com.haja.models.Order;
import com.haja.models.OrderRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.SessionAttributes;


/**
 * Created by alessio on 04/06/15.
 * Project: HAJA_progettoSIW
 * Package: com.haja.controllers.customer
 */

//@SessionAttributes("order")
@Controller
@RequestMapping(value = "/cart")
public class ShoppingCartController {

/*
    @Autowired
    private OrderRepository orderRepository;



    @RequestMapping(value = "/addOrder", method = RequestMethod.GET)
    public String addOrder(@ModelAttribute("user") Order order, BindingResult result){
        if (result.hasErrors()){
            return "orderViews/index";
        }
        orderRepository.save(order);
        return "/cart";
    }
*/
}
