package com.haja.controllers.customer;

import com.fasterxml.jackson.databind.ObjectMapper;
import com.haja.models.*;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpServletRequest;
import java.io.IOException;
import java.security.Principal;
import java.util.Date;

/**
 * Created by alessio on 22/05/15.
 * Project: HAJA_progettoSIW
 * Package: com.haja.controllers.customer
 */
@Controller
@RequestMapping(value = "/")
public class CatalogueController {

    @Autowired
    private ProductRepository productRepository;

    @Autowired
    private OrderRepository orderRepository;

    @Autowired
    private UserRepository userRepository;

    @RequestMapping(method = RequestMethod.GET)
    public String listProduct(ModelMap model) {
        model.addAttribute("products", productRepository.findAvailableProducts()); //namedQuery in Product
        //return "productViews/index";
        return "homePage";
    }

    @RequestMapping(value="customer/cart", method=RequestMethod.POST)
    public @ResponseBody
    String addOrder(HttpServletRequest request, @RequestParam(value="json", required=false) String json)
            throws IOException {
        Authentication auth = SecurityContextHolder.getContext().getAuthentication();
        User u = userRepository.findByNickname(auth.getName());
        Order order;
        ObjectMapper mapper = new ObjectMapper();
        order = mapper.readValue(json, Order.class);
        order.setClosingDate(new Date());
        order.setUser(u);
        orderRepository.save(order);
        return "W Haja";
    }
}
