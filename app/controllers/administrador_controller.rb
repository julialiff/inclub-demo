class AdministradorController < ActionController::Base
  def show
    # @a = ActiveRecord::Base.connection.tables
    @connection = ActiveRecord::Base.establish_connection(adapter: 'mysql2',
                                                        encoding: 'utf8',
                                                        pool: 5,
                                                        timeout: 5000,
                                                        database: 'inclub',
                                                        username: 'root',
                                                        password: "ach20252017",
                                                        host: '35.184.66.35',
                                                        port: 3306)
    # @a = Administrador

    Faker::Config.locale = 'pt-BR'

    # sql = "SELECT * from EstiloBalada;"
    # @result = @connection.connection.execute(sql)

# CREATE TABLE `AvaliacaoBalada` (
#   `idAvaliacao` int(11) NOT NULL AUTO_INCREMENT,
#   `idBalada` int(11) DEFAULT NULL,
#   `idUsuario` int(11) DEFAULT NULL,
#   `comentario` varchar(45) DEFAULT NULL,
#   `nota` varchar(45) DEFAULT NULL,
#   `dataHora` datetime DEFAULT NULL,
#   PRIMARY KEY (`idAvaliacao`),
#   KEY `fkBalada_idx` (`idBalada`),
#   KEY `fkUsuario_idx` (`idUsuario`),
#   CONSTRAINT `fkBalada` FOREIGN KEY (`idBalada`) REFERENCES `Balada` (`idCadastro`) ON DELETE NO ACTION ON UPDATE NO ACTION,
#   CONSTRAINT `fkUsuario2` FOREIGN KEY (`idUsuario`) REFERENCES `Usuario` (`idCadastro`) ON DELETE NO ACTION ON UPDATE NO ACTION
# ) ENGINE=InnoDB DEFAULT CHARSET=utf8

# CREATE TABLE `CheckIn` (
#   `idCheckIn` int(11) NOT NULL AUTO_INCREMENT,
#   `idUsuario` int(11) DEFAULT NULL,
#   `idFesta` int(11) DEFAULT NULL,
#   `dataHora` datetime DEFAULT NULL,
#   PRIMARY KEY (`idCheckIn`),
#   KEY `idCadastro_idx` (`idUsuario`),
#   KEY `idFesta_idx` (`idFesta`),
#   CONSTRAINT `fkCadastro2` FOREIGN KEY (`idUsuario`) REFERENCES `Usuario` (`idCadastro`) ON DELETE NO ACTION ON UPDATE NO ACTION,
#   CONSTRAINT `fkFesta2` FOREIGN KEY (`idFesta`) REFERENCES `Festa` (`idFesta`) ON DELETE NO ACTION ON UPDATE NO ACTION
# ) ENGINE=InnoDB DEFAULT CHARSET=utf8;

    15.times do |n|
      @idFesta = rand(1..150)
      10.times do |n|
        @idUsuario = rand(16..1000)
        @dataHora = Faker::Time.between(10.days.from_now, 30.days.from_now).to_formatted_s(:db)
        sql = "INSERT INTO CheckIn(idFesta, idUsuario, dataHora)
                                  VALUES (#{@idFesta}, #{@idUsuario}, '#{@dataHora}');"
        @result = @connection.connection.insert(sql)
      end
    end

    # sql = "SELECT * from Festa"
    # @result = @connection.connection.execute(sql)
    # puts @result
    # puts 'PUTS'
    # puts @result.first
    # puts 'PUTS'
  end
end
