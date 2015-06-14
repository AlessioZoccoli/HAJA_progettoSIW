package com.haja.controllers.customer;

import com.haja.models.Product;
import com.haja.models.ProductRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

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

    @RequestMapping(method = RequestMethod.GET)
    public String listProduct(ModelMap model) {
        model.addAttribute("products", productRepository.findAvailableProducts()); //namedQuery in Product
        return "productViews/index";
    }
}
