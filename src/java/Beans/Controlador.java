/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Beans;

import java.util.*;
import javax.activation.*;
import javax.mail.*;
import javax.mail.internet.*;

/**
 *
 * @author Alfredo López
 */
public class Controlador {
    
    public boolean enviar(Correo email){
        try {
            Properties p=new Properties();
            p.put("mail.smtp.host","smtp.gmail.com");
            p.setProperty("mail.smtp.starttls.enable", "true");
            p.setProperty("mail.smtp.port", "587");
            p.setProperty("mail.smtp.user", email.getCorreoUser());
            p.setProperty("mail.smtp.auth", "true");
            
            Session s=Session.getDefaultInstance(p,null);
            BodyPart texto=new MimeBodyPart();
            BodyPart adjunto=new MimeBodyPart();//esto es para un archivo adjunto
            
            texto.setText(email.getMensaje());//Obtenemos el mensaje del bean
            MimeMultipart m=new MimeMultipart();
            m.addBodyPart(texto);//añadimos el mensaje
            
            if (!email.getRutaArchivo().equals("")) {//existe el archivo adjunto?
                adjunto.setDataHandler(new DataHandler(new FileDataSource(email.getRutaArchivo())));
                adjunto.setFileName(email.getNombreArchivo());
                m.addBodyPart(adjunto);//añadimos el archivo adjunto
            }
            
            //se arma el correo
            MimeMessage enviarM=new MimeMessage(s);
            enviarM.setFrom(new InternetAddress(email.getCorreoUser()));//correo emisor
            enviarM.addRecipient(Message.RecipientType.TO, new InternetAddress(email.getCorreoDestino()));//correo destinatario
            enviarM.setSubject(email.getAsunto());
            enviarM.setContent(m);
            
            //se conecta al medio(gmail)
            Transport t=s.getTransport("smtp");
            t.connect(email.getCorreoUser(), email.getContra());
            t.sendMessage(enviarM, enviarM.getAllRecipients());//envia el correo
            t.close();
            return true;
            
        } catch (Exception e) {
            System.out.println("Error en el controlador "+e);
        return false;
        }
        
    }
}