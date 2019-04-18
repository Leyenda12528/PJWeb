/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Beans;
import Base.Conexion;
import java.sql.ResultSet;
import java.sql.SQLException;
/**
 *
 * @author jorge
 */
public class Empleado {

    /**
     * @return the existec
     */
    public int getExistec() {
        return existec;
    }

    /**
     * @param existec the existec to set
     */
    public void setExistec(int existec) {
        this.existec = existec;
    }
Conexion con=new Conexion();

    public Empleado()throws Exception{
    }
    /**
     * @return the id_empleado
     */
    public int getId_empleado() {
        return id_empleado;
    }

    /**
     * @param id_empleado the id_empleado to set
     */
    public void setId_empleado(int id_empleado) {
        this.id_empleado = id_empleado;
    }

    /**
     * @return the nombre_emp
     */
    public String getNombre_emp() {
        return nombre_emp;
    }

    /**
     * @param nombre_emp the nombre_emp to set
     */
    public void setNombre_emp(String nombre_emp) {
        this.nombre_emp = nombre_emp;
    }

    /**
     * @return the apellidos
     */
    public String getApellidos() {
        return apellidos;
    }

    /**
     * @param apellidos the apellidos to set
     */
    public void setApellidos(String apellidos) {
        this.apellidos = apellidos;
    }

    /**
     * @return the id_cargo
     */
    public int getId_cargo() {
        return id_cargo;
    }

    /**
     * @param id_cargo the id_cargo to set
     */
    public void setId_cargo(int id_cargo) {
        this.id_cargo = id_cargo;
    }

    /**
     * @return the id_depto
     */
    public int getId_depto() {
        return id_depto;
    }

    /**
     * @param id_depto the id_depto to set
     */
    public void setId_depto(int id_depto) {
        this.id_depto = id_depto;
    }

    /**
     * @return the edad
     */
    public int getEdad() {
        return edad;
    }

    /**
     * @param edad the edad to set
     */
    public void setEdad(int edad) {
        this.edad = edad;
    }

    /**
     * @return the direccion
     */
    public String getDireccion() {
        return direccion;
    }

    /**
     * @param direccion the direccion to set
     */
    public void setDireccion(String direccion) {
        this.direccion = direccion;
    }

    /**
     * @return the telefono
     */
    public String getTelefono() {
        return telefono;
    }

    /**
     * @param telefono the telefono to set
     */
    public void setTelefono(String telefono) {
        this.telefono = telefono;
    }

    /**
     * @return the correo
     */
    public String getCorreo() {
        return correo;
    }

    /**
     * @param correo the correo to set
     */
    public void setCorreo(String correo) {
        this.correo = correo;
    }

    /**
     * @return the password_emp
     */
    public String getPassword_emp() {
        return password_emp;
    }

    /**
     * @param password_emp the password_emp to set
     */
    public void setPassword_emp(String password_emp) {
        this.password_emp = password_emp;
    }

    /**
     * @return the id_estado_emp
     */
    public int getId_estado_emp() {
        return id_estado_emp;
    }

    /**
     * @param id_estado_emp the id_estado_emp to set
     */
    public void setId_estado_emp(int id_estado_emp) {
        this.id_estado_emp = id_estado_emp;
    }
    private int id_empleado;
    private String nombre_emp;
    private String apellidos;
    private int id_cargo;
    private int id_depto;
    private int edad;
    private String direccion;
    private String telefono;
    private String correo;
    private String password_emp;
    private int id_estado_emp;
    private int existec;
    
    
   public  int existeCargo() throws SQLException
   {
       int band = 0;
        String sql = "SELECT count(id_cargo) from empleados where id_cargo=1" ;
         ResultSet rs ;
            con.setRs(sql);
            rs= con.getRs();
        rs.next();
        /// JOptionPane.showMessageDialog(null, datos.getInt(1));
        if (rs.getInt(1) >= 1) 
            band =1;
        return band;
   }
}
