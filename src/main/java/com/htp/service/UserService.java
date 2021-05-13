package com.htp.service;

import com.htp.dao.UserRepository;
import com.htp.domain.Role;
import com.htp.domain.Roles;
import com.htp.domain.User;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.stereotype.Service;

import java.time.LocalDate;
import java.util.*;
import java.util.stream.Collectors;

@Service
public class UserService implements UserDetailsService {

    private UserRepository userRepository;

    public UserService(UserRepository userRepository) {
        this.userRepository = userRepository;
    }

    @Override
    public UserDetails loadUserByUsername(String username) throws UsernameNotFoundException {
        return userRepository.findByEmail(username);
    }

    public User findByEmail(String email) {
       return userRepository.findByEmail(email);
    }

    public List<User> findAll() {
        return userRepository.findAll();
    }

    public User findById(Long userId) {
        return userRepository.findById(userId).orElseThrow(RuntimeException::new);
    }

    public User update(User user, String username, String surname, String patronymic, String password,
                       LocalDate dateOfBirth, String passportSeriesNumber, String registrationAddress) {

        user.setUsername(username);
        user.setSurname(surname);
        user.setPatronymic(patronymic);
        user.setPassword(password);
        user.setDateOfBirth(dateOfBirth);
        user.setPassportSeriesNumber(passportSeriesNumber);
        user.setRegistrationAddress(registrationAddress);

        return userRepository.save(user);
    }

    public User updateCredentials(Long userId, String username, String surname, Map<String, String> form) {

        User user = userRepository.findById(userId).get();
        user.setUsername(username);
        user.setSurname(surname);

        Set<String> roles = Arrays.stream(Roles.values())
                .map(Roles::name)
                .collect(Collectors.toSet());

        user.getRoles().clear();

        for (String key : form.keySet()) {
            if (roles.contains(key)) {
                Role role = new Role();
                role.setRoleName(key);
                user.getRoles().add(role);
                role.setUser(user);
            }
        }
        return userRepository.save(user);
    }

    public boolean addUser(User user) {
        User userFromDb = userRepository.findByEmail(user.getEmail());
        if (userFromDb != null) {
            return false;
        }

        user.setEmail(user.getEmail());
        user.setUsername(user.getUsername());
        user.setSurname(user.getSurname());
        user.setPatronymic(user.getPatronymic());
        user.setPassword(user.getPassword());
        user.setDateOfBirth(user.getDateOfBirth());
        user.setPassportSeriesNumber(user.getPassportSeriesNumber());
        user.setRegistrationAddress(user.getRegistrationAddress());
        user.setActive(true);
        Role role = new Role();
        role.setRoleName(Roles.ROLE_USER.name());
        role.setUser(user);
        user.setRoles(Collections.singleton(role));

        userRepository.save(user);

        return true;
    }
}
