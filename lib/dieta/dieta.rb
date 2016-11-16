
class Dieta
    attr_accessor :tipo_dieta, :ingesta, :descripcion, :racion, :cantidad, :kcal, :percent
    def initialize(tipo_dieta, ingesta, descripcion, racion, cantidad, kcal, percent)
      @tipo_dieta, @ingesta, @descripcion, @racion, @cantidad, @kcal, @percent = tipo_dieta, ingesta, descripcion, racion, cantidad, kcal, percent
    end
    
    def get_platos #devuelve todos los platos que hay con sus descripciones
        @i=0
        s= ""
        while (@descripcion[@i] != nil && @cantidad[@i] != nil) do
            s += "- #{@descripcion[@i]}, "
            if (@racion[@i] != nil)
                s += "#{@racion[@i]}, "
            end
            s += "#{@cantidad[@i]} g"
            s += "\n"
            @i += 1
        end
        s #se devuelve e imprime
    end
    
    def << (value1,value2,value3,value4,value5,value6,value7)
       @tipo_dieta=value1
       @ingesta=value2
       @descripcion=value3
       @racion=value4
       @cantidad=value5
       @kcal=value6
       @percent=value7
    end
    
    def get_prot #devuelve porcentajes de proteinas
        @percent[0]
    end
    
    def get_gras #devuelve porcentaje de grasas
        @percent[1]
    end
    
    def get_hidr #devuelve porcentaje de hidratos
        @percent[2]
    end
    
    def get_titulo #devuelve el tipo de comida mas su ingesta diaria
        s = "#{@tipo_dieta} "
        if (@ingesta[1] == nil)
        s += "(#{@ingesta[0]}%)"
        else
        s += "(#{@ingesta[0]}% - #{@ingesta[1]}%)"
        end
        s #se devuelve e imprime
    end
    
    def get_descripcion(pos) #devuelve el nombre del plato especificado en "pos"
        s = "#{@descripcion[pos]}"
        s #se devuelve e imprime
    end
    
    def get_to_(pos) #devuelve una linea con la descripcion completa de un plato
        s = "- #{@descripcion[pos]}, "
        if (@racion[pos] != nil)
          s += "#{@racion[pos]}, "
        end
        s += "#{@cantidad[pos]} g"
        s #se devuelve e imprime
    end
    
    def to_s #devuelve la salida con todos los datos
      s = "#{@tipo_dieta} "
      if (@ingesta[1] == nil)
        s += "(#{@ingesta[0]}%)"
      else
        s += "(#{@ingesta[0]}% - #{@ingesta[1]}%)"
      end
      s += "\n"
      @i = 0
      while (@descripcion[@i] != nil && @cantidad[@i] != nil) do
        s += "- #{@descripcion[@i]}, "
        if (@racion[@i] != nil)
          s += "#{@racion[@i]}, "
        end
        s += "#{@cantidad[@i]} g"
        s += "\n"
        @i += 1
      end
      s += "V.C.T. | %"
      s += "\t"
      s += "#{@kcal} kcal |"
      @j = 0
      while (@percent[@j] != nil)
        if (@j != 0)
          s += " -"
        end
        s += " #{@percent[@j]}%"
        @j += 1
      end
      s #se devuelve e imprime
    end
end