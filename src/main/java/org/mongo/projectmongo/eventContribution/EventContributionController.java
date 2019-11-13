package org.mongo.projectmongo.eventContribution;

import org.mongo.projectmongo.user.User;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/contributions")
public class EventContributionController {

    private final EventContributionService contributionService;

    @Autowired
    public EventContributionController(EventContributionService contributionService) {
        this.contributionService = contributionService;
    }

    @GetMapping("/list")
    private String list(Model model){
        model.addAttribute("contributions", contributionService.getAllFromLatest());
        return "viewContributionsList";
    }

    @ModelAttribute("userLogin")
    public User user(){ return new User(); }


}
