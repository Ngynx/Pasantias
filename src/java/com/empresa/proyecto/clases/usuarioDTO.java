/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.empresa.proyecto.clases;

import javax.validation.constraints.Pattern;
import org.hibernate.validator.constraints.NotEmpty;

/**
 *
 * @author BENNY
 */
public class usuarioDTO {
    private Integer codigo;
    
    //Usuario
    @NotEmpty(message="*Este campo no puede estar vacio")
    private String username;
    
    // Clave   
    @NotEmpty(message = "*Este campo no puede estar vacio")
    @Pattern(regexp = "^[a-zA-Z]\\w{3,14}$\\.?\\d*", message = "*El campo solo debe contener números y letras")
    private String password;
    

    private String rolename;

    public usuarioDTO(Integer codigo, String username, String password, String rolename) {
        this.codigo = codigo;
        this.username = username;
        this.password = password;
        this.rolename = rolename;
    }

    public usuarioDTO() {
    }

    public Integer getCodigo() {
        return codigo;
    }

    public void setCodigo(Integer codigo) {
        this.codigo = codigo;
    }

    public String getUsername() {
        return username;
    }

    public void setUsername(String username) {
        this.username = username;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public String getRolename() {
        return rolename;
    }

    public void setRolename(String rolename) {
        this.rolename = rolename;
    }

   
    
}
