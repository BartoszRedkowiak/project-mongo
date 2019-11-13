package org.mongo.projectmongo;

import org.mongo.projectmongo.category.Category;
import org.mongo.projectmongo.category.CategoryService;
import org.mongo.projectmongo.marker.Marker;
import org.mongo.projectmongo.marker.MarkerService;
import org.mongo.projectmongo.user.User;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.util.Arrays;
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
    public String homePage(HttpServletRequest request,
                           Model model,
                           HttpSession session) {
        //TODO tymczasowe ustawienie
        session.setAttribute("userId", 1l);

        String maxDistanceString = request.getParameter("maxDistance");
        String[] arrCatId = request.getParameterValues("categoryId");

        if (maxDistanceString == null) {
            model.addAttribute("markers", markerService.getAllVisible());
        } else {
            try {
                Integer maxDistanceInt = Integer.parseInt(maxDistanceString);
                //Coordinates for Warsaw
                Double lat = 52.237;
                Double lng = 21.017;
                model.addAttribute("markers", markerService.getAllFiltered(lat, lng, maxDistanceInt));
            } catch (NumberFormatException e) {
                model.addAttribute("markers", markerService.getAllVisible());
                model.addAttribute("errMsg", "Podano niepoprawny parametr");
            }
        }
        return "viewHome";
    }

    @ModelAttribute("userLogin")
    public User user(){ return new User(); }

    @ModelAttribute("markers")
    public List<Marker> markers() {
        return markerService.getAllVisible();
    }

    @ModelAttribute("categories")
    public List<Category> categories() {
        return categoryService.getSubCategories();
    }


}
