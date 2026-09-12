package hcmute.admin_crud.service;

import hcmute.admin_crud.entity.User;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.security.core.userdetails.UserDetailsService;

import java.util.Optional;

public interface UserService extends UserDetailsService {

    Page<User> findAll(Pageable pageable);

    Page<User> search(String keyword, Pageable pageable);

    Optional<User> findById(Long id);

    User save(User user, boolean encodePassword);

    void deleteById(Long id);

    boolean existsByUsername(String username);

    boolean existsByEmail(String email);

    boolean existsByUsernameAndIdNot(String username, Long id);

    boolean existsByEmailAndIdNot(String email, Long id);
}
