package com.library.service;

import com.library.entity.Book;
import com.library.entity.Author;
import com.library.repository.BookRepository;
import com.library.repository.AuthorRepository;
import com.library.exception.ResourceNotFoundException;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import java.time.LocalDate;
import java.util.List;

@Service
public class BookService {
    
    @Autowired
    private BookRepository bookRepository;
    
    @Autowired
    private AuthorRepository authorRepository;
    
    public Book createBook(Book book) {
        if (book.getTitle() == null || book.getTitle().isEmpty()) {
            throw new IllegalArgumentException("Book title cannot be empty");
        }
        if (book.getIsbn() == null || book.getIsbn().isEmpty()) {
            throw new IllegalArgumentException("ISBN cannot be empty");
        }
        
        if (book.getAuthor() == null || book.getAuthor().getId() == null) {
            throw new ResourceNotFoundException("Author must be specified");
        }
        
        Author author = authorRepository.findById(book.getAuthor().getId())
            .orElseThrow(() -> new ResourceNotFoundException(
                "Author not found with ID: " + book.getAuthor().getId()));
        
        book.setAuthor(author);
        
        return bookRepository.save(book);
    }
    
    public Book getBookById(Long id) {
        return bookRepository.findById(id)
            .orElseThrow(() -> new ResourceNotFoundException(
                "Book not found with ID: " + id));
    }
    
    public List<Book> getAllBooks() {
        return bookRepository.findAll();
    }
    
    public Book updateBook(Long id, Book bookDetails) {
        Book book = getBookById(id);
        book.setTitle(bookDetails.getTitle());
        book.setIsbn(bookDetails.getIsbn());
        book.setPublicationDate(bookDetails.getPublicationDate());
        book.setAvailability(bookDetails.getAvailability());
        
        return bookRepository.save(book);
    }
    
    public void deleteBook(Long id) {
        Book book = getBookById(id);
        bookRepository.delete(book);
    }
    
    public List<Book> searchBooksByTitle(String title) {
        return bookRepository.findByTitleContainingIgnoreCase(title);
    }
    
    public List<Book> getAvailableBooksByAuthor(Long authorId) {
        authorRepository.findById(authorId)
            .orElseThrow(() -> new ResourceNotFoundException(
                "Author not found with ID: " + authorId));
        
        return bookRepository.findAvailableBooksByAuthor(authorId);
    }
}
