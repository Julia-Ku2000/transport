package com.htp.domain;

import lombok.Getter;
import lombok.Setter;
import org.hibernate.validator.constraints.Length;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Table;
import javax.validation.constraints.Size;


@Getter
@Setter
@Entity
@Table(name = "m_drivers")
public class Driver extends AbstractFrom {

    @Column(name = "no_experience")
    private boolean noExperience;

    @Column(name = "experience_from_one_to_three")
    private boolean experienceFromOneToThree;

    @Column(name = "experience_more_than_three")
    private boolean experienceMoreThanThree;

    @Size(min = 2, max = 200, message = "Имя должно быть от 2 до 200 символов")
    @Column(name = "full_name")
    private String fullName;

    @Length(min = 9, max = 9, message = "Количество символов должно быть равно 9")
    @Column(name = "driver_license_number")
    private String driverLicenseNumber;


}
