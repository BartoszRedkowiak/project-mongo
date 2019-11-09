package org.mongo.projectmongo.marker;

import org.mongo.projectmongo.category.Category;
import org.mongo.projectmongo.category.CategoryService;
import org.mongo.projectmongo.review.Review;
import org.mongo.projectmongo.review.ReviewService;
import org.mongo.projectmongo.user.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import javax.servlet.http.HttpSession;
import java.util.List;

@Controller
@RequestMapping("/markers")
public class MarkerController {

    private final MarkerService markerService;
    private final CategoryService categoryService;
    private final ReviewService reviewService;
    private final UserService userService;

    @Autowired
    public MarkerController(MarkerService markerService, CategoryService categoryService, ReviewService reviewService, UserService userService) {
        this.markerService = markerService;
        this.categoryService = categoryService;
        this.reviewService = reviewService;
        this.userService = userService;
    }

    @GetMapping("/list")
    public String list(Model model) {
        model.addAttribute("markers", markerService.getAll());
        return "viewMarkerList";
    }

    @GetMapping("/add")
    public String add(Model model) {
        model.addAttribute("marker", new Marker());
        return "viewMarker";
    }

    @PostMapping("/add")
    public String add(@ModelAttribute Marker marker) {

        markerService.save(marker);
        return "redirect:list";
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
    public String edit(@ModelAttribute Marker marker) {
        markerService.update(marker);
        return "redirect:../list";
    }

    @GetMapping("/details/{id}")
    public String details (@PathVariable Long id,
                           Model model){
        Marker marker = markerService.getOne(id);
        Float rating = (float) marker.getReviews().stream()
                .mapToDouble(Review::getRating).average().orElse(0d);
        model.addAttribute("rating", rating );
        model.addAttribute("newReview", new Review());
        model.addAttribute("marker", marker);
        return "viewMarkerDetails";
    }

    @PostMapping("/newReview")
    public String addReview(@RequestParam String markerId,
                            Review review,
                            HttpSession session){
        Long userId = (Long) session.getAttribute("userId");
        review.setUser(userService.getOne(userId));
        review.setMarker(markerService.getOne(Long.parseLong(markerId)));
        reviewService.save(review);
        return "redirect:details/" + markerId;
    }




    @GetMapping("/toggle/{id}")
    public String toggleVisible(@PathVariable Long id){
        Marker marker = markerService.getOne(id);
        marker.setVisible(!marker.getVisible());
        markerService.update(marker);
        return "redirect:../list";
    }

    @ModelAttribute("categories")
    public List<Category> categories(){ return categoryService.getSubCategories();  }

}
