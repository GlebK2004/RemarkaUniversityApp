package com.example.remarka.repositories;

import com.example.remarka.models.Product;
import org.springframework.data.jpa.repository.JpaRepository;

import java.util.List;
import java.util.Optional;

public interface ProductRepository extends JpaRepository<Product, Long> {
    List<Product> findByTitle(String title);

    Optional<Product> findByUserId(Long id);
}
