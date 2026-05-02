package com.library.service;

import com.library.entity.Author;
import com.library.repository.AuthorRepository;
import com.library.exception.ResourceNotFoundException;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import java.util.List;

@Service
public class AuthorService {
    
    @Autowired
    private AuthorRepository authorRepository;
    
    public Author createAuthor(Author author) {
        if (author.getName() == null || author.getName().isEmpty()) {
            throw new IllegalArgumentException("Author name cannot be empty");
        }
        return authorRepository.save(author);
    }
    
    public Author getAuthorById(Long id) {
        return authorRepository.findById(id)
            .orElseThrow(() -> new ResourceNotFoundException(
                "Author not found with ID: " + id));
    }
    
    public List<Author> getAllAuthors() {
        return authorRepository.findAll();
    }
    
    public Author updateAuthor(Long id, Author authorDetails) {
        Author author = getAuthorById(id);
        author.setName(authorDetails.getName());
        author.setEmail(authorDetails.getEmail());
        author.setCountry(authorDetails.getCountry());
        author.setBirthYear(authorDetails.getBirthYear());
        return authorRepository.save(author);
    }
    
    public void deleteAuthor(Long id) {
        Author author = getAuthorById(id);
        authorRepository.delete(author);
    }
}
