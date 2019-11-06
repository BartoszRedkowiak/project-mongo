package org.mongo.projectmongo.marker;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

@Service
@Transactional
public class MarkerService {

    private final MarkerRepository markerRepository;

    @Autowired
    public MarkerService(MarkerRepository markerRepository) {
        this.markerRepository = markerRepository;
    }

    public void save(Marker marker) {
        markerRepository.save(marker);
    }

    public Marker findOne(long id) {
        return markerRepository.findById(id).orElse(null);
    }

    public List<Marker> findAll() {
        return markerRepository.findAll();
    }

    public void update(Marker marker) {
        markerRepository.save(marker);
    }

    public void delete(long id) {
        markerRepository.deleteById(id);
    }
}
