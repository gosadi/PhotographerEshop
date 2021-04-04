package eshop.service;

import eshop.entity.Category;
import eshop.entity.Payment;
import java.util.List;
import java.util.Optional;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

@Transactional
@Service

public interface PaymentService {

    Optional<Payment> getPaymentById(int id);
}
