package org.mongo.projectmongo.marker;



import org.mongo.projectmongo.category.Category;
import org.springframework.boot.context.properties.bind.DefaultValue;

import javax.persistence.*;
import java.time.LocalDateTime;
import java.util.List;

@Entity
@Table(name = "markers")
public class Marker {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;

    private double lat;

    private double lng;

    private String name;

    private String description;

    @ManyToMany
    @JoinTable(name = "markers_categories",
            joinColumns = @JoinColumn(name = "marker_id"),
            inverseJoinColumns = @JoinColumn(name = "category_id"))
    private List<Category> categories;

    private LocalDateTime createdOn;

    private LocalDateTime updatedOn;

    private boolean visible = false;

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

    public double getLat() {
        return lat;
    }

    public void setLat(double lat) {
        this.lat = lat;
    }

    public double getLng() {
        return lng;
    }

    public void setLng(double lng) {
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
}
