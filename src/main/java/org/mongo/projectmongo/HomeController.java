package org.mongo.projectmongo;

import org.mongo.projectmongo.category.Category;
import org.mongo.projectmongo.category.CategoryService;
import org.mongo.projectmongo.marker.Marker;
import org.mongo.projectmongo.marker.MarkerService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;

import java.util.List;

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
    public String homePage(Model model) {
        return "viewHome";
    }

    @ModelAttribute("markers")
    public List<Marker> markers(){ return markerService.getAllVisible();}

    @ModelAttribute("categories")
    public List<Category> categories(){ return categoryService.getAll();}







}
