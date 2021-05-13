package com.htp.domain;

import com.fasterxml.jackson.annotation.JsonIgnore;
import lombok.*;
import org.hibernate.validator.constraints.Length;
import org.springframework.format.annotation.DateTimeFormat;
import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.userdetails.UserDetails;

import javax.persistence.*;
import javax.validation.constraints.*;
import java.time.LocalDate;
import java.util.Collection;
import java.util.Collections;
import java.util.Set;


@Getter
@Setter
@AllArgsConstructor
@RequiredArgsConstructor
@Entity
@EqualsAndHashCode(exclude = {
        "roles"
})
@ToString(exclude = {
        "roles"
})

@Table(name = "m_users")
public class User implements UserDetails {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;

    @Size(min = 2, max = 200, message = "Имя должно быть от 2 до 200 символов")
    @Column(name = "username")
    private String username;


    @Size(min = 2, max = 200, message = "Фамилия должна быть от 2 до 200 символов")
    @Column(name = "surname")
    private String surname;

    @Size(min = 2, max = 200, message = "Отчество должно быть от 2 до 200 символов")
    @Column(name = "patronymic")
    private String patronymic;

    @Email(regexp = "[A-Za-z0-9._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,6}", message = "Неправильный формат")
    @Column(name = "email")
    private String email;

    @Length(min = 6, max = 200, message = "Пароль должен быть от 6 до 200 символов")
    @Column(name = "password")
    private String password;


    @NotNull(message = "Укажите дату рождения")
    @Column(name = "date_of_birth")
    @DateTimeFormat(pattern = "yyyy-MM-dd")
    private LocalDate dateOfBirth;

    @Pattern(regexp = "^[A-Z]{2}[0-9]{7}", message = "Не ферный формат, укажите в формате: MP123456")
    @Column(name = "passport_series_number")
    private String passportSeriesNumber;

    @Length(min = 6, max = 200, message = "Адрес должен содержать от 6 до 200 символов")
    @Column(name = "registration_address")
    private String registrationAddress;

    private boolean active;

    @OneToMany(mappedBy = "user", cascade = {CascadeType.ALL}, fetch = FetchType.EAGER, orphanRemoval = true)
    @JsonIgnore
    private Set<Role> roles = Collections.emptySet();

    @OneToMany(mappedBy = "user", fetch = FetchType.EAGER, orphanRemoval = true)
    private Set<Driver> drivers = Collections.emptySet();

    @OneToMany(mappedBy = "user", fetch = FetchType.EAGER, orphanRemoval = true)
    private Set<Route> routes = Collections.emptySet();


    @OneToMany(mappedBy = "user", fetch = FetchType.EAGER, orphanRemoval = true)
    private Set<TransportRegistrationForm> transportRegistrationForms = Collections.emptySet();

    public boolean isAdmin() {
        return getRoles().stream().anyMatch(role -> role.getRoleName().equals("ROLE_ADMIN"));
    }

    @Override
    public Collection<? extends GrantedAuthority> getAuthorities() {
        return getRoles();
    }

    @Override
    public boolean isAccountNonExpired() {
        return true;
    }

    @Override
    public boolean isAccountNonLocked() {
        return true;
    }

    @Override
    public boolean isCredentialsNonExpired() {
        return true;
    }

    @Override
    public boolean isEnabled() {
        return isActive();
    }
}
