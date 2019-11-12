package org.mongo.projectmongo.marker;

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

    public List<Marker> getAllFiltered(Double lat, Double lng, Integer distance){
        Double distanceConverted = 360.0 / 40075 * Double.valueOf(distance);

        Double minLat = lat - distanceConverted;
        Double maxLat = lat + distanceConverted;
        Double minLng = lng - distanceConverted;
        Double maxLng = lng + distanceConverted;
        List<Marker> markers =  markerRepository.findAllFiltered(minLat, maxLat, minLng, maxLng);

        System.out.println(markers.toString());
        return markers;
    }

    public List<Marker> getAllNonEditMarkers(){ return markerRepository.findAllByParentNull();}

    @Override
    public void update(Marker marker) {
        markerRepository.save(marker);
    }

    public void updateWithEdit(Long id) {
        Marker approvedEdit = getOne(id);
        Marker parent = approvedEdit.getParent();

        parent.setLat(approvedEdit.getLat());
        parent.setLng(approvedEdit.getLng());
        parent.setName(approvedEdit.getName());
        parent.setDescription(approvedEdit.getDescription());
        parent.setCategories(approvedEdit.getCategories());

        update(parent);
    }



    public void saveEdit(Marker marker) {
        Marker editMarker = new Marker(marker); //using cloning constructor
        markerRepository.save(editMarker);
    }

    @Override
    public void delete(long id) {
        markerRepository.deleteById(id);
    }



}
