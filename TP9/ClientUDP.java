import java.io.*;
import java.net.*;

public class ClientUDP {
    public static void main(String[] args) {
        try {

            // Récupération de l'adresse IP local
            InetAddress addr = InetAddress.getLocalHost ();
            System.out.println("adresse=" +addr.getHostName() );
            
            // Configuration de data
            String s="Hello World";
            byte[] data = s.getBytes();
            
            // Création du packet UDP sur le port 1234
            DatagramPacket packet = new DatagramPacket( data, data.length, addr, 1234 );
            
            // Création du socket UDP pour l'envoi
            DatagramSocket sock = new DatagramSocket();
            
            // Envoi du packet avec send 
            sock.send(packet);
            sock.close();

        } 
        catch ( Exception ex ) {
            
            System.out.println ( "Erreur!" ) ;
        }
    }
}