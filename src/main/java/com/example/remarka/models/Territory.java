package com.example.remarka.models;

import lombok.Data;

import javax.persistence.*;

@Entity
@Table(name = "Territories")
@Data
public class Territory{
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;
    private String name;
    private String city;
    private Long previewImageId;

    @OneToOne(cascade = CascadeType.ALL, fetch = FetchType.LAZY, mappedBy = "territory")
    private ImageU imageU;

    public void addImageToTerritory(ImageU imageU) {
        imageU.setTerritory(this);
        this.imageU = imageU;
    }


}
