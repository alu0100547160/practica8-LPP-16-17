require "spec_helper"


describe Datos do
  #DATOS
  @Descripciones= ['Mandarina','Tostadas con mermelada']
  @Racion=['1 unidad', '2 unidades']
  @Cantidad=[46,110]
  @Porcentaje=[10,30,60]
  @cantidad_diaria=[15]
  #objeto de pruebas
  Q=Dieta.new('Desayuno',@cantidad_diaria, @Descripciones,@Racion,@Cantidad,313.6,@Porcentaje)
  
  
  @Descripciones_= ['Zumo de naranja','Plantano']
  @Racion_=['1 vaso', '1 unidad']
  @Cantidad_=[200,110]
  @Porcentaje_=[10,30,60]
  @cantidad_diaria_=[15]
  #objeto de pruebas
  N=Dieta.new('Media Mañana',@cantidad_diaria_, @Descripciones_,@Racion_,@Cantidad_,313.6,@Porcentaje_)
  
  @Descripciones1= ['Galletas de leche con chocolate y yogur','Flan de vainilla sin huevo']
  @Racion1=['4 unidades', '1 unidad']
  @Cantidad1=[46,110]
  @Porcentaje1=[10,30,60]
  @cantidad_diaria1=[15]
  #objeto de pruebas
  M=Dieta.new('Merienda',@cantidad_diaria1, @Descripciones1,@Racion1,@Cantidad1,313.6,@Porcentaje1)
  
end


describe Lista do
  
  context "Prueba de las partes fundamentales de la clase lista:" do
     
          it "Existe una numero de versión" do
            expect(Pract06::VERSION).not_to be nil
          end
           
          it "Debe exitir una constate que indique el numero maximo de elementos que puede tener la lista" do
            expect(TAM_MAX_LIST).not_to be nil
          end
          
          it "Debe existir la clase lista: LSE" do
            expect { Lse.new }.not_to raise_error
            P=Lse.new() #lISTA QUE CONTENDRÁ NUMEROS
            H=Lse.new() #LISTA QUE CONTENDRÁ ELEMENTOS DIESTA
  
          end
          
          it "Debe existir un apuntador actual y final, asi como un contador max de nodos" do
      
              expect(P.actual).to be nil
              expect(P.fin).to be nil
              expect(P.Max).not_to be nil
              
              expect(H.actual).to be nil
              expect(H.fin).to be nil
              expect(H.Max).not_to be nil
          end
          
          it "Debe existir un metodo que me permita insertar elementos" do
            expect(P.insertar(3)).not_to be nil
            expect(H.insertar(Q)).not_to be nil
          end
          
          
          it "La clase tendra como nodo un dato tipo Struct" do
            #P.insertar(3)
            #prueba para la clase lista con numeros
            P.insertar(2)
            
            aux= P.actual
            if(P.actual != nil) 
              while (aux[:next] != nil) do
                expect(aux).to be_an_instance_of(Node)
                aux = aux[:next]
              end
            end
            
            #clase lista de dietas
            H.insertar(M)
            aux= H.actual
            if(H.actual != nil) 
              while (aux[:next] != nil) do
                expect(aux).to be_an_instance_of(Node)
                aux = aux[:next]
              end
            end
          end
          
          
          it "Debe existir un emtodo de acceso al ultimo y primer elemento de la lista" do
            #if(@actual != nil) 
               #expect(P.mostrar_actual).to be nil
               #expect(P.mostrar_fin).to be nil
            #end
            expect(P.mostrar_actual).not_to be nil
            expect(P.mostrar_fin).not_to be nil
            # undefined method `mostrar_actual'
            # undefined method `mostrar_fin'
            
            expect(H.mostrar_actual).not_to be nil
            expect(H.mostrar_fin).not_to be nil
           end
          
          
          it "Debe porder verse el conenido de la lista en dos sentidos, final->actual, actual->final" do
           # undefined method `mostrar_lista_final'
           # undefined method `mostrar_lista_actual'
            #P.insertar(3)
            #P.insertar(2)
            if(P.actual != nil) 
              expect(P.mostrar_lista_final).not_to be nil
              expect(P.mostrar_lista_actual).not_to be nil
            end
            
            if(H.actual != nil) 
              expect(H.mostrar_lista_final).not_to be nil
              expect(H.mostrar_lista_actual).not_to be nil
            end
          end
          
          
          it "Debe corresponder la salida al tipo de funcion de muestra, final->actual" do
             expect(P.mostrar_lista_final).to eq("a )3\n\nb )2\n\n")
              
             var ="a )Desayuno (15%)\n- Mandarina, 1 unidad, 46 g\n- Tostadas con mermelada, 2 unidades, 110 g\nV.C.T. | %\t313.6 kcal | 10% - 30% - 60%\n\n"
             var2= "b )Merienda (15%)\n- Galletas de leche con chocolate y yogur, 4 unidades, 46 g\n- Flan de vainilla sin huevo, 1 unidad, 110 g\nV.C.T. | %\t313.6 kcal | 10% - 30% - 60%\n\n"
             var += var2
             expect(H.mostrar_lista_final).to eq(var)
          end
          
          it "Debe corresponder la salida al tipo de funcion de muestra, actual->final" do
             var ="a )Desayuno (15%)\n- Mandarina, 1 unidad, 46 g\n- Tostadas con mermelada, 2 unidades, 110 g\nV.C.T. | %\t313.6 kcal | 10% - 30% - 60%\n\n"
             var2= "b )Merienda (15%)\n- Galletas de leche con chocolate y yogur, 4 unidades, 46 g\n- Flan de vainilla sin huevo, 1 unidad, 110 g\nV.C.T. | %\t313.6 kcal | 10% - 30% - 60%\n\n"
             var2 += var
             expect(H.mostrar_lista_actual).to eq(var2)
             expect(P.mostrar_lista_actual).to eq("b )2\n\na )3\n\n")
          end
          
          it "Debe existir un metodo para extraer elementos de la lista" do
            #var = P.mostrar_lista_final
            #puts "#{var}**"
            
            
            #P.insertar(3)
            #P.insertar(2)
            P.insertar(4)
            #var = P.mostrar_lista_final
            #puts "#{var}"
            expect(P.extrac_actual).to eq(4)
            expect(P.extrac_fin).to eq(3)
            
            #-------------------------
            H.insertar(N)
            
            expect(H.extrac_actual).to eq(N)
            expect(H.extrac_fin).to eq(Q)
          end
          
          it "Debe existir un metodo que me permita acceder al tamaño de la lista" do
            expect(P.tam).not_to be nil
            expect(P.tam).to eq(1)
            #undefined method `tam'
            
            expect(H.tam).not_to be nil
            expect(H.tam).to eq(1)
          end
          
          it "Debe existir un metodo que me permita limpiar el contenido de la lista, si esta no esta vacia" do
              expect(P.clean).not_to be nil
              #undefined method `clean'
              
              expect(H.clean).not_to be nil
          end
  end
