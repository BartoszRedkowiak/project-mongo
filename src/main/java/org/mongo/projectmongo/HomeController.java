package org.mongo.projectmongo;

import org.mongo.projectmongo.category.CategoryService;
import org.mongo.projectmongo.marker.Marker;
import org.mongo.projectmongo.marker.MarkerService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

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
        model.addAttribute("markers", markerService.findAll());
        model.addAttribute("categories", categoryService.findAll());
        model.addAttribute("filterMarker", new Marker());
        return "index";
    }


}
