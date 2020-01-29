
package com.empresa.proyecto.controlador;

import com.empresa.proyecto.clases.celularesDTO;
import com.empresa.proyecto.clases.conexion;
import com.empresa.proyecto.clases.datosDTO;
import com.empresa.proyecto.clases.nexusDTO;
import com.empresa.proyecto.clases.usuarioDTO;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.HashSet;
import java.util.List;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.validation.Valid;
import org.springframework.dao.DataAccessException;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.ResultSetExtractor;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.web.authentication.logout.SecurityContextLogoutHandler;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.support.SessionStatus;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class controladorPrincipal {
    private JdbcTemplate plantillaJDBC;
    
    public controladorPrincipal(){
        conexion xcon = new conexion();
        this.plantillaJDBC =  new JdbcTemplate(xcon.conexion());
    }
    
    @RequestMapping(value="listado")
    public ModelAndView listado(){
        ModelAndView mvc = new ModelAndView();
        String sql = "SELECT * FROM nexus";
        List datos = this.plantillaJDBC.queryForList(sql);
        mvc.addObject("datos", datos);
        mvc.setViewName("listado");
        return mvc;
    }
    
    @RequestMapping (value = "resultado")         
    public ModelAndView buscar(HttpServletRequest buscar){
        ModelAndView mvc = new ModelAndView();
        String modelo = buscar.getParameter("buscar");
        String sql="SELECT * FROM nexus WHERE nombres LIKE '%"+modelo+"%'";
        List datos = this.plantillaJDBC.queryForList(sql);
        mvc.addObject("datos",datos);
        mvc.setViewName("resultado");
        return mvc;
    }
    
    @RequestMapping (value="agregar", method=RequestMethod.GET)
    public ModelAndView agregar(){
        ModelAndView mvc = new ModelAndView();
        mvc.addObject("datos", new nexusDTO());
        mvc.setViewName("agregar");
        return mvc;
    }
    
    @RequestMapping (value="agregar", method=RequestMethod.POST)
    public ModelAndView agregar
        (
                @Valid
                @ModelAttribute("datos") nexusDTO d,
                BindingResult result,
                SessionStatus status
        )
    {
        if(result.hasErrors()){
            ModelAndView mav = new ModelAndView("agregar");
            return mav;
        } else {
        this.plantillaJDBC.update("insert into nexus (nombres,direccion,telefono,correo, ubicacion) "
                + "values (?,?,?,?,?)",
                d.getNombres(),d.getDireccion(),d.getTelefono(),d.getCorreo(), d.getUbicacion());
        return new ModelAndView("redirect:/listado.htm");
        }
    }
    
    //usuarios, encargados seleccion de usuarios del logeo
    public datosDTO seleccionarUsuario(int id){
        final datosDTO datos = new datosDTO();
        String consulta = "SELECT * FROM datos WHERE codigo="+id;
        return (datosDTO) plantillaJDBC.query
        (
                consulta, new ResultSetExtractor<datosDTO>(){
                    public datosDTO extractData(ResultSet rs) throws SQLException, DataAccessException{
                        if(rs.next()){
                            datos.setUsuario(rs.getString("usuario"));
                            datos.setClave(rs.getString("clave"));
                            datos.setNombres(rs.getString("nombres"));
                            datos.setDireccion(rs.getString("direccion"));
                            datos.setTelefono(rs.getString("telefono"));
                            datos.setCorreo(rs.getString("correo"));
                            datos.setSexo(rs.getString("sexo"));
                        }
                        return datos;
                    }
                }
        );
    }
    public nexusDTO seleccionarCelular(int id){
        final nexusDTO datos = new nexusDTO();
        String consulta = "SELECT * FROM nexus WHERE codigo="+id;
        return (nexusDTO) plantillaJDBC.query
        (
                consulta, new ResultSetExtractor<nexusDTO>(){
                    public nexusDTO extractData(ResultSet rs) throws SQLException, DataAccessException{
                        if(rs.next()){
                            datos.setNombres(rs.getString("nombres"));
                            datos.setDireccion(rs.getString("direccion"));
                            datos.setTelefono(rs.getString("telefono"));
                            datos.setCorreo(rs.getString("correo"));
                            datos.setUbicacion(rs.getString("ubicacion"));
                        }
                        return datos;
                    }
                }
        );
    }
    
    @RequestMapping(value="editar", method=RequestMethod.GET)
    public ModelAndView editar(HttpServletRequest request){
        ModelAndView mav = new ModelAndView();
        int id = Integer.parseInt(request.getParameter("id"));
        nexusDTO datos = this.seleccionarCelular(id);
        mav.addObject("datos", new nexusDTO(id,datos.getNombres(),datos.getDireccion(),
                datos.getTelefono(),datos.getCorreo(), datos.getUbicacion()));
        mav.setViewName("editar");
        return mav;
    }
    
    @RequestMapping(value="editar", method=RequestMethod.POST)
    public ModelAndView editar(
                @Valid
                @ModelAttribute("datos") nexusDTO d,
                BindingResult result,
                SessionStatus status,
                HttpServletRequest request
    ){
        if(result.hasErrors()){
            ModelAndView mav = new ModelAndView("editar");
            return mav;
        } else {
        
        int id = Integer.parseInt(request.getParameter("id"));
        this.plantillaJDBC.update("UPDATE nexus "
                + "SET nombres=?,"
                + "direccion=?,"
                + "telefono=?,"
                + "correo=?,"
                + "ubicacion=?"
                + "WHERE codigo=?",
                d.getNombres(),d.getDireccion(),
                d.getTelefono(),d.getCorreo(),d.getUbicacion(),id);
        return new ModelAndView("redirect:/listado.htm");
        }
    }
    
    @RequestMapping (value = "eliminar", method=RequestMethod.GET)         
    public ModelAndView eliminar(HttpServletRequest eliminar){
        ModelAndView mvc = new ModelAndView();
        int id = Integer.parseInt(eliminar.getParameter("id"));
        
        String consulta = "DELETE FROM nexus WHERE codigo="+id;
        this.plantillaJDBC.execute(consulta);
        return new ModelAndView("redirect:/listado.htm");
    }
    
    //Spring Security Login
    @RequestMapping(value="salir", method = RequestMethod.GET)
    public String logoutPage (HttpServletRequest request, HttpServletResponse response){
        Authentication auth = SecurityContextHolder.getContext().getAuthentication();
        if(auth != null){
            new SecurityContextLogoutHandler().logout(request, response, auth);
        }
        return "redirect:/index.htm";
    }
    
    @RequestMapping(value = "acceso-denegado", method = RequestMethod.GET)
    public ModelAndView accessDenied(){
        Object principal = SecurityContextHolder.getContext().getAuthentication().getPrincipal();
        UserDetails userDetails = null;
        if (principal instanceof UserDetails){
            userDetails = (UserDetails) principal;
        }
        String usuarioLogin = userDetails.getUsername();
        
        ModelAndView model = new ModelAndView();
        model.addObject("usuario", usuarioLogin);
        model.setViewName("acceso-denegado");
        return model;
    }
    
    @RequestMapping(value = "login", method = RequestMethod.GET)
    public String login(ModelMap model){
        return "login";
    }
    
    @RequestMapping(value = "error-login.htm", method = RequestMethod.GET)
    public ModelAndView loginError(){
        ModelAndView mvc = new ModelAndView();
        mvc.setViewName("error-login");
        return mvc;
    }
    
    @RequestMapping(value="listadousuario")
    public ModelAndView listadousuario(){
        ModelAndView mvc = new ModelAndView();
        String sql = "SELECT u.CODIGO, u.PASSWORD,u.USERNAME, r.ROLENAME  FROM usuarios u, roles r WHERE u.codigo = r.codigo_usuario";
        List datos = this.plantillaJDBC.queryForList(sql);
        mvc.addObject("datos", datos);
        mvc.setViewName("listadousuario");
        return mvc;
    }
    @RequestMapping (value="agregarusuario", method=RequestMethod.GET)
    public ModelAndView agregarusuario(){
        ModelAndView mvc = new ModelAndView();
        mvc.addObject("datos", new datosDTO());
        mvc.setViewName("agregarusuario");
        return mvc;
    }
    
    @RequestMapping (value="agregarusuario", method=RequestMethod.POST)
    public ModelAndView agregarusuario
        (
                @Valid
                @ModelAttribute("datos") datosDTO d,
                BindingResult result,
                SessionStatus status
        )
    {
       
        this.plantillaJDBC.update("insert into usuarios (username,password,enabled) "
                + "values (?,?,1)",
                d.getUsuario(),d.getClave());
        String sql = "SELECT CODIGO FROM usuarios WHERE username='"+d.getUsuario()+"'";
       String firstName = plantillaJDBC.queryForObject(sql, String.class);
       
        this.plantillaJDBC.update("insert into roles (codigo_usuario,rolename) "
                + "values (?,?)",
                firstName,d.getNombres());
        return new ModelAndView("redirect:/listadousuario.htm");      
    }
        
    public usuarioDTO seleccionarUsuario2(int id){
        final usuarioDTO datos = new usuarioDTO();
        String consulta = "SELECT u.USERNAME,u.PASSWORD, r.ROLENAME  FROM usuarios u, roles r WHERE u.codigo = r.codigo_usuario AND codigo="+id;
        return (usuarioDTO) plantillaJDBC.query
        (
                consulta, new ResultSetExtractor<usuarioDTO>(){
                    public usuarioDTO extractData(ResultSet rs) throws SQLException, DataAccessException{
                        if(rs.next()){
                            datos.setUsername(rs.getString("USERNAME"));
                            datos.setPassword(rs.getString("PASSWORD"));
                            datos.setRolename(rs.getString("ROLENAME"));
                        }
                        return datos;
                    }
                }
        );
    }
        
    @RequestMapping(value="editarusuario", method=RequestMethod.GET)
    public ModelAndView editarusuario(HttpServletRequest request){
        ModelAndView mav = new ModelAndView();
        int id = Integer.parseInt(request.getParameter("id"));
        usuarioDTO datos = this.seleccionarUsuario2(id);
        mav.addObject("datos", new usuarioDTO(id,datos.getUsername(),datos.getPassword(),datos.getRolename()));
        mav.setViewName("editarusuario");
        return mav;
    }
    
    @RequestMapping(value="editarusuario", method=RequestMethod.POST)
    public ModelAndView editarusuario(
                @ModelAttribute("datos") usuarioDTO d,
                BindingResult result,
                SessionStatus status,
                HttpServletRequest request
    ){
        int id = Integer.parseInt(request.getParameter("id"));
        this.plantillaJDBC.update("UPDATE usuarios "
                + "SET username=?,"
                + "password=?"
                + " WHERE codigo=?",
                d.getUsername(),d.getPassword(),id);
        this.plantillaJDBC.update("UPDATE roles "
                + "SET rolename=?"
                + " WHERE codigo_usuario=?",
                d.getRolename(),id);
        return new ModelAndView("redirect:/listadousuario.htm");
    } 
    @RequestMapping (value = "eliminarusuario", method=RequestMethod.GET)         
    public ModelAndView eliminarusuario(HttpServletRequest eliminar){
        ModelAndView mvc = new ModelAndView();
        int id = Integer.parseInt(eliminar.getParameter("id"));
        
        String consulta = "DELETE FROM usuarios WHERE codigo="+id;
        this.plantillaJDBC.execute(consulta);
        String consulta2 = "DELETE FROM roles WHERE codigo_usuario="+id;
        this.plantillaJDBC.execute(consulta2);
        return new ModelAndView("redirect:/listadousuario.htm");
    }
}
