package com.htp.domain;

import lombok.*;
import org.hibernate.validator.constraints.Length;
import org.springframework.format.annotation.DateTimeFormat;

import javax.persistence.*;
import javax.validation.constraints.NotNull;
import java.time.LocalDate;

@Getter
@Setter
@Entity
@Table(name = "m_routes")
public class Route  {

    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Id
    private Long id;

    @NotNull(message = "Укажите дату заключения")
    @DateTimeFormat(pattern = "yyyy-MM-dd")
    @Column(name = "date_of_setup_route")
    private LocalDate dateOfSetupRoute;

    @NotNull(message = "Укажите срок действия по")
    @DateTimeFormat(pattern = "yyyy-MM-dd")
    @Column(name = "last_change_date")
    private LocalDate lastChangeDate;

    @Column(name = "type_of_transport")
    private String typeOfTransport;

    @Column(name = "start_point")
    private String startPoint;

    @Column(name = "direction")
    private String direction;

    @Column(name = "number_of_stops")
    private String numberOfStops;

    @Column(name = "endpoint")
    private String endPoint;

    @Column(name = "confirmed")
    private boolean confirmed;

    @Length(max = 500)
    @Column(name = "remark")
    private String remark;

    @ManyToOne
    @JoinColumn(name = "user_id")
    private User user;

}
