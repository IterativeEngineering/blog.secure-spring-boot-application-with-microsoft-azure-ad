//AuthController.java

package pl.iterative.api;

import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

@RestController
@RequestMapping("/api")
public class AuthController {
    @GetMapping("/login")
    public String login() {
        return "User logged in";
    }
}
