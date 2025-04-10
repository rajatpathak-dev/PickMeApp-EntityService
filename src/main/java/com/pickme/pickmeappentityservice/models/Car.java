package com.pickme.pickmeappentityservice.models;

import jakarta.persistence.*;
import lombok.*;

@Entity
@Getter
@Setter
@Builder
@AllArgsConstructor
@NoArgsConstructor
public class Car extends BaseModel{
    @Column(unique = true, nullable = false)
    private String plateNumber;
    private String model;
    private String brand;

    @Enumerated(value = EnumType.STRING)
    private CarType carType;


    @ManyToOne(cascade = {CascadeType.ALL})
    private Color color;

    @OneToOne
    private Driver driver;






}
