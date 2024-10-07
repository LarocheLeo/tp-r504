import java.io.*;
import java.net.*;

public class ServeurUDP {
    public static void main(String[] args) {
       try {        

            // Création d'un socket UDP pour écouter les messages sur le port 1234
            DatagramSocket sock = new DatagramSocket(1234);

            // Une boucle infinie pour attendre les messages
            while (true) {   
                // Message d'attente 
                System.out.println( "-Waiting data" );

                // Préparation du paquet de réception en 1024 octets
                DatagramPacket packet = new DatagramPacket(new byte [1024], 1024);

                // Réception du paquet UDP
                sock.receive(packet);
                
                // Conversion des données reçues en chaîne de caractères
                String str = new String(packet.getData () );

                // Affichage du message reçu
                System.out.println( "str=" + str );
            }
        } 
        catch ( Exception ex ) {
            
            System.out.println ( "Erreur!" ) ;
        }
    }
}