import java.io.*;
import java.net.*;

public class ServeurTCP1 {
    public static void main(String[] args) {
       try {
        ServeurSocket socketserveur = new ServeurSocket( 2016 );
        System.out.println( "serveur en attente" );
        Socket socket = socketserveur.accept();
        System.out.println( "Connection d'un client" );
        DataInputStream dIn = new DataInputStream( socket.getInputStream()
            );
        System.out.println( "Message: " + dIn.readUTF());

        socket.close();
        socketserveur.close();      

            }
        } 
        catch ( Exception ex ) {
            
            System.out.println ( "Erreur!" ) ;
        }
    }
}



