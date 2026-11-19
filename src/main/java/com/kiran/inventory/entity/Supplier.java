package com.kiran.inventory.entity;

import jakarta.persistence.*;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import org.hibernate.annotations.CreationTimestamp;
import org.hibernate.annotations.UpdateTimestamp;

import java.time.Instant;

@Entity
@Table(name = "suppliers")
@Getter
@Setter
@NoArgsConstructor
public class Supplier {
    @Id @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;
    @Column(nullable = false,length = 150)
    private String name;
    @Column(length = 150)
    private String contactEmail;
    @Column(length = 30)
    private String phone;
    @CreationTimestamp @Column(nullable = false, updatable = false)
    private Instant createdAt;
    @UpdateTimestamp @Column(nullable = false)
    private Instant updatedAt;
}

