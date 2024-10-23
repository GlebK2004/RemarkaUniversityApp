package com.example.remarka.repositories;

import com.example.remarka.models.Territory;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;

import java.util.List;

public interface TerritoryRepository extends JpaRepository<Territory, Long> {
    List<Territory> findByName(String name);
    @Query("SELECT u FROM Territory u WHERE u.city = :city")
    List<Territory> findAllByCity(@Param("city") String city);

}
