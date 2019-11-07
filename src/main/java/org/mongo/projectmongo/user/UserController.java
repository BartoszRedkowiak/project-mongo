package org.mongo.projectmongo.user;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/users")
public class UserController {

    private final UserService userService;
    @Autowired
    public UserController(UserService userService) {
        this.userService = userService;
    }

    @GetMapping("/profile")
    public String userProfile(Model model){
        //TODO zamienić raw input
        model.addAttribute("user", userService.getOne(1l));
        return "viewUser";
    }

    @GetMapping("/list")
    public String usersList(Model model){
        model.addAttribute("users", userService.getAll());
        return "viewUserList";
    }

    @GetMapping("/add")
    public String add(Model model){
        model.addAttribute("user", new User());
        return "viewUser";
    }

    @PostMapping("/add")
    public String add(User user){
        userService.save(user);
        return "redirect:../profile";
    }

    @GetMapping("/edit/{id}")
    public String edit(@PathVariable long id,
                       Model model){
        model.addAttribute("user", userService.getOne(id));
        return "viewUser";
    }

    @PostMapping("/edit/{id}")
    public String edit(User user){
        userService.update(user);
        return "redirect:../profile";
    }

    @GetMapping("/delete/{id}")
    public String delete(@PathVariable long id){
        userService.delete(id);
        return "redirect:../list";
    }

//    public String logout(){}






}
