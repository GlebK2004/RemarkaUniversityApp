package com.example.remarka.controllers;

import com.example.remarka.models.Course;
import com.example.remarka.models.User;
import com.example.remarka.services.CourseService;
import com.example.remarka.repositories.TerritoryRepository;
import com.example.remarka.services.TerritoryService;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import java.io.IOException;
import java.security.Principal;

@Controller
@RequiredArgsConstructor
public class CourseController {
    private final CourseService courseService;
    private final TerritoryRepository territoryRepository;
    private final TerritoryService territoryService;

    @GetMapping("/")
    public String courses(@RequestParam(name = "searchWord", required = false) String title, Principal principal, Model model) {
        model.addAttribute("courses", courseService.listCourses(title));
        model.addAttribute("user", courseService.getUserByPrincipal(principal));
        model.addAttribute("territories", territoryRepository.findAll());
        model.addAttribute("searchWord", title);
        model.addAttribute("percentMinsk", territoryService.cityPercent("Минск"));
        model.addAttribute("percentGomel", territoryService.cityPercent("Гомель"));
        model.addAttribute("percentGrodno", territoryService.cityPercent("Гродно"));
        model.addAttribute("percentVitebsk", territoryService.cityPercent("Витебск"));
        return "courses";
    }



    @GetMapping("/course/{id}")
    public String courseInfo(@PathVariable Long id, Model model, Principal principal) {
        Course course = courseService.getCourseById(id);
        model.addAttribute("user", courseService.getUserByPrincipal(principal));
        model.addAttribute("course", course);
        model.addAttribute("images", course.getImages());
        model.addAttribute("authorCourse", course.getUser());
        return "course-info";
    }

    @PostMapping("/course/create")
    public String createCourse(@RequestParam("file1") MultipartFile file1, @RequestParam("file2") MultipartFile file2,
                                @RequestParam("file3") MultipartFile file3, Course course, Principal principal) throws IOException {
        courseService.saveCourse(principal, course, file1, file2, file3);
        return "redirect:/my/courses";
    }

    @PostMapping("/course/delete/{id}")
    public String deleteCourse(@PathVariable Long id, Principal principal) {
        courseService.deleteCourse(courseService.getUserByPrincipal(principal), id);
        return "redirect:/my/courses";
    }

    @GetMapping("/my/courses")
    public String userCourses(Principal principal, Model model) {
        User user = courseService.getUserByPrincipal(principal);
        model.addAttribute("user", user);
        model.addAttribute("courses", user.getCourses());
        return "my-courses";
    }


}
