package org.mongo.projectmongo.category;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.core.convert.converter.Converter;

public class CategoryConverter implements Converter<String, Category> {

    @Autowired
    CategoryRepository categoryRepository;

    @Override
    public Category convert(String s) {
        if (s == null || s.isEmpty()) {
            return null;
        }
        return categoryRepository.findById(Long.parseLong(s)).orElse(null);
    }
}
