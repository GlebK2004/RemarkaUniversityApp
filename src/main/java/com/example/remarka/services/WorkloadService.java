package com.example.remarka.services;

import com.example.remarka.models.Product;
import com.example.remarka.models.User;
import com.example.remarka.repositories.ProductRepository;
import com.example.remarka.repositories.UniversityRepository;
import com.example.remarka.repositories.UserRepository;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Service;

import java.io.IOException;
import java.util.List;
import java.util.Optional;

@Service
@Slf4j
@RequiredArgsConstructor
public class WorkloadService {

    private final ProductRepository productRepository;

    public void addWorkload(User user, String title) throws IOException {
    List<Product> products = productRepository.findByTitle(title);
        Product product = null; // Инициализация переменной
        if (!products.isEmpty()) {
            product = products.get(0); // Получаем первый элемент из списка
        }
    product.setUser(user);
    productRepository.save(product);


}


}
