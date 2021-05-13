package com.htp.dao;

import com.htp.domain.Route;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.repository.CrudRepository;
import org.springframework.data.repository.PagingAndSortingRepository;

public interface RouteRepository extends CrudRepository<Route, Long>, JpaRepository<Route, Long>, PagingAndSortingRepository<Route, Long> {

    Page<Route> findAllByConfirmedFalse(Pageable pageable);

    Page<Route> findAllByUserId(Long userId, Pageable pageable);
}
