package eshop.service;


import eshop.entity.Payment;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

@Transactional
@Service

public interface PaymentService {

    Payment  getPaymentById(int id);
}
