
package com.empresa.proyecto.clases;
import javax.validation.constraints.Pattern;
import org.hibernate.validator.constraints.Email;
import org.hibernate.validator.constraints.NotEmpty;

public class nexusDTO {
    
    private Integer codigo;
    
    @NotEmpty(message="Este campo no puede ir vacío")
    private String nombres;
    
    @NotEmpty(message="Este campo no puede ir vacío")
    private String direccion;
    
    @NotEmpty(message="Este campo no puede ir vacío")
    @Pattern(regexp = ".*([0-9]\\.?\\d*)",message="Solo se permiten datos numéricos")
    private String telefono;
    
    @NotEmpty(message="Este campo no puede ir vacío")
    private String correo;
    
    @NotEmpty(message="Este campo no puede ir vacío")
    private String ubicacion;

    public nexusDTO() {
    }

    public nexusDTO(Integer codigo, String nombres, String direccion, String telefono, String correo, String ubicacion) {
        this.codigo = codigo;
        this.nombres = nombres;
        this.direccion = direccion;
        this.telefono = telefono;
        this.correo = correo;
        this.ubicacion = ubicacion;
    }

    public Integer getCodigo() {
        return codigo;
    }

    public void setCodigo(Integer codigo) {
        this.codigo = codigo;
    }

    public String getNombres() {
        return nombres;
    }

    public void setNombres(String nombres) {
        this.nombres = nombres;
    }

    public String getDireccion() {
        return direccion;
    }

    public void setDireccion(String direccion) {
        this.direccion = direccion;
    }

    public String getTelefono() {
        return telefono;
    }

    public void setTelefono(String telefono) {
        this.telefono = telefono;
    }

    public String getCorreo() {
        return correo;
    }

    public void setCorreo(String correo) {
        this.correo = correo;
    }

    public String getUbicacion() {
        return ubicacion;
    }

    public void setUbicacion(String ubicacion) {
        this.ubicacion = ubicacion;
    }
    

    
}

