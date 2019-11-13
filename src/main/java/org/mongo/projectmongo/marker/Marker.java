package org.mongo.projectmongo.marker;

import org.mongo.projectmongo.category.Category;
import org.mongo.projectmongo.eventContribution.EventContribution;
import org.mongo.projectmongo.review.Review;

import javax.persistence.*;
import javax.validation.constraints.NotBlank;
import javax.validation.constraints.NotEmpty;
import javax.validation.constraints.Size;
import java.time.LocalDateTime;
import java.util.List;

@Entity
@Table(name = "markers")
public class Marker implements Cloneable {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;


    @Column(nullable = false)
    private Double lat;


    @Column(nullable = false)
    private Double lng;

    @NotBlank
    @Size(min = 5, max = 30)
    @Column(nullable = false)
    private String name;

    @Size(max = 255)
    private String description;

    @OneToMany(mappedBy = "marker")
    private List<EventContribution> eventContributions;

    private Boolean activeEvent = false;

    @NotEmpty
    @ManyToMany
    @JoinTable(name = "markers_categories",
            joinColumns = @JoinColumn(name = "marker_id"),
            inverseJoinColumns = @JoinColumn(name = "category_id"))
    private List<Category> categories;
    private LocalDateTime createdOn;
    private LocalDateTime updatedOn;
    private Boolean visible = false;

    public Marker() {
    }
    //Cloning constructor
    public Marker(Marker marker) {
        this.lat = marker.lat;
        this.lng = marker.lng;
        this.name = marker.name;
        this.description = marker.description;
        this.categories = marker.categories;
        this.createdOn = marker.createdOn;
        this.updatedOn = marker.updatedOn;
        this.visible = false;
        this.activeEvent = false;
        this.markerEdits = null;
        this.parent = marker;
        this.reviews = marker.reviews;
    }

    @OneToMany(mappedBy = "parent")
    private List<Marker> markerEdits;

    @ManyToOne
    @JoinColumn(name = "marker_id")
    private Marker parent;

    @OneToMany(mappedBy = "marker")
    private List<Review> reviews;

    @PrePersist
    public void prePersist(){
        createdOn = LocalDateTime.now();
    }

    @PreUpdate
    public void preUpdate(){
        updatedOn = LocalDateTime.now();
    }

    public LocalDateTime getCreatedOn() {
        return createdOn;
    }

    public void setCreatedOn(LocalDateTime createdOn) {
        this.createdOn = createdOn;
    }

    public LocalDateTime getUpdatedOn() {
        return updatedOn;
    }

    public void setUpdatedOn(LocalDateTime updatedOn) {
        this.updatedOn = updatedOn;
    }

    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public Double getLat() {
        return lat;
    }

    public void setLat(Double lat) {
        this.lat = lat;
    }

    public Double getLng() {
        return lng;
    }

    public void setLng(Double lng) {
        this.lng = lng;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public List<Category> getCategories() {
        return categories;
    }

    public void setCategories(List<Category> categories) {
        this.categories = categories;
    }

    public Boolean getVisible() {
        return visible;
    }

    public void setVisible(Boolean visible) {
        this.visible = visible;
    }

    public List<Review> getReviews() {
        return reviews;
    }

    public void setReviews(List<Review> reviews) {
        this.reviews = reviews;
    }

    public Boolean getActiveEvent() {
        return activeEvent;
    }

    public void setActiveEvent(Boolean activeEvent) {
        this.activeEvent = activeEvent;
    }

    public List<Marker> getMarkerEdits() {
        return markerEdits;
    }

    public void setMarkerEdits(List<Marker> markerEdits) {
        this.markerEdits = markerEdits;
    }

    public Marker getParent() {
        return parent;
    }

    public void setParent(Marker parent) {
        this.parent = parent;
    }

    public List<EventContribution> getEventContributions() {
        return eventContributions;
    }

    public void setEventContributions(List<EventContribution> eventContributions) {
        this.eventContributions = eventContributions;
    }
}
