package com.example.remarka.services;

import com.example.remarka.models.*;
import com.example.remarka.repositories.TerritoryRepository;
import com.example.remarka.repositories.UserRepository;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import java.io.IOException;
import java.security.Principal;
import java.util.List;

@Service
@Slf4j
@RequiredArgsConstructor
public class TerritoryService
{
    private final TerritoryRepository territoryRepository;
    private final UserRepository userRepository;

    public List<Territory> listUniversities(String title) {
        if (title != null) return territoryRepository.findByName(title);
        return territoryRepository.findAll();
    }

    public int countUniversities(){
        List<Territory> Territories = territoryRepository.findAll();
        return Territories.size();
    }

    public int cityPercent(String city){
        List<Territory> Territories = territoryRepository.findAll();
        List<Territory> TerritoriesCities = territoryRepository.findAllByCity(city);
        int percent = TerritoriesCities.size()*100/Territories.size();
        return percent;
    }

    public void saveTerritory( Territory territory, MultipartFile file1) throws IOException {
        ImageU imageU;
        if (file1.getSize() != 0) {
            imageU = toImageEntity(file1);
            imageU.setPreviewImageU(true);
            territory.addImageToTerritory(imageU);
        } else log.error("NO PHOTO");

        log.info("Saving new Territory. Name: {}, City: {}", territory.getName(), territory.getCity() );
        Territory productFromDb = territoryRepository.save(territory);
        productFromDb.setPreviewImageId(productFromDb.getImageU().getId());
        territoryRepository.save(territory);
    }

    public void deleteTerritory(Long id) {
        Territory territory = territoryRepository.findById(id).orElse(null);
        if (territory != null) {
            territoryRepository.delete(territory);
            log.info("Territory with id = {} was deleted", id);
        } else {
            log.error("Product with id = {} is not found", id);
        }
    }

    private ImageU toImageEntity(MultipartFile file) throws IOException {
        ImageU image = new ImageU();
        image.setName(file.getName());
        image.setOriginalFileName(file.getOriginalFilename());
        image.setContentType(file.getContentType());
        image.setSize(file.getSize());
        image.setBytes(file.getBytes());
        return image;
    }

    public User getUserByPrincipal(Principal principal) {
        if (principal == null) return new User();
        return userRepository.findByEmail(principal.getName());
    }
}
