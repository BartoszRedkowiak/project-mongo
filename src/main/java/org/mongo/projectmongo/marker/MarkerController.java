package org.mongo.projectmongo.marker;

import org.mongo.projectmongo.category.Category;
import org.mongo.projectmongo.category.CategoryService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@Controller
@RequestMapping("/markers")
public class MarkerController {

    private final MarkerService markerService;
    private final CategoryService categoryService;

    @Autowired
    public MarkerController(MarkerService markerService, CategoryService categoryService) {
        this.markerService = markerService;
        this.categoryService = categoryService;
    }

    @GetMapping("/list")
    public String list(Model model) {
        model.addAttribute("markers", markerService.findAll());
        return "user/markerList";
    }

    @GetMapping("/add")
    public String add(Model model) {
        model.addAttribute("marker", new Marker());
        return "user/marker";
    }

    @PostMapping("/add")
    public String add(@ModelAttribute Marker marker) {

        //TODO jeżeli nie-admin odesłać do innego widoku
        markerService.save(marker);
        return "redirect:list";
    }

    @GetMapping("/delete/{id}")
    public String delete(@PathVariable long id) {
        markerService.delete(id);
        return "redirect:../list";
    }

    @GetMapping("/edit/{id}")
    public String edit(Model model,
                       @PathVariable long id) {
        Marker marker = markerService.findOne(id);
        model.addAttribute("marker", marker);
        return "user/marker";
    }

    @PostMapping("/edit/{id}")
    public String edit(@ModelAttribute Marker marker) {
        markerService.update(marker);
        return "redirect:../list";
    }

    @ModelAttribute("categories")
    public List<Category> categories(){ return categoryService.findAll();  }

}
