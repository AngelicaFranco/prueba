package conduit;

import java.util.List;
import java.util.Random;

public class NumeroAleatorio {

    public int getNumeroAleatorio(List articulos){

        Random random = new Random();
        return random.nextInt(articulos.size());
    }
}
