package com.example.remarka.services;

import com.example.remarka.models.Course;
import com.example.remarka.models.User;
import com.example.remarka.repositories.CourseRepository;
import com.example.remarka.repositories.TerritoryRepository;
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

    private final CourseRepository courseRepository;

    public void addWorkload(User user, String title) throws IOException {
    List<Course> courses = courseRepository.findByTitle(title);
        Course course = null; // Инициализация переменной
        if (!courses.isEmpty()) {
            course = courses.get(0); // Получаем первый элемент из списка
        }
    course.setUser(user);
    courseRepository.save(course);


}


}
