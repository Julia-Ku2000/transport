package com.htp.Utils;

import com.htp.domain.AbstractFrom;
import com.htp.domain.Route;
import org.springframework.validation.BindingResult;
import org.springframework.validation.FieldError;

import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;
import java.util.Map;
import java.util.stream.Collector;
import java.util.stream.Collectors;

public class ControllerUtils {
  public static Map<String, String> getErrors(BindingResult bindingResult) {
        Collector<FieldError, ?, Map<String, String>> collector = Collectors.toMap(
                fieldError -> fieldError.getField() + "Error",
                FieldError::getDefaultMessage
        );
        return bindingResult.getFieldErrors().stream().collect(collector);
    }

    public static boolean checkExperienceOptions(boolean noExperience, boolean experienceFromOneToThree, boolean experienceMoreThanThree) {
      return (!noExperience && !experienceFromOneToThree && !experienceMoreThanThree);
    }

    public static String checkRemark(AbstractFrom abstractFrom, String remark) {
        if (remark == null) {
            if (abstractFrom.getRemark().equals("Нет")) {
             return  "Нет";
            }
        }
        else if (remark.equals("Нет")) {
            return remark;
        }
        else {
            return remark + "\nВыставлено: " + LocalDateTime.now().format(DateTimeFormatter.ofPattern("HH:mm dd-MM-yyyy"));
        }
      return abstractFrom.getRemark() + "\nИсправлено: " + LocalDateTime.now().format(DateTimeFormatter.ofPattern("HH:mm dd-MM-yyyy"));
    }

    public static String checkRemark(Route route, String remark) {
        if (remark == null) {
            if (route.getRemark().equals("Нет")) {
                return  "Нет";
            }
        }
        else if (remark.equals("Нет")) {
            return remark;
        }
        else {
            return remark + "\nВыставлено: " + LocalDateTime.now().format(DateTimeFormatter.ofPattern("HH:mm dd-MM-yyyy"));
        }
        return route.getRemark() + "\nИсправлено: " + LocalDateTime.now().format(DateTimeFormatter.ofPattern("HH:mm dd-MM-yyyy"));
    }
}
