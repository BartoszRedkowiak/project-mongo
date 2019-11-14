package org.mongo.projectmongo.user;

import org.mongo.projectmongo.category.CategoryRepository;
import org.mongo.projectmongo.eventContribution.EventContributionRepository;
import org.mongo.projectmongo.review.ReviewRepository;
import org.mongo.projectmongo.utils.ServiceInterface;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

@Service
@Transactional
public class UserService implements ServiceInterface<User> {

    private final UserRepository userRepository;
    private final ReviewRepository reviewRepository;
    private final EventContributionRepository eventContributionRepository;
    private final CategoryRepository categoryRepository;

    @Autowired
    public UserService(UserRepository userRepository, ReviewRepository reviewRepository, EventContributionRepository eventContributionRepository, CategoryRepository categoryRepository) {
        this.userRepository = userRepository;
        this.reviewRepository = reviewRepository;
        this.eventContributionRepository = eventContributionRepository;
        this.categoryRepository = categoryRepository;
    }

    @Override
    public void save(User user) {
        userRepository.save(user);
    }

    @Override
    public User getOne(long id) {
        return userRepository.findById(id).orElse(null);
    }

    public User getOneByEmail(String email){ return userRepository.findFirstByEmail(email); }

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
