package com.pickme.pickmeapp_review_service.models;

import jakarta.annotation.Nullable;
import jakarta.persistence.*;
import lombok.*;
import org.hibernate.annotations.CreationTimestamp;
import org.hibernate.annotations.UpdateTimestamp;


import java.time.LocalDateTime;
import java.util.Date;

@Entity
@Table(name = "booking_reviews")
@Builder
@NoArgsConstructor
@AllArgsConstructor
@Getter
@Setter
@Inheritance(strategy = InheritanceType.JOINED)
public class Review extends BaseModel {


   private String content;

   @Column(nullable = false)
   private Double rating;

   @OneToOne
   @JoinColumn(nullable = false,name = "booking_id")
   private Booking booking;

}
