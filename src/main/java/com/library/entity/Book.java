package com.library.entity;

import jakarta.persistence.*;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;
import java.time.LocalDate;

@Entity
@Table(name = "books")
@Data
@NoArgsConstructor
@AllArgsConstructor
public class Book {
    
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;
    
    @Column(name = "title", nullable = false, length = 255)
    private String title;
    
    @Column(name = "isbn", nullable = false, unique = true, length = 20)
    private String isbn;
    
    @Column(name = "publication_date")
    private LocalDate publicationDate;
    
    @Column(name = "availability")
    private Boolean availability = true;
    
    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "author_id", nullable = false)
    private Author author;
    
    public Book(String title, String isbn, LocalDate publicationDate, Boolean availability, Author author) {
        this.title = title;
        this.isbn = isbn;
        this.publicationDate = publicationDate;
        this.availability = availability;
        this.author = author;
    }
}
