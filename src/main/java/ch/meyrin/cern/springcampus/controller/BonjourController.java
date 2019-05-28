package ch.meyrin.cern.springcampus.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class BonjourController {

    @GetMapping("/")
    public String index() {
        return "index";
    }
}
