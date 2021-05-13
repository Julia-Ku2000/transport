package com.htp.service;

import com.htp.Utils.ControllerUtils;
import com.htp.dao.DriverRepository;
import com.htp.dao.UserRepository;
import com.htp.domain.Driver;
import com.htp.domain.User;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Service;

@Service
public class DriverService {

    private DriverRepository driverRepository;

    private UserRepository userRepository;

    public DriverService(DriverRepository driverRepository, UserRepository userRepository) {
        this.driverRepository = driverRepository;
        this.userRepository = userRepository;
    }

    public Page<Driver> findAllByUserId(Long userId, Pageable pageable) {
        return driverRepository.findAllByUserId(userId, pageable);
    }

    public Page<Driver> findAllUnconfirmed(Pageable pageable) {
        return driverRepository.findAllByConfirmedFalse(pageable);
    }

    public Driver findById(Long driverId) {
        return driverRepository.findById(driverId).orElseThrow(RuntimeException::new);
    }

    public Driver update(Driver driver, Driver driverRequest) {

        driver.setDateOfConclusion(driverRequest.getDateOfConclusion());
        driver.setLengthOfAContract(driverRequest.getLengthOfAContract());
        driver.setNoExperience(driverRequest.isNoExperience());
        driver.setExperienceFromOneToThree(driverRequest.isExperienceFromOneToThree());
        driver.setExperienceMoreThanThree(driverRequest.isExperienceMoreThanThree());
        driver.setFullName(driverRequest.getFullName());
        driver.setRemark(ControllerUtils.checkRemark(driver, driverRequest.getRemark()));
        driver.setConfirmed(driverRequest.isConfirmed());

        return driverRepository.save(driver);
    }

    public Driver save(Driver driver, User user) {

        driver.setDateOfConclusion(driver.getDateOfConclusion());
        driver.setLengthOfAContract(driver.getLengthOfAContract());
        driver.setNoExperience(driver.isNoExperience());
        driver.setExperienceFromOneToThree(driver.isExperienceFromOneToThree());
        driver.setExperienceMoreThanThree(driver.isExperienceMoreThanThree());
        driver.setUser(user);
        driver.setFullName(driver.getFullName());
        driver.setDriverLicenseNumber(driver.getDriverLicenseNumber());
        driver.setRemark("Нет");
        driver.setConfirmed(false);


        driverRepository.save(driver);

        user.getDrivers().add(driver);
        userRepository.save(user);

        return driverRepository.save(driver);
    }

    public void delete(Long driverId) {
        driverRepository.deleteById(driverId);
    }

}
