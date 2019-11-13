package org.mongo.projectmongo.eventContribution;

import org.mongo.projectmongo.marker.Marker;
import org.mongo.projectmongo.user.User;

import javax.persistence.*;
import java.time.LocalDateTime;
import java.util.List;

@Entity(name = "event_contributions")
public class EventContribution {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;
    private String name;
    private String igLink;
    private Integer votes = 0;
    private Boolean validated = false;

    @ManyToOne
    @JoinColumn(name = "marker_id")
    private Marker marker;

    @ManyToOne
    @JoinColumn(name = "user_id")
    private User user;

    @ManyToMany
    @JoinTable(name = "contributions_users_votes",
    joinColumns = @JoinColumn(name = "event_contribution_id"),
    inverseJoinColumns = @JoinColumn(name = "user_id"))
    private List<User> usersThatVoted;

    private LocalDateTime created;

    @PrePersist
    public void prePersist(){
        created = LocalDateTime.now();
    }

    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public String getIgLink() {
        return igLink;
    }

    public void setIgLink(String igLink) {
        this.igLink = igLink;
    }

    public Integer getVotes() {
        return votes;
    }

    public void setVotes(Integer votes) {
        this.votes = votes;
    }

    public Boolean getValidated() {
        return validated;
    }

    public void setValidated(Boolean validated) {
        this.validated = validated;
    }

    public Marker getMarker() {
        return marker;
    }

    public void setMarker(Marker marker) {
        this.marker = marker;
    }

    public User getUser() {
        return user;
    }

    public void setUser(User user) {
        this.user = user;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }
}
