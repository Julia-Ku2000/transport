package com.htp.domain;

import com.fasterxml.jackson.annotation.JsonIgnoreProperties;
import lombok.*;
import org.springframework.security.core.GrantedAuthority;

import javax.persistence.*;

@Setter
@Getter
@RequiredArgsConstructor
@AllArgsConstructor
@EqualsAndHashCode(exclude = {
        "user"
})
@ToString(exclude = {
        "user"
})
@Entity
@Table(name = "m_roles")
public class Role implements GrantedAuthority {

    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Id
    private Long id;

    @Column(name = "role_name")
    private String roleName;

    @JsonIgnoreProperties("role")
    @ManyToOne
    @JoinColumn(name = "user_id")
    User user;

    @Override
    public String getAuthority() {
        return getRoleName();
    }
}
