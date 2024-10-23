package com.example.remarka.controllers;

import com.example.remarka.models.University;
import com.example.remarka.repositories.ImageURepository;
import com.example.remarka.repositories.UniversityRepository;
import com.example.remarka.services.UniversityService;
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
public class UniversityContrller {
    private final UniversityService universityService;
    private final UniversityRepository universityRepository;
    private final ImageURepository imageURepository;

    @GetMapping("/universities")
    public  String test(Principal principal, Model model)
    {
        model.addAttribute("user", universityService.getUserByPrincipal(principal));
        model.addAttribute("universities", universityRepository.findAll());
        model.addAttribute("image_u", imageURepository.findAll());
        return "universities";
    }

    @PostMapping("/university/create")
    public String createUniversity(@RequestParam("file1") MultipartFile file1, University university) throws IOException {
        universityService.saveUniversity(university, file1);
        return "redirect:/universities";
    }

    @PostMapping("/university/delete/{id}")
    public String deleteUniversity(@PathVariable Long id) {
        universityService.deleteUniversity(id);
        return "redirect:/universities";
    }

}
