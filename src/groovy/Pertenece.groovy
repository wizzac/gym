enum Pertenece {

    CASADETE("Casa de Te",1),
    RESTO("Resto",2),
    MIXTO("Compartido",3);


    private String pertenece;
    private int valor;

    private Pertenece(String pertenece, int valor) {
        this.pertenece = pertenece;
        this.valor = valor;
    }

    String getPertenece(){ return pertenece; }
    int getValor() {
        return valor;
    }

}