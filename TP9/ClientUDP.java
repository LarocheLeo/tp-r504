import java.io.*;
import java.net.*;

public class ClientUDP {
    public static void main(String[] args) {
        try {

            // Récupération de l'adresse locale
            InetAddress addr = InetAddress.getLocalHost();
            System.out.println("adresse = " + addr.getHostName());

            // Chaîne à envoyer au serveur
            String s = "Hello World from client";
            byte[] data = s.getBytes();

            // Création du packet UDP sur le port 1234
            DatagramPacket packet = new DatagramPacket(data, data.length, addr, 1234);

            // Création du socket UDP pour l'envoi
            DatagramSocket sock = new DatagramSocket();

            // Envoi du packet avec send 
            sock.send(packet);
            System.out.println("Message envoyé: " + s);

            // Attente de la réponse du serveur
            byte[] buffer = new byte[1024];
            DatagramPacket responsePacket = new DatagramPacket(buffer, buffer.length);
            sock.receive(responsePacket); // Réception de la réponse

            // Conversion des données reçues en chaîne de caractères
            String response = new String(responsePacket.getData(), 0, responsePacket.getLength());
            System.out.println("Message reçu du serveur : " + response);

        } 
        catch ( Exception ex ) {
            
            System.out.println ( "Erreur!" ) ;
        }
    }
}








/* Programme avant modification : 

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
*/