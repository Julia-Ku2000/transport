package com.htp.dao;

import com.htp.domain.Driver;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.repository.CrudRepository;
import org.springframework.data.repository.PagingAndSortingRepository;

public interface DriverRepository extends CrudRepository<Driver, Long>, JpaRepository<Driver, Long>, PagingAndSortingRepository<Driver, Long> {
    Page<Driver> findAllByConfirmedFalse(Pageable pageable);

    Page<Driver> findAllByUserId(Long userId, Pageable pageable);
}
