package org.mongo.projectmongo.user;

import org.hibernate.Hibernate;
import org.mongo.projectmongo.category.CategoryRepository;
import org.mongo.projectmongo.eventContribution.EventContributionRepository;
import org.mongo.projectmongo.review.ReviewRepository;
import org.mongo.projectmongo.security.Role;
import org.mongo.projectmongo.security.RoleRepository;
import org.mongo.projectmongo.utils.ServiceInterface;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.Arrays;
import java.util.HashSet;
import java.util.List;

@Service
@Transactional
public class UserService implements ServiceInterface<User> {

    private final UserRepository userRepository;
    private final ReviewRepository reviewRepository;
    private final EventContributionRepository eventContributionRepository;
    private final CategoryRepository categoryRepository;
    private final RoleRepository roleRepository;
    private final BCryptPasswordEncoder passwordEncoder;

    @Autowired
    public UserService(UserRepository userRepository, ReviewRepository reviewRepository, EventContributionRepository eventContributionRepository, CategoryRepository categoryRepository, RoleRepository roleRepository, BCryptPasswordEncoder passwordEncoder) {
        this.userRepository = userRepository;
        this.reviewRepository = reviewRepository;
        this.eventContributionRepository = eventContributionRepository;
        this.categoryRepository = categoryRepository;
        this.roleRepository = roleRepository;
        this.passwordEncoder = passwordEncoder;
    }

    @Override
    public void save(User user) {
        user.setPassword(passwordEncoder.encode(user.getPassword()));
        user.setEnabled(1);
        Role userRole = roleRepository.findByName("ROLE_USER");
        user.setRoles(new HashSet<Role>(Arrays.asList(userRole)));
        userRepository.save(user);
    }

    @Override
    public User getOne(long id) {
        return userRepository.findById(id).orElse(null);
    }

    public User getOneByEmail(String email){ return userRepository.findFirstByEmail(email); }

    public User getOneByUserName(String username){ return userRepository.findByUsername(username); }

    @Override
    public List<User> getAll() {
        return userRepository.findAll();
    }

    @Override
    public void update(User user) {
        userRepository.save(user);
    }

    @Override
    public void delete(long id) {

        reviewRepository.unbindUserFromReviews(id);
        eventContributionRepository.unbindUserFromContributions(id);
        eventContributionRepository.unbindUserFromContributionVotes(id);
        userRepository.deleteById(id);
    }


}
