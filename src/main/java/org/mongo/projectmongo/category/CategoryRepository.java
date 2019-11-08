package org.mongo.projectmongo.category;

import org.springframework.data.jpa.repository.JpaRepository;

import java.util.List;

public interface CategoryRepository extends JpaRepository<Category, Long> {

    public List<Category> findAllByParentNull();

    public List<Category> findAllByParentNotNull();

}
