class Gambeta < ActiveRecord::Base
  attr_accessor :current
  require 'digest/sha1'
  @connection = ActiveRecord::Base.establish_connection
  # establish_connection 'inclub'
  # self.table_name
  self.table_name = 'Cadastro'
  # sql = "INSERT INTO Administrador(nome, email, senha) VALUES ('Julia', 'julialiff@hotmail.com', 'qwerty');"
  # sql = "DELETE FROM Cadastro WHERE idCadastro>0;";
  # @result = @connection.connection.execute(sql)
  Faker::Config.locale = 'pt-BR'

  sql = ''
  @result = @connection.connection.execute(sql)
  # geraBalada

  # sql = "SELECT * from Usuario"
  # @result = @connection.connection.execute(sql)
  # puts @result
  # puts 'PUTS'
  # puts @result.first
  # puts 'PUTS'
  # @result.each(:as => :hash) do |row|
    # puts row
    # puts row['dataNasc']
  # end

  # def geraBalada
  #   #gera 200 baladas
  #   200.times do |n|
  #     @nome = Faker::Hipster.words(2)
  #     @email = @nome.first + @nome.second + '@gmail.com'
  #     @username = @nome.first + @nome.second
  #     @nome = @nome.first + ' ' + @nome.second
  #     @senha = Digest::SHA1.hexdigest '123456'
  #     @telefone = Faker::PhoneNumber.cell_phone
  #     @tipo = 1
  #     @cnpj = Faker::Number.number(2) + '.' + Faker::Number.number(3) + '.' + Faker::Number.number(3) + '/' + Faker::Number.number(4) + '-' + Faker::Number.number(2)
  #     @endereco = Faker::Address.street_name
  #     @numero = Faker::Number.number(3)
  #     @bairro = Faker::Address.city_prefix
  #     @cidade = Faker::Address.city
  #     @estado = Faker::Address.state_abbr
  #     @cep = Faker::Number.number(5) + "-" + Faker::Number.number(3)

  #     puts @nome
  #     sql = "INSERT INTO Cadastro(nome, email, username, senha, telefone, tipo)
  #                           VALUES('#{@nome}', '#{@email}', '#{@username}', '#{@senha}', '#{@telefone}', #{@tipo});"
  #     @result = @connection.connection.insert(sql)
  #     sql2 = "INSERT INTO Balada(idCadastro, cnpj, endereco, numero, bairro, cidade, estado, cep)
  #                         VALUES (#{@result}, '#{@cnpj}', '#{@endereco}', #{@numero}, '#{@bairro}', '#{@cidade}', '#{@estado}', '#{@cep}');"
  #     @result = @connection.connection.insert(sql2)
  #     @random_number = rand(1..15)
  #     sql3 = "INSERT INTO EstiloBalada(idBalada, idEstilo) VALUES(#{@result}, #{@random_number});"
  #     @result = @connection.connection.insert(sql3)
  #   end
  #   # inserir estilos em baladas
  #     # sql = "SELECT * from Balada;"
  #     # @result.each(:as => :hash) do |b|
  #     # puts b['idCadastro']
  #     # @id = b['idCadastro']
  #     # @random_number = rand(1..15)
  #     # puts @random_number
  #     # sql = "INSERT INTO EstiloBalada(idBalada, idEstilo)
  #                              # VALUES(#{@id}, #{@random_number});"
  #     # puts sql
  #     # @result = @connection.connection.insert(sql)
  #   # end
  # end

  # def geraUsuarios
  #   #gera 1000 usuários
  #   1000.times do |n|
  #     @nome = Faker::Name.first_name
  #     @sobrenome = Faker::Name.last_name
  #     @email = @nome + @sobrenome + '@gmail.com'
  #     @username = @nome + Faker::Number.number(4)
  #     @nome = @nome + ' ' + @sobrenome
  #     @senha = Digest::SHA1.hexdigest '123456'
  #     @telefone = Faker::PhoneNumber.cell_phone
  #     @tipo = 2
  #     @dataNasc = (Faker::Time.between(30.years.ago, 18.years.ago)).to_s.first(10)

  #     puts @nome
  #     sql = "INSERT INTO Cadastro(nome, email, username, senha, telefone, tipo)
  #                           VALUES('#{@nome}', '#{@email}', '#{@username}', '#{@senha}', '#{@telefone}', #{@tipo});"
  #     @result = @connection.connection.insert(sql)
  #     sql2 = "INSERT INTO Usuario(idCadastro, dataNasc) VALUES (#{@result}, #{@dataNasc});"
  #     @result = @connection.connection.execute(sql2)
  #   end
  # end

  # def geraFesta
  #   sql = "SELECT * from Balada;"
  #   @result = @connection.connection.execute(sql)
  #   i = 0
  #   @result.each(:as => :hash) do |b|
  #     @idBalada = b['idCadastro']
  #     if i <= 20
  #       @nome = Faker::Space.planet
  #     elsif i > 20 && i <= 50
  #       @nome = Faker::Space.moon
  #     elsif i > 50 && i <= 70
  #       @nome = Faker::Space.galaxy
  #     elsif i > 70 && i <= 100
  #       @nome = Faker::Space.nebula
  #     else
  #       @nome = Faker::Space.star
  #     end
  #     @data = Faker::Time.between(10.days.from_now, 30.days.from_now).strftime("%Y-%m-%d")
  #     @hora = '23:00:00'
  #     @tipo_bar = rand(0..1)
  #     sql = "INSERT INTO Festa(idBalada, nome, data, hora, tipo_bar)
  #                       VALUES(#{@idBalada}, '#{@nome}', '#{@data}', '#{@hora}', #{@tipo_bar});"
  #     @result = @connection.connection.insert(sql)
  #     @random_number = rand(1..15)
  #     sql = "INSERT INTO EstiloFesta(idFesta, idEstilo)
  #                              VALUES(#{@result}, #{@random_number});"
  #     @result = @connection.connection.insert(sql)
  #   end
  # end

  # def geraAvaliacoesFesta
  #   15.times do |n|
  #     @idFesta = rand(1..150)
  #     10.times do |n|
  #       @idUsuario = rand(16..1000)
  #       @comentario = Faker::Lorem.sentence
  #       @nota = rand(1..5)
  #       @dataHora = Faker::Time.between(10.days.from_now, 30.days.from_now).to_formatted_s(:db)
  #       sql = "INSERT INTO AvaliacaoFesta(idFesta, idUsuario, comentario, nota, dataHora)
  #                                 VALUES (#{@idFesta}, #{@idUsuario}, '#{@comentario}', #{@nota}, '#{@dataHora}');"
  #       @result = @connection.connection.insert(sql)
  #     end
  #   end
  # end

end
