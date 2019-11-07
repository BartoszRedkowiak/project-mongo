package org.mongo.projectmongo.category;

import org.mongo.projectmongo.utils.ServiceInterface;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

@Service
@Transactional
public class CategoryService implements ServiceInterface<Category> {

    private final CategoryRepository categoryRepository;
    @Autowired
    public CategoryService(CategoryRepository categoryRepository) {
        this.categoryRepository = categoryRepository;
    }
    @Override
    public void save(Category category) {
        categoryRepository.save(category);
    }
    @Override
    public void update(Category category) {
        categoryRepository.save(category);
    }
    @Override
    public Category getOne(long id) {
        return categoryRepository.findById(id).orElse(null);
    }
    @Override
    public List<Category> getAll() {
        return categoryRepository.findAll();
    }
    @Override
    public void delete(long id) {
        categoryRepository.deleteById(id);
    }

}
