package com.pickme.pickmeappauthservice.models;

import jakarta.persistence.Column;
import jakarta.persistence.Entity;
import jakarta.persistence.OneToMany;
import lombok.*;

import java.util.ArrayList;
import java.util.List;

@Entity
@Getter
@Setter
@Builder
@NoArgsConstructor
@AllArgsConstructor
public class Passenger extends  BaseModel{
    @Column(nullable = false)
    private String name;

    @Column(nullable = false)
    private  String email;

    @Column(nullable = false)
    private String phoneNo;

    @Column(nullable = false)
    private String password;

    @OneToMany(mappedBy = "passenger")
    private List<Booking> bookingList = new ArrayList<>();
}
