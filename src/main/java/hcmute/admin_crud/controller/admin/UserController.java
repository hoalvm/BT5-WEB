package hcmute.admin_crud.controller.admin;

import hcmute.admin_crud.entity.Role;
import hcmute.admin_crud.entity.User;
import hcmute.admin_crud.repository.RoleRepository;
import hcmute.admin_crud.service.UserService;
import jakarta.validation.Valid;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Sort;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import java.util.HashSet;
import java.util.List;
import java.util.Optional;
import java.util.Set;

@Controller
@RequestMapping("/admin/users")
public class UserController {

    private final UserService userService;
    private final RoleRepository roleRepository;

    public UserController(UserService userService, RoleRepository roleRepository) {
        this.userService = userService;
        this.roleRepository = roleRepository;
    }

    @GetMapping
    public String list(
            @RequestParam(defaultValue = "") String keyword,
            @RequestParam(defaultValue = "0") int page,
            @RequestParam(defaultValue = "10") int size,
            Model model) {

        PageRequest pageable = PageRequest.of(page, size, Sort.by("createdAt").descending());
        Page<User> userPage = userService.search(keyword, pageable);

        model.addAttribute("users", userPage.getContent());
        model.addAttribute("currentPage", userPage.getNumber());
        model.addAttribute("totalPages", userPage.getTotalPages());
        model.addAttribute("totalElements", userPage.getTotalElements());
        model.addAttribute("pageSize", size);
        model.addAttribute("keyword", keyword);

        return "admin/user/list";
    }

    @GetMapping("/create")
    public String createForm(Model model) {
        model.addAttribute("user", new User());
        model.addAttribute("allRoles", roleRepository.findAll());
        model.addAttribute("isEdit", false);
        return "admin/user/form";
    }

    @PostMapping("/create")
    public String create(
            @Valid @ModelAttribute("user") User user,
            BindingResult bindingResult,
            @RequestParam(value = "roleIds", required = false) List<Long> roleIds,
            Model model,
            RedirectAttributes redirectAttributes) {

        // Manual validation for create
        if (user.getPassword() == null || user.getPassword().isBlank()) {
            bindingResult.rejectValue("password", "password.required", "Password is required");
        }

        if (userService.existsByUsername(user.getUsername())) {
            bindingResult.rejectValue("username", "username.exists", "Username already exists");
        }

        if (userService.existsByEmail(user.getEmail())) {
            bindingResult.rejectValue("email", "email.exists", "Email already exists");
        }

        if (bindingResult.hasErrors()) {
            model.addAttribute("allRoles", roleRepository.findAll());
            model.addAttribute("isEdit", false);
            return "admin/user/form";
        }

        // Assign roles
        assignRoles(user, roleIds);
        userService.save(user, true);

        redirectAttributes.addFlashAttribute("successMessage", "User created successfully.");
        return "redirect:/admin/users";
    }

    @GetMapping("/edit/{id}")
    public String editForm(@PathVariable Long id, Model model, RedirectAttributes redirectAttributes) {
        Optional<User> optUser = userService.findById(id);
        if (optUser.isEmpty()) {
            redirectAttributes.addFlashAttribute("errorMessage", "User not found.");
            return "redirect:/admin/users";
        }
        User user = optUser.get();
        user.setPassword(""); // Clear password so field shows empty
        model.addAttribute("user", user);
        model.addAttribute("allRoles", roleRepository.findAll());
        model.addAttribute("isEdit", true);
        return "admin/user/form";
    }

    @PostMapping("/edit/{id}")
    public String update(
            @PathVariable Long id,
            @Valid @ModelAttribute("user") User user,
            BindingResult bindingResult,
            @RequestParam(value = "roleIds", required = false) List<Long> roleIds,
            Model model,
            RedirectAttributes redirectAttributes) {

        Optional<User> optExisting = userService.findById(id);
        if (optExisting.isEmpty()) {
            redirectAttributes.addFlashAttribute("errorMessage", "User not found.");
            return "redirect:/admin/users";
        }

        // Check username unique (excluding self)
        if (userService.existsByUsernameAndIdNot(user.getUsername(), id)) {
            bindingResult.rejectValue("username", "username.exists", "Username already exists");
        }

        if (userService.existsByEmailAndIdNot(user.getEmail(), id)) {
            bindingResult.rejectValue("email", "email.exists", "Email already exists");
        }

        if (bindingResult.hasErrors()) {
            model.addAttribute("allRoles", roleRepository.findAll());
            model.addAttribute("isEdit", true);
            return "admin/user/form";
        }

        User existing = optExisting.get();
        user.setId(id);
        user.setCreatedAt(existing.getCreatedAt());

        // If password left blank, keep existing
        boolean encodePassword = user.getPassword() != null && !user.getPassword().isBlank();
        if (!encodePassword) {
            user.setPassword(existing.getPassword());
        }

        assignRoles(user, roleIds);
        userService.save(user, encodePassword);

        redirectAttributes.addFlashAttribute("successMessage", "User updated successfully.");
        return "redirect:/admin/users";
    }

    @PostMapping("/delete/{id}")
    public String delete(@PathVariable Long id, RedirectAttributes redirectAttributes) {
        if (!userService.findById(id).isPresent()) {
            redirectAttributes.addFlashAttribute("errorMessage", "User not found.");
        } else {
            userService.deleteById(id);
            redirectAttributes.addFlashAttribute("successMessage", "User deleted successfully.");
        }
        return "redirect:/admin/users";
    }

    private void assignRoles(User user, List<Long> roleIds) {
        Set<Role> roles = new HashSet<>();
        if (roleIds != null && !roleIds.isEmpty()) {
            for (Long roleId : roleIds) {
                roleRepository.findById(roleId).ifPresent(roles::add);
            }
        } else {
            // Default to ROLE_USER if no role selected
            roleRepository.findByName("ROLE_USER").ifPresent(roles::add);
        }
        user.setRoles(roles);
    }
}
