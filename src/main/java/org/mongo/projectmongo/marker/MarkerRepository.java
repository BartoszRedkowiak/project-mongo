package org.mongo.projectmongo.marker;

import org.springframework.data.jpa.repository.JpaRepository;

import java.util.List;

public interface MarkerRepository extends JpaRepository<Marker, Long> {

    public List<Marker> findAllByVisibleTrue ();
}
