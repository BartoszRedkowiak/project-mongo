package org.mongo.projectmongo;

import org.mongo.projectmongo.category.Category;
import org.mongo.projectmongo.category.CategoryService;
import org.mongo.projectmongo.marker.Marker;
import org.mongo.projectmongo.marker.MarkerService;
import org.mongo.projectmongo.user.User;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;
import java.util.stream.Collectors;

@Controller
public class HomeController {

    private final MarkerService markerService;
    private final CategoryService categoryService;

    @Autowired
    public HomeController(MarkerService markerService, CategoryService categoryService) {
        this.markerService = markerService;
        this.categoryService = categoryService;
    }

    @GetMapping("/")
    public String homePage(HttpServletRequest request,
                           @RequestParam(required = false, name = "maxDistance") Integer maxDistance,
                           @RequestParam(required = false, name = "categoryId") List<Long> catIdList,
                           Model model,
                           HttpSession session) {
        if (maxDistance == null) {
            model.addAttribute("markers", markerService.getAllVisible());
        } else {
                //Coordinates for initial center of the map (Warsaw)
                Double lat = 52.237;
                Double lng = 21.017;
                model.addAttribute("markers", markerService.getAllFiltered(lat, lng, maxDistance, catIdList));
        }
        return "viewHome";
    }


    @GetMapping("/login")
    public String login(){
        return "viewLogin";
    }

    @GetMapping("/logoutSuccess")
    public String logoutHandler(){
        return "viewLogout";
    }


    @ModelAttribute("userLogin")
    public User user(){ return new User(); }

    @ModelAttribute("markers")
    public List<Marker> markers() {
        return markerService.getAllVisible();
    }

    @ModelAttribute("categories")
    public List<Category> navbarCategories() {
        return categoryService.getSubCategories();
    }


}
