package org.mongo.projectmongo.review;

import org.mongo.projectmongo.marker.Marker;
import org.mongo.projectmongo.user.User;

import javax.persistence.*;

@Entity
@Table(name = "reviews")
public class Review {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;

    @Column(nullable = false)
    private Integer rating;

    private String content;

    @ManyToOne
    @JoinColumn(name = "user_id")
    private User user;

    @ManyToOne
    @JoinColumn(name = "marker_id")
    private Marker marker;
}
