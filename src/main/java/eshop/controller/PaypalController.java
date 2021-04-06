package eshop.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.paypal.api.payments.Links;
import com.paypal.api.payments.Payment;
import com.paypal.base.rest.PayPalRESTException;
import eshop.entity.Account;
import eshop.entity.Item;
import eshop.entity.OrderDetails;
import eshop.entity.Orderr;
import eshop.entity.PaypalOrder;
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

@Controller
public class PaypalController {

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

    public static final String SUCCESS_URL = "pay/success";
    public static final String CANCEL_URL = "pay/cancel";

    @GetMapping("/paypal")
    public String home() {
        return "/global/checkout";
    }

    @PostMapping("pay")
    public String payment(@ModelAttribute("order") PaypalOrder order) {
        try {
            Payment payment = service.createPayment(order.getPrice(), order.getCurrency(), order.getMethod(),
                    order.getIntent(), order.getDescription(), "http://localhost:8080/" + CANCEL_URL,
                    "http://localhost:8080/" + SUCCESS_URL);
            for (Links link : payment.getLinks()) {
                if (link.getRel().equals("approval_url")) {
                    return "redirect:" + link.getHref();
                }
            }

        } catch (PayPalRESTException e) {

            e.printStackTrace();
        }
        return "redirect:/";
    }

    @GetMapping(value = CANCEL_URL)
    public String cancelPay() {
        return "global/cancel";
    }

    @GetMapping(value = SUCCESS_URL)
    public String successPay(@RequestParam("paymentId") String paymentId, @RequestParam("PayerID") String payerId, HttpSession session,Principal principal) {
        Product product = null;
        int quant = 0;
        int catid = 0;
        BigDecimal currentPrice = BigDecimal.valueOf(0);

        List<Item> itemares = (List<Item>) session.getAttribute("cart");
        
        Account tempAccount = userService.findByUsername(principal.getName());
        eshop.entity.Payment paymentEntity = paymentService.getPaymentById(2);
        
        List<OrderDetails> lista= new ArrayList<>();

        try {
            Payment payment = service.executePayment(paymentId, payerId);
            System.out.println(payment.toJSON());
            if (payment.getState().equals("approved")) {
                //save to database logic
                for (Item i : itemares) {
                    product = i.getProduct();
                    quant = i.getQuantity();
                    catid = i.getCategory().getId();
                    currentPrice = i.getProduct().getBasePrice()
                            .multiply(new BigDecimal(i.getQuantity())
                                    .multiply(i.getCategory().getPriceRate()));
                    
                    OrderDetails tempOrderDetail= orderDetailsService.saveOrderDetail(new OrderDetails(quant, currentPrice, null, product));//quant,current_price,order_id,product_id
                    lista.add(tempOrderDetail);
                    System.out.println("skata");
                }
                 Orderr tempOrderr =orderrService.saveOrder(new Orderr(LocalDate.now(), currentPrice.add(currentPrice), tempAccount, paymentEntity, lista));
                return "/global/success";
            }
        } catch (PayPalRESTException e) {
            System.out.println(e.getMessage());
        }
        return "redirect:/";
    }

}
