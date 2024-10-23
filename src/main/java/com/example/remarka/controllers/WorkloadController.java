package com.example.remarka.controllers;

import com.example.remarka.models.EmailRequest;
import com.example.remarka.models.User;
import com.example.remarka.services.*;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import org.springframework.beans.factory.annotation.Autowired;

import java.io.IOException;
import java.security.Principal;

@Controller
@RequiredArgsConstructor
public class WorkloadController
{
    private final UserService userService;
    private final ProductService productService;
    private final TerritoryService territoryService;
    private final WorkloadService workloadService;
    @Autowired
    private EmailService emailService;

    @PostMapping("/send-email")
    public String sendEmail(@RequestBody EmailRequest request) {
        emailService.sendSimpleMessage(request.getTo(), request.getSubject(), request.getText());
        return "redirect:/products";
    }

    @GetMapping("/workload-menu")
    public  String workload_menu(Principal principal, Model model)
    {
        User user = userService.getUserByPrincipal(principal);
        model.addAttribute("user", user);
        return "workload-menu";
    }

    @GetMapping("/workload")
    public  String workload(Principal principal, Model model)
    {
        model.addAttribute("users", userService.list());
        User user = userService.getUserByPrincipal(principal);
        model.addAttribute("user", user);
        return "workload";
    }

    @GetMapping("/add-workload/{user}")
    public String addSubject( @PathVariable User user, Model model, Principal principal) {
        model.addAttribute("user", user);
        model.addAttribute("admin", userService.getUserByPrincipal(principal));
        User admin = userService.getUserByPrincipal(principal);
        model.addAttribute("products", admin.getProducts());

        return "workload-subject";
    }

    @PostMapping("/add-workload/done")
    public String addSubject( @RequestParam("user") User user, @RequestParam("productTitle") String title) throws IOException {
        workloadService.addWorkload(user, title);
        return "redirect:/workload";
    }

    @GetMapping("/dashboard")
    public  String dashboard(Principal principal, Model model)
    {
        User user = userService.getUserByPrincipal(principal);
        model.addAttribute("user", user);
        model.addAttribute("countUniversities", territoryService.countUniversities());
        model.addAttribute("countProducts", productService.countProducts());
        model.addAttribute("countUsers", userService.countUsers());
        model.addAttribute("sortedProducts", productService.sortedProducts());
        return "dashboard";
    }

    @GetMapping("/dashboard2")
    public  String dashboard2(Principal principal, Model model)
    {
        User user = userService.getUserByPrincipal(principal);
        model.addAttribute("user", user);
        model.addAttribute("percentMinsk", territoryService.cityPercent("Минск"));
        model.addAttribute("percentGomel", territoryService.cityPercent("Гомель"));
        model.addAttribute("percentGrodno", territoryService.cityPercent("Гродно"));
        model.addAttribute("percentVitebsk", territoryService.cityPercent("Витебск"));
        return "dashboard2";
    }



}
