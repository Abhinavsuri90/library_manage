package com.library.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import com.library.service.AuthorService;
import com.library.service.BookService;
import org.springframework.beans.factory.annotation.Autowired;

@Controller
public class HomeController {
    
    @Autowired
    private AuthorService authorService;
    
    @Autowired
    private BookService bookService;
    
    @GetMapping("/")
    public String home(Model model) {
        try {
            long totalAuthors = authorService.getAllAuthors().size();
            long totalBooks = bookService.getAllBooks().size();
            long availableBooks = bookService.getAllBooks()
                .stream()
                .filter(b -> b.getAvailability())
                .count();
            
            model.addAttribute("totalAuthors", totalAuthors);
            model.addAttribute("totalBooks", totalBooks);
            model.addAttribute("availableBooks", availableBooks);
            
            return "index";
        } catch (Exception e) {
            model.addAttribute("error", "Error loading dashboard: " + e.getMessage());
            return "error";
        }
    }
}
