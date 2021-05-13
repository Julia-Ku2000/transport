package com.htp.dao;

import com.htp.domain.TransportRegistrationForm;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.repository.CrudRepository;
import org.springframework.data.repository.PagingAndSortingRepository;

public interface TransportRegistrationFormRepository extends CrudRepository<TransportRegistrationForm, Long>, JpaRepository<TransportRegistrationForm, Long>, PagingAndSortingRepository<TransportRegistrationForm, Long> {
    
    Page<TransportRegistrationForm> findAllByConfirmedFalse(Pageable pageable);

    Page<TransportRegistrationForm> findAllByUserId(Long userId, Pageable pageable);
}

