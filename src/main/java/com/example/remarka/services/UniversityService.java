package com.example.remarka.services;

import com.example.remarka.models.*;
import com.example.remarka.repositories.UniversityRepository;
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
public class UniversityService
{
    private final UniversityRepository universityRepository;
    private final UserRepository userRepository;

    public List<University> listUniversities(String title) {
        if (title != null) return universityRepository.findByName(title);
        return universityRepository.findAll();
    }

    public int countUniversities(){
        List<University> universities = universityRepository.findAll();
        return universities.size();
    }

    public int cityPercent(String city){
        List<University> universities = universityRepository.findAll();
        List<University> universitiesCities = universityRepository.findAllByCity(city);
        int percent = universitiesCities.size()*100/universities.size();
        return percent;
    }

    public void saveUniversity( University university, MultipartFile file1) throws IOException {
        ImageU imageU;
        if (file1.getSize() != 0) {
            imageU = toImageEntity(file1);
            imageU.setPreviewImageU(true);
            university.addImageToUniversity(imageU);
        } else log.error("NO PHOTO");

        log.info("Saving new University. Name: {}, City: {}", university.getName(), university.getCity() );
        University productFromDb = universityRepository.save(university);
        productFromDb.setPreviewImageId(productFromDb.getImageU().getId());
        universityRepository.save(university);
    }

    public void deleteUniversity(Long id) {
        University university = universityRepository.findById(id).orElse(null);
        if (university != null) {
            universityRepository.delete(university);
            log.info("University with id = {} was deleted", id);
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
