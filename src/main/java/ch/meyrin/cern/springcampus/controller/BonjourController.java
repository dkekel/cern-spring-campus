package ch.meyrin.cern.springcampus.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/")
public class BonjourController {

    @GetMapping("/index")
    public String index() {
        return "index.html";
    }
}
