package org.mongo.projectmongo.review;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Modifying;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;

public interface ReviewRepository extends JpaRepository<Review, Long> {

    @Modifying
    @Query("update Review r set r.user = null where r.user.id = :userId")
    public void unbindUserFromReviews(@Param("userId") Long userId);

}
