package domains;

import java.util.List;

import com.fasterxml.jackson.annotation.JsonIgnoreProperties;
import com.fasterxml.jackson.annotation.JsonPropertyOrder;

@JsonPropertyOrder({"cuestionarios"})
@JsonIgnoreProperties

public class ListCuestionario{
    
	private List<Cuestionario> cuestionarios;

	public List<Cuestionario> getCuestionarios() {
		return cuestionarios;
	}

	public void setCuestionarios(List<Cuestionario> cuestionarios) {
		this.cuestionarios = cuestionarios;
	}
	
}