package org.mongo.projectmongo.eventContribution;

import org.mongo.projectmongo.category.Category;
import org.mongo.projectmongo.category.CategoryService;
import org.mongo.projectmongo.user.User;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;

import java.util.List;

@Controller
@RequestMapping("/contributions")
public class EventContributionController {

    private final EventContributionService contributionService;
    private final CategoryService categoryService;

    @Autowired
    public EventContributionController(EventContributionService contributionService, CategoryService categoryService) {
        this.contributionService = contributionService;
        this.categoryService = categoryService;
    }

    @GetMapping("/list")
    private String list(Model model){
        model.addAttribute("contributions", contributionService.getAllFromLatest());
        return "viewContributionsList";
    }
    @GetMapping("/validate/{id}")
    private String validate(@PathVariable Long id){
        EventContribution contribution = contributionService.getOne(id);
        contribution.setValidated(!contribution.getValidated());
        contributionService.update(contribution);
        return "redirect:../list";
    }

    @GetMapping("/delete/{id}")
    private String delete(@PathVariable Long id){
        contributionService.delete(id);
        return "redirect:../list";
    }

    @ModelAttribute("categories")
    public List<Category> navbarCategories() {
        return categoryService.getSubCategories();
    }

    @ModelAttribute("userLogin")
    public User user(){ return new User(); }

}
