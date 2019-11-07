package org.mongo.projectmongo.user;

import org.hibernate.validator.constraints.UniqueElements;
import org.mongo.projectmongo.category.Category;

import javax.persistence.*;
import java.time.LocalDateTime;
import java.util.List;

@Entity
public class User {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private long id;

    private String firstName;
    private String lastName;

    @Column(unique = true, nullable = false)
    private String email;

    @Column(nullable = false)
    private String password;

    @Column(nullable = false)
    private List<Category> sportType;

    private LocalDateTime registrationDate;

    @PrePersist
    public void prePersist(){
        registrationDate = LocalDateTime.now();
    }



}
