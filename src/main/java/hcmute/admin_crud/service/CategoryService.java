package hcmute.admin_crud.service;

import hcmute.admin_crud.entity.Category;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;

import java.util.Optional;

public interface CategoryService {

    Page<Category> findAll(Pageable pageable);

    Page<Category> search(String keyword, Pageable pageable);

    Optional<Category> findById(Long id);

    Category save(Category category);

    void deleteById(Long id);
}
