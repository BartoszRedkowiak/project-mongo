package org.mongo.projectmongo.marker;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;

import java.util.List;

public interface MarkerRepository extends JpaRepository<Marker, Long> {

    public List<Marker> findAllByVisibleTrue ();

    public List<Marker> findAllByParentNull();

    @Query("select m from Marker m where lat between :minLat and :maxLat and lng between :minLng and :maxLng and visible = true")
    public List<Marker> findAllFiltered(@Param("minLat") Double minLat,
                                        @Param("maxLat") Double maxLat,
                                        @Param("minLng") Double minLng,
                                        @Param("maxLng") Double maxLng);


}
