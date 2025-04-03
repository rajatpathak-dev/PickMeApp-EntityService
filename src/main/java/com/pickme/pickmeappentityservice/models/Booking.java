package com.pickme.pickmeappentityservice.models;

import jakarta.persistence.*;
import lombok.*;

import java.time.LocalDateTime;

@Entity
@Setter
@Builder
@NoArgsConstructor
@Getter
@AllArgsConstructor
public class Booking extends  BaseModel{



    @Enumerated(value = EnumType.STRING)
    private BookingStatus bookingStatus;
    private LocalDateTime startTime;
    private LocalDateTime endTime;
    private Long distance;

    @ManyToOne
    private Driver driver;

    @ManyToOne
    private Passenger passenger;


    @OneToOne(cascade = {CascadeType.ALL})
    private ExactLocation startLocation;

    @OneToOne(cascade = {CascadeType.ALL})
    private ExactLocation endLocation;
}
