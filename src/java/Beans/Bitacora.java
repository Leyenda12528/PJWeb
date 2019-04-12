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
public class Bitacora {
    private int id_bitacora;
    private int id_caso;
    private String observaciones;
    private String descripcion_actividad;
    /**
     * @return the id_bitacora
     */
    public int getId_bitacora() {
        return id_bitacora;
    }

    /**
     * @param id_bitacora the id_bitacora to set
     */
    public void setId_bitacora(int id_bitacora) {
        this.id_bitacora = id_bitacora;
    }

    /**
     * @return the id_caso
     */
    public int getId_caso() {
        return id_caso;
    }

    /**
     * @param id_caso the id_caso to set
     */
    public void setId_caso(int id_caso) {
        this.id_caso = id_caso;
    }

    /**
     * @return the observaciones
     */
    public String getObservaciones() {
        return observaciones;
    }

    /**
     * @param observaciones the observaciones to set
     */
    public void setObservaciones(String observaciones) {
        this.observaciones = observaciones;
    }

    /**
     * @return the descripcion_actividad
     */
    public String getDescripcion_actividad() {
        return descripcion_actividad;
    }

    /**
     * @param descripcion_actividad the descripcion_actividad to set
     */
    public void setDescripcion_actividad(String descripcion_actividad) {
        this.descripcion_actividad = descripcion_actividad;
    }
    
}
