package in.vibin.model;

import lombok.Data;
import com.fasterxml.jackson.annotation.JsonInclude;
import com.fasterxml.jackson.annotation.JsonInclude.Include;
@Data
@JsonInclude(value=Include.NON_NULL)
public class Message {
private String infoMessage;
private String errorMessage;

}
