package com.library.controller;

import com.library.entity.Book;
import com.library.entity.Author;
import com.library.service.BookService;
import com.library.service.AuthorService;
import com.library.exception.ResourceNotFoundException;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import java.util.List;

@Controller
@RequestMapping("/books")
public class BookController {
    
    @Autowired
    private BookService bookService;
    
    @Autowired
    private AuthorService authorService;
    
    @GetMapping
    public String listBooks(Model model) {
        try {
            List<Book> books = bookService.getAllBooks();
            model.addAttribute("books", books);
            return "books/list";
        } catch (Exception e) {
            model.addAttribute("error", "Error fetching books: " + e.getMessage());
            return "error";
        }
    }
    
    @GetMapping("/new")
    public String showAddBookForm(Model model) {
        try {
            List<Author> authors = authorService.getAllAuthors();
            model.addAttribute("book", new Book());
            model.addAttribute("authors", authors);
            return "books/form";
        } catch (Exception e) {
            model.addAttribute("error", "Error loading form: " + e.getMessage());
            return "error";
        }
    }
    
    @PostMapping
    public String createBook(@ModelAttribute Book book, Model model) {
        try {
            bookService.createBook(book);
            return "redirect:/books";
        } catch (IllegalArgumentException | ResourceNotFoundException e) {
            model.addAttribute("error", e.getMessage());
            List<Author> authors = authorService.getAllAuthors();
            model.addAttribute("authors", authors);
            model.addAttribute("book", book);
            return "books/form";
        } catch (Exception e) {
            model.addAttribute("error", "Error creating book: " + e.getMessage());
            return "error";
        }
    }
    
    @GetMapping("/edit/{id}")
    public String showEditBookForm(@PathVariable Long id, Model model) {
        try {
            Book book = bookService.getBookById(id);
            List<Author> authors = authorService.getAllAuthors();
            model.addAttribute("book", book);
            model.addAttribute("authors", authors);
            return "books/form";
        } catch (ResourceNotFoundException e) {
            model.addAttribute("error", e.getMessage());
            return "error";
        }
    }
    
    @PostMapping("/{id}")
    public String updateBook(@PathVariable Long id, 
                             @ModelAttribute Book bookDetails, 
                             Model model) {
        try {
            bookService.updateBook(id, bookDetails);
            return "redirect:/books";
        } catch (ResourceNotFoundException e) {
            model.addAttribute("error", e.getMessage());
            return "error";
        }
    }
    
    @GetMapping("/search")
    public String searchBooks(@RequestParam(required = false) String query, Model model) {
        try {
            if (query != null && !query.isEmpty()) {
                List<Book> books = bookService.searchBooksByTitle(query);
                model.addAttribute("books", books);
                model.addAttribute("searchQuery", query);
            } else {
                List<Book> books = bookService.getAllBooks();
                model.addAttribute("books", books);
            }
            return "books/list";
        } catch (Exception e) {
            model.addAttribute("error", "Error searching books: " + e.getMessage());
            return "error";
        }
    }
    
    @PostMapping("/{id}/delete")
    public String deleteBook(@PathVariable Long id, Model model) {
        try {
            bookService.deleteBook(id);
            return "redirect:/books";
        } catch (ResourceNotFoundException e) {
            model.addAttribute("error", e.getMessage());
            return "error";
        }
    }
}
