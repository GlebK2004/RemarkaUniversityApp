package com.example.remarka.models;

import lombok.Data;

import javax.persistence.*;

@Entity
@Table(name = "universities")
@Data
public class University{
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;
    private String name;
    private String city;
    private Long previewImageId;

    @OneToOne(cascade = CascadeType.ALL, fetch = FetchType.LAZY, mappedBy = "university")
    private ImageU imageU;

    public void addImageToUniversity(ImageU imageU) {
        imageU.setUniversity(this);
        this.imageU = imageU;
    }


}
