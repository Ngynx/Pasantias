/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.empresa.proyecto.clases;

import javax.validation.constraints.Pattern;
import org.hibernate.validator.constraints.Email;
import org.hibernate.validator.constraints.NotEmpty;

/**
 *
 * @author ramzes
 */
public class celularesDTO {
    
    private Integer codigo;
    
    @NotEmpty(message="Este campo no puede ir vacío")
    private String modelo;
    
    @NotEmpty(message="Este campo no puede ir vacío")
    private String marca;
    
    @NotEmpty(message="Este campo no puede ir vacío")
    private String fec_pub;
    
   
    private Float precio;

    public celularesDTO() {
    }

    public celularesDTO(Integer codigo, String modelo, String marca, String fec_pub, Float precio) {
        this.codigo = codigo;
        this.modelo = modelo;
        this.marca = marca;
        this.fec_pub = fec_pub;
        this.precio = precio;
    }

    public Integer getCodigo() {
        return codigo;
    }

    public void setCodigo(Integer codigo) {
        this.codigo = codigo;
    }

    public String getModelo() {
        return modelo;
    }

    public void setModelo(String modelo) {
        this.modelo = modelo;
    }

    public String getMarca() {
        return marca;
    }

    public void setMarca(String marca) {
        this.marca = marca;
    }

    public String getFec_pub() {
        return fec_pub;
    }

    public void setFec_pub(String fec_pub) {
        this.fec_pub = fec_pub;
    }

    public Float getPrecio() {
        return precio;
    }

    public void setPrecio(Float precio) {
        this.precio = precio;
    }

}
