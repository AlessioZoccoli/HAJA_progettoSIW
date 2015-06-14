package com.haja.controllers.administrator;

import com.haja.models.Product;
import com.haja.models.ProductRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.validation.BindingResult;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
@RequestMapping(value="/administrator/product")
public class ProductController {

    @Autowired
    private ProductRepository productRepository;

    @RequestMapping(method = RequestMethod.GET)
    public String listProduct(ModelMap model) {
        model.addAttribute(new Product());
        model.addAttribute("products", productRepository.findAll());
        return "productViews/manageProducts";
    }

    @RequestMapping(value = "/add", method = RequestMethod.POST)
    public String addProduct(@ModelAttribute("product") @Validated Product product, BindingResult result) {
        if (result.hasErrors())
            return "productViews/manageProducts";
        productRepository.save(product);
        return "redirect:/administrator/product";
    }


    @RequestMapping(value = "/add", method = RequestMethod.GET)
    public String addProduct(ModelMap model) {
        model.addAttribute("product", new Product());
        return "redirect:/administrator/product";
    }


    @RequestMapping("/delete/{productId}")
    public String deleteSupplier(@PathVariable("productId") Long productId) {
        productRepository.delete(productRepository.findOne(productId));
        return "redirect:/administrator/product";
    }

}
