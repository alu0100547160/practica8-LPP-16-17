=begin class Menu_alimentos < Dieta
    attr_reader :Tipo,:Lista_comidas
    def initialize(t)
        super(0,0,0,0,0,0,0)
        #la variable tipo almacenara el conjunto de alimentos 
        #a los que pertenece la dieta
            @Tipo = t 
    end
    
    def change_type(tipo)
        @Tipo=tipo
    end
    
    def <<(dieta)
        super(dieta.tipo_dieta, dieta.ingesta, dieta.descripcion, dieta.racion, dieta.cantidad, dieta.kcal, dieta.percent)
    end
end
=end

##### CLASE DE GRUPO BASADA EN EDAD
class Edad < Dieta
     attr_reader :edad
    def initialize(edad)
        super(0,0,0,0,0,0,0)
        @edad=edad
    end
    def change_edad(a,b)
        @edad= "de #{a} a #{b} años"
    end
    
    def <<(dieta)
        super(dieta.tipo_dieta, dieta.ingesta, dieta.descripcion, dieta.racion, dieta.cantidad, dieta.kcal, dieta.percent)
    end
end
