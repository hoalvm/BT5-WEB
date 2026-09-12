package hcmute.admin_crud.controller;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.http.HttpServletRequest;
import org.springframework.http.HttpStatus;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class CustomErrorController {

    @RequestMapping("/error")
    public String handleError(HttpServletRequest request, Model model) {
        Object status = request.getAttribute(RequestDispatcher.ERROR_STATUS_CODE);
        int statusCode = 500;
        String errorMessage = "An unexpected error occurred.";

        if (status != null) {
            try {
                statusCode = Integer.parseInt(status.toString());
                if (statusCode == HttpStatus.NOT_FOUND.value()) {
                    errorMessage = "The requested page could not be found.";
                } else if (statusCode == HttpStatus.FORBIDDEN.value()) {
                    errorMessage = "You do not have permission to access this resource.";
                } else if (statusCode == HttpStatus.UNAUTHORIZED.value()) {
                    errorMessage = "Please log in to access this page.";
                } else if (statusCode == HttpStatus.INTERNAL_SERVER_ERROR.value()) {
                    errorMessage = "Internal server error occurred on the server.";
                }
            } catch (NumberFormatException ignored) {}
        }

        model.addAttribute("statusCode", statusCode);
        model.addAttribute("errorMessage", errorMessage);
        return "error";
    }
}
