package hcmute.admin_crud.controller.admin;

import hcmute.admin_crud.entity.Category;
import hcmute.admin_crud.service.CategoryService;
import jakarta.validation.Valid;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Sort;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

@Controller
@RequestMapping("/admin/categories")
public class CategoryController {

    private static final int DEFAULT_PAGE_SIZE = 10;

    private final CategoryService categoryService;

    public CategoryController(CategoryService categoryService) {
        this.categoryService = categoryService;
    }

    @GetMapping
    public String list(
            @RequestParam(defaultValue = "") String keyword,
            @RequestParam(defaultValue = "0") int page,
            @RequestParam(defaultValue = "10") int size,
            Model model) {

        PageRequest pageable = PageRequest.of(page, size, Sort.by("createdAt").descending());
        Page<Category> categoryPage = categoryService.search(keyword, pageable);

        model.addAttribute("categories", categoryPage.getContent());
        model.addAttribute("currentPage", categoryPage.getNumber());
        model.addAttribute("totalPages", categoryPage.getTotalPages());
        model.addAttribute("totalElements", categoryPage.getTotalElements());
        model.addAttribute("pageSize", size);
        model.addAttribute("keyword", keyword);

        return "admin/category/list";
    }

    @GetMapping("/create")
    public String createForm(Model model) {
        model.addAttribute("category", new Category());
        model.addAttribute("isEdit", false);
        return "admin/category/form";
    }

    @PostMapping("/create")
    public String create(
            @Valid @ModelAttribute("category") Category category,
            BindingResult bindingResult,
            Model model,
            RedirectAttributes redirectAttributes) {

        if (bindingResult.hasErrors()) {
            model.addAttribute("isEdit", false);
            return "admin/category/form";
        }

        categoryService.save(category);
        redirectAttributes.addFlashAttribute("successMessage", "Category created successfully.");
        return "redirect:/admin/categories";
    }

    @GetMapping("/edit/{id}")
    public String editForm(@PathVariable Long id, Model model, RedirectAttributes redirectAttributes) {
        return categoryService.findById(id).map(category -> {
            model.addAttribute("category", category);
            model.addAttribute("isEdit", true);
            return "admin/category/form";
        }).orElseGet(() -> {
            redirectAttributes.addFlashAttribute("errorMessage", "Category not found.");
            return "redirect:/admin/categories";
        });
    }

    @PostMapping("/edit/{id}")
    public String update(
            @PathVariable Long id,
            @Valid @ModelAttribute("category") Category category,
            BindingResult bindingResult,
            Model model,
            RedirectAttributes redirectAttributes) {

        if (bindingResult.hasErrors()) {
            model.addAttribute("isEdit", true);
            return "admin/category/form";
        }

        if (!categoryService.findById(id).isPresent()) {
            redirectAttributes.addFlashAttribute("errorMessage", "Category not found.");
            return "redirect:/admin/categories";
        }

        category.setId(id);
        categoryService.save(category);
        redirectAttributes.addFlashAttribute("successMessage", "Category updated successfully.");
        return "redirect:/admin/categories";
    }

    @PostMapping("/delete/{id}")
    public String delete(@PathVariable Long id, RedirectAttributes redirectAttributes) {
        if (!categoryService.findById(id).isPresent()) {
            redirectAttributes.addFlashAttribute("errorMessage", "Category not found.");
        } else {
            categoryService.deleteById(id);
            redirectAttributes.addFlashAttribute("successMessage", "Category deleted successfully.");
        }
        return "redirect:/admin/categories";
    }
}
