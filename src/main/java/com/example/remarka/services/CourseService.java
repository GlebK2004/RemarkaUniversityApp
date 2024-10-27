package com.example.remarka.services;

import com.example.remarka.models.Image;
import com.example.remarka.models.Course;
import com.example.remarka.models.User;
import com.example.remarka.repositories.CourseRepository;
import com.example.remarka.repositories.UserRepository;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.data.domain.Sort;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import java.io.IOException;
import java.security.Principal;
import java.util.List;

@Service
@Slf4j
@RequiredArgsConstructor
public class CourseService {
    private final CourseRepository courseRepository;
    private final UserRepository userRepository;

    public List<Course> listCourses(String title) {
        if (title != null) return courseRepository.findByTitle(title);
        return courseRepository.findAll();
    }

    public int countCourses(){
        List<Course> courses = courseRepository.findAll();
        return courses.size();
    }



    public List<Course> sortedCourses()
    {
        //List<Course> courses = courseRepository.findAll();
        return courseRepository.findAll(Sort.by(Sort.Direction.ASC, "hours"));
    }

    public void saveCourse(Principal principal, Course course, MultipartFile file1, MultipartFile file2, MultipartFile file3) throws IOException {
        course.setUser(getUserByPrincipal(principal));
        Image image1;
        Image image2;
        Image image3;
        if (file1.getSize() != 0) {
            image1 = toImageEntity(file1);
            image1.setPreviewImage(true);
            course.addImageToCourse(image1);
        }
        if (file2.getSize() != 0) {
            image2 = toImageEntity(file2);
            course.addImageToCourse(image2);
        }
        if (file3.getSize() != 0) {
            image3 = toImageEntity(file3);
            course.addImageToCourse(image3);
        }
        log.info("Saving new Course. Title: {}; Author email: {}", course.getTitle(), course.getUser().getEmail());
        Course courseFromDb = courseRepository.save(course);
        courseFromDb.setPreviewImageId(courseFromDb.getImages().get(0).getId());
        courseRepository.save(course);
    }

    public User getUserByPrincipal(Principal principal) {
        if (principal == null) return new User();
        return userRepository.findByEmail(principal.getName());
    }

    private Image toImageEntity(MultipartFile file) throws IOException {
        Image image = new Image();
        image.setName(file.getName());
        image.setOriginalFileName(file.getOriginalFilename());
        image.setContentType(file.getContentType());
        image.setSize(file.getSize());
        image.setBytes(file.getBytes());
        return image;
    }

    public void deleteCourse(User user, Long id) {
        Course course = courseRepository.findById(id)
                .orElse(null);
        if (course != null) {
            if (course.getUser().getId().equals(user.getId())) {
                courseRepository.delete(course);
                log.info("Course with id = {} was deleted", id);
            } else {
                log.error("User: {} haven't this course with id = {}", user.getEmail(), id);
            }
        } else {
            log.error("Course with id = {} is not found", id);
        }    }

    public Course getCourseById(Long id) {
        return courseRepository.findById(id).orElse(null);
    }
}
