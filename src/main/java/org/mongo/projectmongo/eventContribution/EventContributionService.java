package org.mongo.projectmongo.eventContribution;

import org.mongo.projectmongo.utils.ServiceInterface;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

@Service
@Transactional
public class EventContributionService implements ServiceInterface<EventContribution> {

    private final EventContributionRepository eventContributionRepository;
    @Autowired
    public EventContributionService(EventContributionRepository eventContributionRepository) {
        this.eventContributionRepository = eventContributionRepository;
    }

    @Override
    public void save(EventContribution eventContribution) {
        eventContributionRepository.save(eventContribution);
    }

    @Override
    public EventContribution getOne(long id) {
        return eventContributionRepository.findById(id).orElse(null);
    }

    @Override
    public List<EventContribution> getAll() {
        return eventContributionRepository.findAll();
    }

    public List<EventContribution> getAllFromLatest() {
        return eventContributionRepository.findAllByOrderByIdDesc();
    }

    public List<EventContribution> getAllValidatedForMarker(Long id) {
        return eventContributionRepository.findAllByValidatedTrueAndMarker_IdOrderByVotesDesc(id);
    }

    @Override
    public void update(EventContribution eventContribution) {
        eventContributionRepository.save(eventContribution);
    }

    @Override
    public void delete(long id) {
        eventContributionRepository.deleteById(id);
    }

}
