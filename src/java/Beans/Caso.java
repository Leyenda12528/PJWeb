/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Beans;

/**
 *
 * @author less_
 */
public class Caso {

    /**
     * @return the id_caso
     */
    public String getId_caso() {
        return id_caso;
    }

    /**
     * @param id_caso the id_caso to set
     */
    public void setId_caso(String id_caso) {
        this.id_caso = id_caso;
    }

    /**
     * @return the nombre_caso
     */
    public String getNombre_caso() {
        return nombre_caso;
    }

    /**
     * @param nombre_caso the nombre_caso to set
     */
    public void setNombre_caso(String nombre_caso) {
        this.nombre_caso = nombre_caso;
    }

    /**
     * @return the descrip_req
     */
    public String getDescrip_req() {
        return descrip_req;
    }

    /**
     * @param descrip_req the descrip_req to set
     */
    public void setDescrip_req(String descrip_req) {
        this.descrip_req = descrip_req;
    }

    /**
     * @return the descrip_rechazo
     */
    public String getDescrip_rechazo() {
        return descrip_rechazo;
    }

    /**
     * @param descrip_rechazo the descrip_rechazo to set
     */
    public void setDescrip_rechazo(String descrip_rechazo) {
        this.descrip_rechazo = descrip_rechazo;
    }

    /**
     * @return the descripcion_jefedes
     */
    public String getDescripcion_jefedes() {
        return descripcion_jefedes;
    }

    /**
     * @param descripcion_jefedes the descripcion_jefedes to set
     */
    public void setDescripcion_jefedes(String descripcion_jefedes) {
        this.descripcion_jefedes = descripcion_jefedes;
    }

    /**
     * @return the id_estado
     */
    public int getId_estado() {
        return id_estado;
    }

    /**
     * @param id_estado the id_estado to set
     */
    public void setId_estado(int id_estado) {
        this.id_estado = id_estado;
    }

    /**
     * @return the porcentaje_avance
     */
    public int getPorcentaje_avance() {
        return porcentaje_avance;
    }

    /**
     * @param porcentaje_avance the porcentaje_avance to set
     */
    public void setPorcentaje_avance(int porcentaje_avance) {
        this.porcentaje_avance = porcentaje_avance;
    }

    /**
     * @return the fecha_limite
     */
    public String getFecha_limite() {
        return fecha_limite;
    }

    /**
     * @param fecha_limite the fecha_limite to set
     */
    public void setFecha_limite(String fecha_limite) {
        this.fecha_limite = fecha_limite;
    }

    /**
     * @return the fecha_produccion
     */
    public String getFecha_produccion() {
        return fecha_produccion;
    }

    /**
     * @param fecha_produccion the fecha_produccion to set
     */
    public void setFecha_produccion(String fecha_produccion) {
        this.fecha_produccion = fecha_produccion;
    }
    private String id_caso;
    private String nombre_caso;
    private String descrip_req;
    private String descrip_rechazo;
    private String descripcion_jefedes;
    private int id_estado;
    private int porcentaje_avance;
    private String fecha_limite;
    private String fecha_produccion;
}
