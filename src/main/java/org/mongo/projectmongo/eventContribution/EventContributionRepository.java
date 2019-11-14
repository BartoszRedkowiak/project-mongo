package org.mongo.projectmongo.eventContribution;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Modifying;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;

import java.util.List;

public interface EventContributionRepository extends JpaRepository<EventContribution, Long> {

    public List<EventContribution> findAllByValidatedTrueAndMarker_IdOrderByVotesDesc(Long markerId);

    public List<EventContribution> findAllByOrderByIdDesc();

    @Modifying
    @Query("update EventContribution e set e.user = null where e.user.id = :userId")
    public void unbindUserFromContributions(@Param("userId") Long userId);

    @Modifying
    @Query(value = "delete  from contributions_users_votes as c where user_id = :userId", nativeQuery = true)
    public void unbindUserFromContributionVotes(@Param("userId") Long userId);


}
