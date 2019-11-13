package org.mongo.projectmongo.user;

import org.springframework.data.jpa.repository.JpaRepository;

public interface UserRepository extends JpaRepository<User, Long> {

    public User findFirstByEmail(String email);

}
