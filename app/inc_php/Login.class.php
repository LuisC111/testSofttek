<?php
    require_once 'ConexionesBD.class.php';
    session_start();
    date_default_timezone_set('America/Bogota');
    class Login
    {
     
        private static $instancia;
        private $dbh;
     
        private function __construct()
        {
     
            $this->dbh = ConexionesBD::conexion();
     
        }
     
        public static function login()
        {
     
            if (!isset(self::$instancia)) {
     
                $miclase = __CLASS__;
                self::$instancia = new $miclase;
     
            }
     
            return self::$instancia;
     
        }
    
        public function login_users($correo,$pass)
        {
            
            try {
                
                $sql = "SELECT * from usuario WHERE correoUsuario = ? AND passUsuario = ?";
                $query = $this->dbh->prepare($sql);
                $query->bindParam(1,$correo);
                $query->bindParam(2,$pass);
                $query->execute();
                $this->dbh = null;
     
                //si existe el usuario
                if($query->rowCount() == 1)
                {
                     
                    $fila  = $query->fetch();
                    $_SESSION['id'] = $fila['idUsuario']; 
                    $_SESSION['cedula'] = $fila['cedulaUsuario'];       
                    $_SESSION['correo'] = $fila['correoUsuario'];   
                    $_SESSION['rol'] = $fila['idRol'];    
                    $_SESSION['nombre'] = $fila['nombreUsuario'];         
                    $_SESSION['apellido'] = $fila['apellidoUsuario']; 
                    $_SESSION['pass'] = $fila['passUsuario'];
                    return true;
        
                }
                
            }catch(PDOException $e){
                
                return false;
                
            }        
            
        }


        public function registro_users($cedula,$nombre,$apellido,$correo,$pass)
        {
            
            try {
                
                $sql = "INSERT INTO usuario (cedulaUsuario,nombreUsuario,apellidoUsuario,correoUsuario,passUsuario,fechaRegistro,idRol)";
                $sql .= " VALUES ( ";
                $sql .= " :cedula,:nombre,:apellido,:correo,:pass,:fechaRegistro,:rol)";
                $query = $this->dbh->prepare($sql);
                $params = array(
                    ':cedula' => $cedula,
                    ':nombre' => $nombre,
                    ':apellido' => $apellido,
                    ':correo' => $correo,
                    ':pass' => $pass,
                    ':fechaRegistro' => date("Y-m-d H:i:s"),
                    ':rol' => '1'
                );
                $query->execute($params);
                $this->dbh = null;
                //Validar si se inserto correctamente
                if($query->rowCount() == 1)
                {
                    $_SESSION['correo'] = $correo;   
                    return true;
                }else{
                    return false;
                }
                

                
            }catch(PDOException $e){
                
                return false;
                
            }        
            
        }

        public function editar_users($cedula,$nombre,$apellido,$correo,$pass)
        {

            try {
                
                $sql = "UPDATE usuario SET nombreUsuario = :nombre, apellidoUsuario = :apellido, correoUsuario = :correo, passUsuario = :pass WHERE cedulaUsuario = :cedula";
                $query = $this->dbh->prepare($sql);
                $params = array(
                    ':cedula' => $cedula,
                    ':nombre' => $nombre,
                    ':apellido' => $apellido,
                    ':correo' => $correo,
                    ':pass' => $pass
                );
                $query->execute($params);
                $this->dbh = null;
                //Validar si se inserto correctamente
                if($query->rowCount() == 1)
                {
                    $_SESSION['correo'] = $correo;   
                    return true;
                }else{
                    return false;
                }
                

                
            }catch(PDOException $e){
                
                return false;
                
            }        
            
        }

      
        
        public function cerrar_sesion()
        {
            session_destroy();
            header("Location: ../../index.php");
        }
     
    
        
    
    
 
        // Evita que el objeto se pueda clonar
        public function __clone()
        {
     
            trigger_error('La clonación de este objeto no está permitida', E_USER_ERROR);
     
        }
 
    }
?>