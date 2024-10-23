package com.example.remarka.repositories;

import com.example.remarka.models.University;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;

import java.util.List;

public interface UniversityRepository extends JpaRepository<University, Long> {
    List<University> findByName(String name);
    @Query("SELECT u FROM University u WHERE u.city = :city")
    List<University> findAllByCity(@Param("city") String city);

}
