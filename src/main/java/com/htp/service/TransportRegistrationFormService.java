package com.htp.service;

import com.htp.Utils.ControllerUtils;
import com.htp.dao.TransportRegistrationFormRepository;
import com.htp.dao.UserRepository;
import com.htp.domain.TransportRegistrationForm;
import com.htp.domain.User;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Service;

@Service
public class TransportRegistrationFormService {

    private TransportRegistrationFormRepository transportRegistrationFormRepository;

    private UserRepository userRepository;

    public TransportRegistrationFormService(TransportRegistrationFormRepository transportRegistrationFormRepository, UserRepository userRepository) {
        this.transportRegistrationFormRepository = transportRegistrationFormRepository;
        this.userRepository = userRepository;
    }

    public Page<TransportRegistrationForm> findAllUnconfirmed(Pageable pageable) {
        return transportRegistrationFormRepository.findAllByConfirmedFalse(pageable);
    }

    public Page<TransportRegistrationForm> findAllByUserId(Long userId, Pageable pageable) {
      return transportRegistrationFormRepository.findAllByUserId(userId, pageable);
    }

    public TransportRegistrationForm findById(Long transportRegistrationFormId) {
        return transportRegistrationFormRepository.findById(transportRegistrationFormId).get();
    }

    public TransportRegistrationForm update(TransportRegistrationForm transportRegistrationForm, TransportRegistrationForm transportRegistrationFormRequest, User user) {

        transportRegistrationForm.setDateOfConclusion(transportRegistrationFormRequest.getDateOfConclusion());
        transportRegistrationForm.setLengthOfAContract(transportRegistrationFormRequest.getLengthOfAContract());
        transportRegistrationForm.setСarBrand(transportRegistrationFormRequest.getСarBrand());
        transportRegistrationForm.setCarLicensePlate(transportRegistrationFormRequest.getCarLicensePlate());
        transportRegistrationForm.setWinNumber(transportRegistrationFormRequest.getWinNumber());
        transportRegistrationForm.setDriverLicenseNumber(transportRegistrationFormRequest.getDriverLicenseNumber());
        transportRegistrationForm.setDateOfFirstTrip(transportRegistrationFormRequest.getDateOfFirstTrip());
        transportRegistrationForm.setRemark(ControllerUtils.checkRemark(transportRegistrationForm, transportRegistrationFormRequest.getRemark()));
        transportRegistrationForm.setConfirmed(transportRegistrationFormRequest.isConfirmed());


        return transportRegistrationFormRepository.save(transportRegistrationForm);
    }

    public TransportRegistrationForm save(TransportRegistrationForm transportRegistrationForm, User user) {

        transportRegistrationForm.setDateOfConclusion(transportRegistrationForm.getDateOfConclusion());
        transportRegistrationForm.setLengthOfAContract(transportRegistrationForm.getLengthOfAContract());
        transportRegistrationForm.setCarLicensePlate(transportRegistrationForm.getCarLicensePlate());
        transportRegistrationForm.setWinNumber(transportRegistrationForm.getWinNumber());
        transportRegistrationForm.setСarBrand(transportRegistrationForm.getСarBrand());
        transportRegistrationForm.setUser(user);
        transportRegistrationForm.setDriverLicenseNumber(transportRegistrationForm.getDriverLicenseNumber());
        transportRegistrationForm.setDateOfFirstTrip(transportRegistrationForm.getDateOfFirstTrip());
        transportRegistrationForm.setRemark("Нет");
        transportRegistrationForm.setConfirmed(false);
        transportRegistrationFormRepository.save(transportRegistrationForm);

        user.getTransportRegistrationForms().add(transportRegistrationForm);
        userRepository.save(user);

        return transportRegistrationFormRepository.save(transportRegistrationForm);
    }

    public void delete(Long transportRegistrationFormId) {
        transportRegistrationFormRepository.deleteById(transportRegistrationFormId);
    }
}
