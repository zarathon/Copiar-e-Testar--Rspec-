path_codigo = "codigo/hello.rb"
filename_codigo = path_codigo.split("/").last
path_teste = "teste/hello_spec.rb"
filename_teste = path_teste.split("/").last
path_tmp = "tmp/"

#Copiando o codigo
codigo = File.open(path_codigo, "r")
file = File.new( path_tmp+filename_codigo, "w+") 
codigo.rewind 
codigo.each {|line| 
  file.puts(line)
  }
file.close

#Copiando o teste
teste = File.open(path_teste, "r")
file = File.new(path_tmp+filename_teste, "w+") 
codigo.rewind 
teste.each {|line| 
  file.puts(line)
  }
file.close

#Executa o teste
cmd  = "rspec "+path_tmp+filename_teste
saida = %x{#{cmd}}

#Apaga os arquivos criados
File.delete(path_tmp+filename_codigo)
File.delete(path_tmp+filename_teste)

#Imprime o resultado final do teste
puts saida