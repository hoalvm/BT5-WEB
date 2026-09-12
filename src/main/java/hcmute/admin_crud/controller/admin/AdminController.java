package hcmute.admin_crud.controller.admin;

import hcmute.admin_crud.service.CategoryService;
import hcmute.admin_crud.service.UserService;
import org.springframework.data.domain.PageRequest;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/admin")
public class AdminController {

    private final CategoryService categoryService;
    private final UserService userService;

    public AdminController(CategoryService categoryService, UserService userService) {
        this.categoryService = categoryService;
        this.userService = userService;
    }

    @GetMapping({"/", "/dashboard"})
    public String dashboard(Model model) {
        long categoryCount = categoryService.findAll(PageRequest.of(0, Integer.MAX_VALUE)).getTotalElements();
        long userCount = userService.findAll(PageRequest.of(0, Integer.MAX_VALUE)).getTotalElements();
        model.addAttribute("categoryCount", categoryCount);
        model.addAttribute("userCount", userCount);
        return "admin/dashboard";
    }
}
