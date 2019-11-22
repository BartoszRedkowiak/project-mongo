package org.mongo.projectmongo.user;

import org.hibernate.Hibernate;
import org.mongo.projectmongo.category.Category;
import org.mongo.projectmongo.category.CategoryService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.annotation.AuthenticationPrincipal;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.validation.FieldError;
import org.springframework.web.bind.annotation.*;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import javax.validation.Valid;
import java.security.Principal;
import java.util.List;

@Controller
@RequestMapping("/users")
public class UserController {

    private final UserService userService;
    private final CategoryService categoryService;
    @Autowired
    public UserController(UserService userService, CategoryService categoryService) {
        this.userService = userService;
        this.categoryService = categoryService;
    }

    @GetMapping("/profile")
    public String userProfile(@AuthenticationPrincipal CurrentUser customUser,
                              Model model){
        //TODO optymalizacja - rozwiązanie problemu lazy initialization przez spring security
        User user = userService.getOne(customUser.getUser().getId());

        model.addAttribute("user", user);
        return "viewUserProfile";
    }

    @GetMapping("/list")
    public String usersList(Model model){
        model.addAttribute("users", userService.getAll());
        return "viewUserList";
    }

    @GetMapping("/register")
    public String add(Model model){
        model.addAttribute("user", new User());
//        model.addAttribute("mainCategories", categoryService.getMainCategories());
        return "viewUser";
    }

    @PostMapping("/register")
    public String add(@Valid User user,
                      BindingResult result,
                      HttpServletRequest request){
        if (result.hasErrors()){
            return "viewUser";
        }

        String secondPassInput = request.getParameter("password2");

        User existingUser = userService.getOneByEmail(user.getEmail());
        if (existingUser != null) {
            result.addError(new FieldError("user", "email",
                    "Istnieje już konto o podanym adresie email"));
            return "viewUser";
        }

        if (!user.getPassword().equals(secondPassInput)) {
            result.addError(new FieldError("user", "password",
                    "Podane hasła nie są zgodne"));
            return "viewUser";
        }

        userService.save(user);
        return "redirect:profile";
    }

    @GetMapping("/edit/{id}")
    public String edit(@PathVariable Long id,
                       Model model){
        model.addAttribute("user", userService.getOne(id));
        return "viewUser";
    }

    @PostMapping("/edit/{id}")
    public String edit(@Valid User user,
                       BindingResult result){
        if (result.hasErrors()){
            return "viewUser";
        }
        userService.update(user);
        return "redirect:../profile";
    }

    @GetMapping("/delete/{id}")
    public String delete(@PathVariable Long id){
        userService.delete(id);
        return "redirect:../list";
    }

    @ModelAttribute("mainCategories")
    public List<Category> categories(){ return categoryService.getMainCategories();  }

    @ModelAttribute("userLogin")
    public User user(){ return new User(); }

    @ModelAttribute("categories")
    public List<Category> navbarCategories() {
        return categoryService.getSubCategories();
    }

    @GetMapping("/admin")
    @ResponseBody
    public String admin(@AuthenticationPrincipal CurrentUser customUser) {
        User entityUser = customUser.getUser();
        return "Hello " + entityUser.getUsername();
    }









}
