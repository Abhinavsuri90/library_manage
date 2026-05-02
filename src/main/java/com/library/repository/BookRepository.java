package com.library.repository;

import com.library.entity.Book;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;
import java.util.List;

@Repository
public interface BookRepository extends JpaRepository<Book, Long> {
    
    List<Book> findByTitleContainingIgnoreCase(String title);
    
    @Query("SELECT b FROM Book b INNER JOIN b.author a " +
           "WHERE a.id = :authorId AND b.isAvailable = true")
    List<Book> findAvailableBooksByAuthor(@Param("authorId") Long authorId);
    
    List<Book> findByIsAvailableTrue();
    
    java.util.Optional<Book> findByIsbn(String isbn);
}
