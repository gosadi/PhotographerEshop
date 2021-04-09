package eshop.controller;

import eshop.entity.Account;
import eshop.entity.Category;
import eshop.entity.Item;
import eshop.entity.OrderDetails;
import eshop.entity.Orderr;
import eshop.entity.Product;
import eshop.service.OrderDetailsService;
import eshop.service.OrderrService;
import eshop.service.PaymentService;
import eshop.service.PaypalService;
import eshop.service.UserService;
import java.math.BigDecimal;
import java.security.Principal;
import java.time.LocalDate;
import java.util.ArrayList;
import java.util.List;
import javax.servlet.http.HttpSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class CashController {

    @Autowired
    PaypalService service;
    @Autowired
    OrderDetailsService orderDetailsService;
    @Autowired
    OrderrService orderrService;
    @Autowired
    UserService userService;
    @Autowired
    PaymentService paymentService;

    //stores the data of the order in the database and creates
    //a unique code related to the user and the date the order was placed.
    @GetMapping("/cart/cash")
    public String home(Model model, Principal principal, HttpSession session) {
        payCash(session, principal);
        String paymentCode = null;
        LocalDate today = LocalDate.now();
        int paymentCodeAccountId = (userService.findByUsername(principal.getName())).getId();
        paymentCode = (paymentCodeAccountId + "/" + today);
        model.addAttribute("paymentCode", paymentCode);

        return "/global/cash";
    }

    //creates a new order in the database with all its related session attributes.
    public void payCash(HttpSession session, Principal principal) {
        Product product = null;
        int quant = 0;
        Category category = null;
        BigDecimal totalPrice = BigDecimal.valueOf(0);
        BigDecimal currentPrice = BigDecimal.valueOf(0);

          if((List<Item>) session.getAttribute("cart") == null){
            return;
        }
          
        List<Item> itemares = (List<Item>) session.getAttribute("cart");

        Account tempAccount = userService.findByUsername(principal.getName());
        eshop.entity.Payment paymentEntity = paymentService.getPaymentById(1);

        List<OrderDetails> lista = new ArrayList<>();
        for (Item i : itemares) {
            product = i.getProduct();
            quant = i.getQuantity();
            category = i.getCategory();
            currentPrice = i.getProduct().getBasePrice()
                    .multiply(new BigDecimal(i.getQuantity())
                            .multiply(i.getCategory().getPriceRate()));
            totalPrice = totalPrice.add(currentPrice);

            List<Category> categories = new ArrayList<>();
            categories.add(category);

            OrderDetails tempOrderDetail = orderDetailsService.saveOrderDetail(new OrderDetails(quant, categories, currentPrice, null, product));//quant,current_price,order_id,product_id
            lista.add(tempOrderDetail);

        }
        Orderr tempOrderr = orderrService.saveOrder(new Orderr(LocalDate.now(), totalPrice, tempAccount, paymentEntity, lista));
        for (OrderDetails od : lista) {
            od.setOrderr(tempOrderr);
        }
        Orderr tempOrderr1 = orderrService.saveOrder(tempOrderr);
        session.removeAttribute("cart");
        session.removeAttribute("cartValue");
        session.removeAttribute("cartTotal");
    }
}
