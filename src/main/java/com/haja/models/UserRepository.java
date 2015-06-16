package com.haja.models;

import com.haja.models.User;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

@Repository
public interface UserRepository extends JpaRepository<User, Long> {
        // Posso usare tutte le operazioni fornite da JpaRepository nel controller dell'utente

    User findByNickname(String name);
}