import java.io.*;
import java.net.*;

public class ClientHTTP {
    public static void main(String[] args) {
        String hostname = args[0];
        Socket socket = null;

        try 
		{
            socket = new Socket(hostname, 80);

            OutputStreamWriter osw = new OutputStreamWriter(socket.getOutputStream());
            InputStreamReader isw = new InputStreamReader(socket.getInputStream());

            BufferedWriter bufOut = new BufferedWriter(osw);
            BufferedReader bufIn = new BufferedReader(isw);

            String request = "GET / HTTP/1.0\r\nHost: " + hostname + "\r\n\r\n";
            bufOut.write(request, 0, request.length());
            bufOut.flush();

            String line = bufIn.readLine();
            while (line != null) 
			{
            	System.out.println(line);
            	line = bufIn.readLine();

            }

            bufIn.close();
            bufOut.close();
			socket.close();
        } 

        catch ( Exception ex ) {
            
            System.out.println ( "Erreur!" ) ;
        }
    }
}




