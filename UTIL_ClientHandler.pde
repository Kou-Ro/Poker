class ClientHandler implements Runnable {
  private Client client;

  ClientHandler(Client client){
    this.client = client;
  }

  public void run(){
    client.write("N?\n");

    while(true){
      if(client.available() >= 2){
        String data = client.readStringUntil('\n');
        if(data != null){
          data = data.substring(0, data.length() - 1);
          if(data.substring(0, 2).equals("N!")){
            int id = info.clients.size() + 1;
            info.clients.add(new ClientData(client, data.substring(2), id));
            client.write("I!" + Integer.toString(id) + "\n");
            client.write("N!" + info.name + "\n");

            println("Added a client\nid: " + id);
            break;
          }
          else{
            client.write("E!\n");
            break;
          }
        }
        else{
          println("Reserved null value");
          client.write("E!\n");
          break;
        }
      }
    }
  }
}