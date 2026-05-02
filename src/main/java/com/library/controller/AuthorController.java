package com.library.controller;

import com.library.entity.Author;
import com.library.service.AuthorService;
import com.library.exception.ResourceNotFoundException;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import java.util.List;

@Controller
@RequestMapping("/authors")
public class AuthorController {
    
    @Autowired
    private AuthorService authorService;
    
    @GetMapping
    public String listAuthors(Model model) {
        try {
            List<Author> authors = authorService.getAllAuthors();
            model.addAttribute("authors", authors);
            return "authors/list";
        } catch (Exception e) {
            model.addAttribute("error", "Error fetching authors: " + e.getMessage());
            return "error";
        }
    }
    
    @GetMapping("/new")
    public String showAddAuthorForm(Model model) {
        model.addAttribute("author", new Author());
        return "authors/form";
    }
    
    @PostMapping
    public String createAuthor(@ModelAttribute Author author, Model model) {
        try {
            authorService.createAuthor(author);
            return "redirect:/authors";
        } catch (IllegalArgumentException e) {
            model.addAttribute("error", e.getMessage());
            model.addAttribute("author", author);
            return "authors/form";
        } catch (Exception e) {
            model.addAttribute("error", "Error creating author: " + e.getMessage());
            return "error";
        }
    }
    
    @GetMapping("/edit/{id}")
    public String showEditAuthorForm(@PathVariable Long id, Model model) {
        try {
            Author author = authorService.getAuthorById(id);
            model.addAttribute("author", author);
            return "authors/form";
        } catch (ResourceNotFoundException e) {
            model.addAttribute("error", e.getMessage());
            return "error";
        }
    }
    
    @PostMapping("/{id}")
    public String updateAuthor(@PathVariable Long id, 
                               @ModelAttribute Author authorDetails, 
                               Model model) {
        try {
            authorService.updateAuthor(id, authorDetails);
            return "redirect:/authors";
        } catch (ResourceNotFoundException e) {
            model.addAttribute("error", e.getMessage());
            return "error";
        }
    }
    
    @PostMapping("/{id}/delete")
    public String deleteAuthor(@PathVariable Long id, Model model) {
        try {
            authorService.deleteAuthor(id);
            return "redirect:/authors";
        } catch (ResourceNotFoundException e) {
            model.addAttribute("error", e.getMessage());
            return "error";
        }
    }
}
