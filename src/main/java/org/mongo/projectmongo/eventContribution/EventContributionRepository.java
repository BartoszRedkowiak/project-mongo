package org.mongo.projectmongo.eventContribution;

import org.springframework.data.jpa.repository.JpaRepository;

import java.util.List;

public interface EventContributionRepository extends JpaRepository<EventContribution, Long> {

    public List<EventContribution> findAllByValidatedTrueAndMarker_IdOrderByVotesDesc(Long markerId);
}
