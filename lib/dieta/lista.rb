
Node = Struct.new(:value, :next, :prev)

class Lse
    
    attr_reader :actual, :fin, :Max
    
    def initialize
        @Max = 0
        @actual = nil
        @fin = nil
    end
    
      #crea el nodo en base al dato e intenta insertarlo por el final de la lista
    def insertar(value)
        insert(Node.new(value, nil, nil))
    end
    
    #inserta un nodo al final de la lista
    def insert(value)
        if @Max <= TAM_MAX_LIST
            if @actual.nil?
                @actual = value
                @fin = value
            else
                value.next = @actual
                @actual.prev = value
                value.prev = nil
                @actual = value
            end
            @Max+= 1
        end
    end
    
    #retorna el nodo apuntado por actual
    def actual
        @actual
    end
    
    #retorna una cadena que contiene el contenido del nodo apuntado por la variable actual
    def mostrar_actual
        "#{@actual[:value]}\n\n"
    end

    #retornara una cadena que contiene el valor que guarda la estructura del nodo que se ha insertado 
    #en el apuntador fin, podra ser el primero insertado.
    def mostrar_fin
       "#{@fin[:value]}\n\n"
    end
    
    
     #metodo que enseña la lista empezando por el apuntador actual, que 
     #empezara por el ultimo elemento añadido
    def mostrar_lista_actual
        var = ""
        aux= @actual
        j= @Max
        if(@actual != nil) 
            while(aux[:next] != nil) do
                muestra = aux[:value]
                aux = aux[:next]
                
                i = j + 96
                var += "#{(i).chr} )#{muestra}\n\n"
                j-= 1
            end
             i = j + 96
            var += "#{(i).chr} )#{aux[:value]}\n\n"
        end
    end
    
    #metodo que enseña la lista empezando por el apuntador fin
    #empezara por el primer elemento añadido
    def mostrar_lista_final
        var = ""
        aux= @fin
        j= 0
        if(@fin != nil)
            while aux[:prev] != nil do
                muestra = aux[:value]
                aux = aux[:prev]
                i = j + 97
                var += "#{(i).chr} )#{muestra}\n\n"
                j+= 1
            end
             i = j + 97
            var +="#{(i).chr} )#{aux[:value]}\n\n"
        end
    end
    
    #extrae y retorna el elemento apuntado por el apuntador fin
    def extrac_fin
        if(@fin!= nil)
            aux = @fin
            @fin = @fin[:next]
            @Max-= 1
            var =aux[:value]
        else
            var =nil
        end
        var
    end
    
    #extrae y retorna el elemento apuntado por actual
    def extrac_actual
        if(@actual!= nil)
            aux = @actual
            @actual = @actual[:prev]
            @Max-= 1
            var = aux[:value]
        else
            var = nil
        end
        var
    end
    
    #retorna el valor de la variable max, que contiene el numero actual de nodos que contiene la lista
    def tam
        @Max
    end
    
    
    #metodo para limpiar la lista
    def clean
        while(@actual != nil) do
            aux= @actual
           @actual = @actual[:next]
           aux = nil
        end
        
        @actual = nil
        @fin = nil
        @Max = 0
    end
    
end