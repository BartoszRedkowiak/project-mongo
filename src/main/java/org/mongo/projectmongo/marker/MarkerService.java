package org.mongo.projectmongo.marker;

import org.hibernate.Hibernate;
import org.mongo.projectmongo.utils.ServiceInterface;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

@Service
@Transactional
public class MarkerService implements ServiceInterface<Marker> {

    private final MarkerRepository markerRepository;

    @Autowired
    public MarkerService(MarkerRepository markerRepository) {
        this.markerRepository = markerRepository;
    }

    @Override
    public void save(Marker marker) {
        markerRepository.save(marker);
    }
    @Override
    public Marker getOne(long id) {
        return markerRepository.findById(id).orElse(null);
    }
    @Override
    public List<Marker> getAll() {
        return markerRepository.findAll();
    }

    public List<Marker> getAllVisible() {
        return markerRepository.findAllByVisibleTrue();
    }
    @Override
    public void update(Marker marker) {
        markerRepository.save(marker);
    }
    @Override
    public void delete(long id) {
        markerRepository.deleteById(id);
    }
}
