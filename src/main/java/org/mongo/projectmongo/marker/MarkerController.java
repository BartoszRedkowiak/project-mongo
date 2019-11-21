package org.mongo.projectmongo.marker;

import org.mongo.projectmongo.category.Category;
import org.mongo.projectmongo.category.CategoryService;
import org.mongo.projectmongo.eventContribution.EventContribution;
import org.mongo.projectmongo.eventContribution.EventContributionService;
import org.mongo.projectmongo.review.Review;
import org.mongo.projectmongo.review.ReviewService;
import org.mongo.projectmongo.user.CurrentUser;
import org.mongo.projectmongo.user.User;
import org.mongo.projectmongo.user.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.annotation.AuthenticationPrincipal;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.*;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import javax.validation.Valid;
import java.util.Collections;
import java.util.List;

@Controller
@RequestMapping("/markers")
public class MarkerController {

    private final MarkerService markerService;
    private final CategoryService categoryService;
    private final ReviewService reviewService;
    private final UserService userService;
    private final EventContributionService eventContributionService;

    @Autowired
    public MarkerController(MarkerService markerService, CategoryService categoryService, ReviewService reviewService, UserService userService, EventContributionService eventContributionService) {
        this.markerService = markerService;
        this.categoryService = categoryService;
        this.reviewService = reviewService;
        this.userService = userService;
        this.eventContributionService = eventContributionService;
    }

    @GetMapping("/list")
    public String list(Model model) {
        model.addAttribute("markers", markerService.getAllNonEditMarkers());
        return "viewMarkerList";
    }

    @GetMapping("/add")
    public String add(Model model) {
        model.addAttribute("marker", new Marker());
        return "viewMarker";
    }

    @PostMapping("/add")
    public String add(@Valid @ModelAttribute Marker marker,
                      BindingResult result) {
        if (result.hasErrors()){
            return "viewMarker";
        }
        markerService.save(marker);
        return "redirect:../";
    }

    @GetMapping("/delete/{id}")
    public String delete(@PathVariable Long id) {
        markerService.delete(id);
        return "redirect:../list";
    }

    @GetMapping("/edit/{id}")
    public String edit(Model model,
                       @PathVariable Long id) {
        model.addAttribute("marker", markerService.getOne(id));
        return "viewMarker";
    }

    @PostMapping("/edit/{id}")
    public String edit(@Valid @ModelAttribute Marker marker,
                       BindingResult result) {
        if (result.hasErrors()){
            return "viewMarker";
        }

        //TODO dodać if z weryfikacją userOrAdmin
        markerService.saveEdit(marker);

        return "redirect:../../";
    }

    @GetMapping("/acceptEdit/{id}")
    public String approveEdit(@PathVariable Long id){
        markerService.updateWithEdit(id);
        return "redirect:../list";
    }

    @GetMapping("/details/{id}")
    public String details (@PathVariable Long id,
                           Model model){
        Marker marker = markerService.getOne(id);

        List<Review> reviews = marker.getReviews();
        Collections.reverse(reviews);
        marker.setReviews(reviews);

        Float rating = (float) marker.getReviews().stream()
                .mapToDouble(Review::getRating).average().orElse(0d);
        model.addAttribute("rating", rating );
        model.addAttribute("newReview", new Review());
        model.addAttribute("marker", marker);
        return "viewMarkerDetails";
    }

    @PostMapping("/details/{id}")
    public String addReview(@PathVariable("id") Long markerId,
                            @Valid @ModelAttribute("newReview") Review review,
                            BindingResult result,
                            @AuthenticationPrincipal CurrentUser customUser){
        if (result.hasErrors()){
            return "viewMarkerDetails";
        }

        User user = customUser.getUser();

        review.setId(null); //to prevent binding markerId from URI
        review.setUser(user);
        review.setMarker(markerService.getOne(markerId));
        reviewService.save(review);
        return "redirect:../details/" + markerId;
    }

    public void addAttributesToView(Model model, Long id){
        model.addAttribute("newContribution", new EventContribution());
        model.addAttribute("contributions", eventContributionService.getAllValidatedForMarker(id));
        model.addAttribute("marker", markerService.getOne(id));
    }

    @GetMapping("/tricks/{id}")
    public String tricks(Model model,
                         @PathVariable Long id){
        addAttributesToView(model, id);
        return "viewContributions";
    }

    @PostMapping("/tricks/{id}")
    public String addContributionToSpot(@Valid @ModelAttribute("newContribution") EventContribution contribution,
                         BindingResult result,
                         @PathVariable(name = "id") Long markerId,
                         HttpSession session,
                         Model model){

        if (result.hasErrors()){
            addAttributesToView(model, markerId);
            return "viewContributions";
        }

        Long userId = (Long) session.getAttribute("userId");
        if (userId == null){
            return "redirect:../../login";
        }

        contribution.setIgLink(contribution.getIgLink().trim());

        contribution.setUser(userService.getOne(userId));
        contribution.setMarker(markerService.getOne(markerId));

        eventContributionService.save(contribution);

        return "redirect:../tricks/" + markerId + "?contSuccess=true";
    }

    @PostMapping("tricks/{id}/vote")
    public String voteForContribution(@PathVariable(name = "id") Long markerId,
                                      HttpServletRequest request,
                                      HttpSession session){
        Long contributionId = Long.parseLong(request.getParameter("contributionId"));
        EventContribution votedContribution = eventContributionService.getOne(contributionId);

        Long userId = (Long) session.getAttribute("userId");
        User user = userService.getOne(userId);
        List<User> usersThatVoted = votedContribution.getUsersThatVoted();

        if (usersThatVoted.contains(user)){
            return "redirect:../" + markerId + "?votingFailed=true";
        }
        usersThatVoted.add(user);
        votedContribution.setUsersThatVoted(usersThatVoted);
        votedContribution.setVotes(votedContribution.getVotes() + 1);
        eventContributionService.update(votedContribution);
        return "redirect:../" + markerId;
    }

    @GetMapping("/visibilityTog/{id}")
    public String toggleVisible(@PathVariable Long id){
        Marker marker = markerService.getOne(id);
        marker.setVisible(!marker.getVisible());
        markerService.update(marker);
        return "redirect:../list";
    }

    @GetMapping("/eventTog/{id}")
    public String toggleEvent(@PathVariable Long id){
        Marker marker = markerService.getOne(id);
        marker.setActiveEvent(!marker.getActiveEvent());
        markerService.update(marker);
        return "redirect:../list";
    }

    @ModelAttribute("categories")
    public List<Category> categories(){ return categoryService.getSubCategories();  }

    @ModelAttribute("userLogin")
    public User user(){ return new User(); }

}
