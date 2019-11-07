package org.mongo.projectmongo.utils;

import java.util.List;

public interface ServiceInterface<T> {

    void save(T t);

    T getOne(long id);

    List<T> getAll();

    void update(T t);

    void delete(long id);

}
