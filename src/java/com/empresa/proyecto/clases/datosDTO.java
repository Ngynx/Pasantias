package com.empresa.proyecto.clases;

import javax.validation.constraints.Pattern;
import org.hibernate.validator.constraints.Email;
import org.hibernate.validator.constraints.NotEmpty;

public class datosDTO {
    
    private Integer codigo;
    
    @NotEmpty(message="Este campo no puede ir vacío")
    private String usuario;
    
    @NotEmpty(message="Este campo no puede ir vacío")
    private String clave;
    
    @NotEmpty(message="Este campo no puede ir vacío")
    private String nombres;
    
    @NotEmpty(message="Este campo no puede ir vacío")
    private String direccion;
    
    @Pattern(regexp = ".*([0-9]\\.?\\d*)",message="Solo se permiten datos numéricos")
    private String telefono;
    
    @NotEmpty(message="Este campo no puede ir vacío")
    @Email(message="Debe ingresar una dirección de correo válida")
    private String correo;
    
    private String sexo;

    public datosDTO() {
    }

    public datosDTO(Integer codigo, String usuario, String clave, String nombres,
            String direccion, String telefono, String correo, String sexo) {
        this.codigo = codigo;
        this.usuario = usuario;
        this.clave = clave;
        this.nombres = nombres;
        this.direccion = direccion;
        this.telefono = telefono;
        this.correo = correo;
        this.sexo = sexo;
    }

    public Integer getCodigo() {
        return codigo;
    }

    public String getUsuario() {
        return usuario;
    }

    public String getClave() {
        return clave;
    }

    public String getNombres() {
        return nombres;
    }

    public String getDireccion() {
        return direccion;
    }

    public String getTelefono() {
        return telefono;
    }
    
    public String getCorreo() {
        return correo;
    }
    
    public String getSexo() {
        return sexo;
    }

    public void setCodigo(Integer codigo) {
        this.codigo = codigo;
    }

    public void setUsuario(String usuario) {
        this.usuario = usuario;
    }

    public void setClave(String clave) {
        this.clave = clave;
    }

    public void setNombres(String nombres) {
        this.nombres = nombres;
    }

    public void setDireccion(String direccion) {
        this.direccion = direccion;
    }

    public void setTelefono(String telefono) {
        this.telefono = telefono;
    }
    
    public void setCorreo(String correo) {
        this.correo = correo;
    }
    
    public void setSexo(String sexo) {
        this.sexo = sexo;
    }
}