end

describe Lista_comidas do
  # <top (required)>': uninitialized constant Menu_alimentos (NameError)
  context "Pruebas para la clase Menu_alimentos y Edad, herencia de Dieta" do
    it "Existe una numero de versión" do
            expect(Pract08::VERSION).not_to be nil
    end
    
    it "->Tipo de instancia de un objeto que pertenece a la clase y Herencia de la clase Dieta." do
        expect{Menu_alimentos.new(nil)}.not_to raise_error
        L=Menu_alimentos.new(nil)
        expect(L).not_to be nil
        
        #Estar en la jerarquia de Menu_alimentos
        expect(L).to be_an_instance_of(Menu_alimentos)
        expect(L.is_a? Dieta).to be_truthy
        expect(L.kind_of? Object).to be_truthy
        
        #-----------------------------------------------EDAD
        #expected no Exception, got #<NameError: uninitialized constant Edad>
        expect{Edad.new(nil)}.not_to raise_error
        Z=Edad.new(nil)
        expect(Z).not_to be nil
        
        #Estar en la jerarquia de Menu_alimentos
        expect(Z).to be_an_instance_of(Edad)
        expect(Z.is_a? Dieta).to be_truthy
        expect(Z.kind_of? Object).to be_truthy
    end
    
    it "->Atributos principales" do
      #Failure/Error: expect(L).to respond_to(:Tipo)
      #expected #<Menu_alimentos:0x00000002f37dc8 @tipo_dieta=0, 
      #@ingesta=0, @descripcion=0, @racion=0, @cantidad=0, @kcal=0, 
      #@percent=0, @Tipo=nil> to respond to :Tipo
        expect(L).to respond_to(:Tipo)
        
        #-----------------------------------------------EDAD
        
      #Failure/Error: expect(Z).to respond_to(:edad)
      #expected #<Edad:0x000000022c9050> to respond to :edad
        expect(Z).to respond_to(:edad)
    end
    
    it "->Cambiar el tipo o edad de grupo de dieta" do
      #cambiar tipo de menu
      #undefined method `change_type' for #<Menu_alimentos:0x00000001405640>
      expect(L).to respond_to(:change_type)
      expect(L.change_type('verduras y otras hortalizas')).not_to be nil
      expect(L.Tipo).to eq('verduras y otras hortalizas')
      
      #-----------------------------------------------EDAD
      #NoMethodError:
      #undefined method `change_edad' for #<Edad:0x0000000222c200>
      expect(Z).to respond_to(:change_edad)
      expect(Z.change_edad(4,8)).not_to be nil
      expect(Z.edad).to eq('de 4 a 8 años')
      
    end
    
    it "->Insertar una dieta en el grupo" do
        
      #insertar elementos tipo dieta en la lista del objeto, siempre que sean 
      #del tipo de menu del objeto
      #insertar un elemento tipo dieta utilizando un operador
      #undefined method `<<' for #<Menu_alimentos:0x0000000236b4e0>
      expect(L << Q).not_to be nil
      
      #-----------------------------------------------EDAD
      #Este error se debe a que tenemos el metodo definido enla super clas
      #pero no esta redefiniso en Edad
      #wrong number of arguments (given 1, expected 7)
      expect(Z << M).not_to be nil
    end
  end
  
  context "Pruebas finales en una lista" do
    
    Y=Lse.new()
    
    it "->Insertamos elementos en una misma lista" do
      #insertamos los dos tipos de grupos en una lista Y
      expect(Y.insertar(L)).not_to be nil
      expect(Y.insertar(Z)).not_to be nil
    end
    
    it "Extraemos los distintos elementos" do
      #Extraemos para comprobar el funcionamiento de la lista
      #doblemente enlazada
      expect(Y.extrac_actual).to eq(Z)
      expect(Y.extrac_fin).to eq(L)
    end
  end
end