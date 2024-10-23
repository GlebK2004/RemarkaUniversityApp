package com.example.remarka.controllers;

import com.example.remarka.models.Territory;
import com.example.remarka.repositories.ImageURepository;
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
public class TerritoryContrller {
    private final TerritoryService territoryService;
    private final TerritoryRepository territoryRepository;
    private final ImageURepository imageURepository;

    @GetMapping("/territories")
    public  String test(Principal principal, Model model)
    {
        model.addAttribute("user", territoryService.getUserByPrincipal(principal));
        model.addAttribute("Territories", territoryRepository.findAll());
        model.addAttribute("image_u", imageURepository.findAll());
        return "territories";
    }

    @PostMapping("/territory/create")
    public String createTerritory(@RequestParam("file1") MultipartFile file1, Territory territory) throws IOException {
        territoryService.saveTerritory(territory, file1);
        return "redirect:/territories";
    }

    @PostMapping("/territory/delete/{id}")
    public String deleteTerritory(@PathVariable Long id) {
        territoryService.deleteTerritory(id);
        return "redirect:/territories";
    }

}
