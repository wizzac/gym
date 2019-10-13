package nomenclador

abstract class Vigente extends EstadoSimple {
	Date vigenciaDesde;
    Date vigenciaHasta;
	
	static constraints = {
		vigenciaHasta nullable:true
	}
}
