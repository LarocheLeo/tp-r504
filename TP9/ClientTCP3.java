import java.io.*;
import java.net.*;

public class ClientTCP3 {
    public static void main(String[] args) {
        try {
            Socket socket = new Socket( "localhost", 2016 );
            DataOutputStream dOut = new DataOutputStream( socket.getOutputStream() );
            dOut.writeUTF( args[0] );
			System.out.println("Message envoyer: " + args[0]);

			DataInputStream dIn = new DataInputStream(socket.getInputStream());
            String reversedMsg = dIn.readUTF();
            System.out.println("Message inversé reçu: " + reversedMsg);

            socket.close();
            socket.close();


        } 
        catch ( Exception ex ) {
            
            System.out.println ( "Erreur!" ) ;
        }
    }
}



/*
code original ClientTCP2:

public class ClientTCP2 {
    public static void main(String[] args) {
        try {
            Socket socket = new Socket( "localhost", 2016 );
            DataOutputStream dOut = new DataOutputStream( socket.getOutputStream() );
            dOut.writeUTF( args[0] );
            socket.close();


        } 
        catch ( Exception ex ) {
            
            System.out.println ( "Erreur!" ) ;
        }
    }
}


*/
