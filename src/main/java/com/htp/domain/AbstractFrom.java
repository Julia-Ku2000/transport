package com.htp.domain;

import lombok.EqualsAndHashCode;
import lombok.Getter;
import lombok.Setter;
import lombok.ToString;
import org.hibernate.validator.constraints.Length;
import org.springframework.format.annotation.DateTimeFormat;

import javax.persistence.*;
import javax.validation.constraints.NotNull;
import java.time.LocalDate;


@MappedSuperclass
@Getter
@Setter
@EqualsAndHashCode(exclude = {
        "user"
})
@ToString(exclude = {
        "user"
})
public abstract class AbstractFrom {
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Id
    private Long id;

    @NotNull(message = "Укажите дату заключения")
    @DateTimeFormat(pattern = "yyyy-MM-dd")
    @Column(name = "date_of_conclusion")
    private LocalDate dateOfConclusion;

    @NotNull(message = "Укажите срок действия по")
    @DateTimeFormat(pattern = "yyyy-MM-dd")
    @Column(name = "length_of_a_contract")
    private LocalDate lengthOfAContract;

    @Length(max = 500)
    @Column(name = "remark")
    private String remark;

    @Column(name = "confirmed")
    private boolean confirmed;

    @ManyToOne
    @JoinColumn(name = "user_id")
    private User user;
}
