package com.pickme.pickmeappentityservice.models;

import com.pickme.pickmeappentityservice.models.BaseModel;
import com.pickme.pickmeappentityservice.models.ExactLocation;
import jakarta.persistence.Entity;
import jakarta.persistence.OneToOne;
import lombok.*;

@Entity
@Builder
@AllArgsConstructor
@NoArgsConstructor
@Getter
@Setter
public class NamedLocation extends BaseModel {

    @OneToOne
    private ExactLocation exactLocation;

    private String name;

    private String zipCode;

    private String city;

    private String country;

    private String state;

}