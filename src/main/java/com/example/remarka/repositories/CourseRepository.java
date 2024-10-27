package com.example.remarka.repositories;

import com.example.remarka.models.Course;
import org.springframework.data.jpa.repository.JpaRepository;

import java.util.List;
import java.util.Optional;

public interface CourseRepository extends JpaRepository<Course, Long> {
    List<Course> findByTitle(String title);

    Optional<Course> findByUserId(Long id);
}
