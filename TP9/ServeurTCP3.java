import java.io.*;
import java.net.*;

public class ServeurTCP3
{
    public static void main(String[] args)
	{
		try
		{

			ServerSocket socketserver = new ServerSocket( 2016 );
			while(true)
			{
			System.out.println( "serveur en attente" );
			Socket socket = socketserver.accept();
			System.out.println( "Connection d'un client" );
			DataInputStream dIn = new DataInputStream( socket.getInputStream());
			String msg = dIn.readUTF();
			System.out.println( "Message: " + msg);

			// Inverser le message
			String rev = new StringBuilder(msg).reverse().toString();
			System.out.println("Message inversé: " + rev);

			// Envoyer le message inversé au client
			DataOutputStream dOut = new DataOutputStream(socket.getOutputStream());
			dOut.writeUTF(rev);


			}
    
		}
		catch ( Exception ex )
		{
			System.out.println ( "Erreur!" ) ;
		}
	}
}



/*

code original ServeurTCP2 : 

public class ServeurTCP2
{
    public static void main(String[] args)
	{
		try
		{

			ServerSocket socketserver = new ServerSocket( 2016 );
			while(true)
			{
			System.out.println( "serveur en attente" );
			Socket socket = socketserver.accept();
			System.out.println( "Connection d'un client" );
			DataInputStream dIn = new DataInputStream( socket.getInputStream());
			System.out.println( "Message: " + dIn.readUTF());
			}
    
		}
		catch ( Exception ex )
		{
			System.out.println ( "Erreur!" ) ;
		}
	}
}

*/
