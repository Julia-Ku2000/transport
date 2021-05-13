package com.htp.service;

import com.htp.Utils.ControllerUtils;
import com.htp.dao.RouteRepository;
import com.htp.dao.UserRepository;
import com.htp.domain.Route;
import com.htp.domain.User;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Service;

@Service
public class RouteService {

    private RouteRepository routeRepository;

    private UserRepository userRepository;

    public RouteService(RouteRepository routeRepository, UserRepository userRepository) {
        this.routeRepository = routeRepository;
        this.userRepository = userRepository;
    }

    public Page<Route> findAllUnconfirmed(Pageable pageable) {
       return routeRepository.findAllByConfirmedFalse(pageable);
    }

    public Route findById(Long routeId) {
        return routeRepository.findById(routeId).orElseThrow(RuntimeException::new);
    }

    public Page<Route> findAllByUserId(Long userId, Pageable pageable) {
        return routeRepository.findAllByUserId(userId, pageable);
    }

    public Route update(Route route, Route routeRequest) {

        route.setDateOfSetupRoute(routeRequest.getDateOfSetupRoute());
        route.setLastChangeDate(routeRequest.getLastChangeDate());
        route.setTypeOfTransport(routeRequest.getTypeOfTransport());
        route.setConfirmed(routeRequest.isConfirmed());
        route.setNumberOfStops(routeRequest.getNumberOfStops());
        route.setRemark(ControllerUtils.checkRemark(route, routeRequest.getRemark()));
        route.setStartPoint(routeRequest.getStartPoint());
        route.setDirection(routeRequest.getDirection());
        route.setEndPoint(routeRequest.getEndPoint());

        return routeRepository.save(route);
    }

    public Route save(Route route, User user) {

        route.setDateOfSetupRoute(route.getDateOfSetupRoute());
        route.setLastChangeDate(route.getLastChangeDate());
        route.setTypeOfTransport(route.getTypeOfTransport());
        route.setNumberOfStops(route.getNumberOfStops());
        route.setStartPoint(route.getStartPoint());
        route.setDirection(route.getDirection());
        route.setEndPoint(route.getEndPoint());

        route.setUser(user);
        route.setRemark("Нет");
        user.getRoutes().add(route);
        userRepository.save(user);

        return routeRepository.save(route);

    }

    public void delete(Long routeId) {
               routeRepository.deleteById(routeId);
    }
}
