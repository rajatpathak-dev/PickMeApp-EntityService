package com.pickme.pickmeappentityservice.models;

import jakarta.persistence.*;
import jakarta.validation.constraints.DecimalMax;
import jakarta.validation.constraints.DecimalMin;
import lombok.*;
import org.hibernate.annotations.Fetch;
import org.hibernate.annotations.FetchMode;

import java.util.ArrayList;
import java.util.List;

@Entity
@Getter
@Setter
@Builder
@NoArgsConstructor
@AllArgsConstructor
public class Driver extends BaseModel{

    private  String name;

    @Column(unique = true)
    private String phoneNo;
    private boolean isActive;

    @Column(nullable = false,unique = true)
    private String email;

    @Column(nullable = false)
    private String password;

    @Column(nullable = false,unique = true)
    private String licenseNo;

    @OneToOne(mappedBy = "driver",cascade = {CascadeType.ALL})
    private Car car;

    @OneToOne
    private ExactLocation lastKnownLocation;

    @Enumerated(value = EnumType.STRING)
    private DriverApprovalStatus driverApprovalStatus;


    @OneToOne
    private ExactLocation home;

    private String activeCity;

    @DecimalMin(value = "0.00", message = "Rating must be grater than or equal to 0.00")
    @DecimalMax(value = "5.00", message = "Rating must be less than or equal to 5.00")
    private double rating;

    @OneToMany(mappedBy = "driver")
    private List<Booking> bookingList = new ArrayList<>();


}
