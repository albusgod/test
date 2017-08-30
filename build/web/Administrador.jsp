<%-- 
    Document   : newjsp2
    Created on : 31-05-2017, 0:23:31
    Author     : Cristian
--%>
<%@page import="entidades.Empleado" %>
<%@page import="java.util.ArrayList" %>
<%@page import="mante.EmpleBD" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <title>IMPRESIÓN DE TICKETS </title>
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
        <script language="JavaScript"> 
            function cerrarSesion(){ 
                    
                    window.open("index.jsp"); 
                    
            } 
        </script> 
        <style> 
            body
            {
                background: url('img/admin.jpg') fixed;
                background-size: cover;
                padding: 0;
                margin: 0;
            }
            
            .wrap
            {
                width: 100%;
                height: 100%;
                min-height: 100%;
                position: absolute;
                top: 0;
                left: 0;
                z-index: 99;
            }
            p.form-title
            {
                font-family: 'Open Sans' , sans-serif;
                font-size: 45px;
                font-weight: 600;
                text-align: center;
                color: #FFFFFF;
                margin-top: 5%;
                text-transform: uppercase;
                letter-spacing: 4px;
            }
            form
            {
                width: 250px;
                margin: 0 auto;
            }

            form.login input[type="text"], form.login input[type="password"]
            {
                width: 100%;
                margin: 0;
                padding: 5px 10px;
                background: 0;
                border: 0;
                border-bottom: 1px solid whitesmoke;
                outline: 0;
                font-style: italic;
                font-size: 30px;
                font-weight: 400;
                letter-spacing: 1px;
                margin-bottom: 5px;
                color: white;
                outline: 0;
            }
            
            form.login input[type="submit"]
            {
                width: 100%;
                font-size: 25px;
                text-transform: uppercase;
                font-weight: 500;
                margin-top: 16px;
                outline: 0;
                cursor: pointer;
                letter-spacing: 1px;
            }

            form.login input[type="submit"]:hover
            {
                transition: background-color 0.5s ease;
            }

            form.login .remember-forgot
            {
                float: left;
                width: 100%;
                margin: 10px 0 0 0;
            }
            form.login .forgot-pass-content
            {
                min-height: 20px;
                margin-top: 10px;
                margin-bottom: 10px;
            }
            form.login label, form.login a
            {
                font-size: 10x;
                font-weight: 400;
                color: #FFF;
            }

            form.login a
            {
                transition: color 0.5s ease;
            }

            form.login a:hover
            {
                color: #2ecc71;
            }

            .pr-wrap
            {
                width: 100%;
                height: 100%;
                min-height: 100%;
                position: absolute;
                top: 0;
                left: 0;
                z-index: 999;
                display: none;
            }

            .show-pass-reset
            {
                display: block !important;
            }

            .pass-reset
            {
                margin: 0 auto;
                width: 250px;
                position: relative;
                margin-top: 22%;
                z-index: 999;
                background: #FFFFFF;
                padding: 20px 15px;
            }

            .pass-reset label
            {
                font-size: 12px;
                font-weight: 400;
                margin-bottom: 15px;
            }

            

            .pass-reset input[type="submit"]
            {
                width: 100%;
                border: 0;
                font-size: 25px;
                text-transform: uppercase;
                font-weight: 500;
                margin-top: 10px;
                outline: 0;
                cursor: pointer;
                letter-spacing: 1px;
            }

            .pass-reset input[type="submit"]:hover
            {
                transition: background-color 0.5s ease;
            }
            .posted-by
            {
                position: absolute;
                bottom: 26px;
                margin: 0 auto;
                color: #FFF;
                background-color: rgba(0, 0, 0, 0.66);
                padding: 10px;
                left: 45%;
            }
            section { position: relative; } 
            #izquierda { 
                position: relative;
                width: 50%; 
                top: 0; 
                left: 0;     
                float: left; 
                height: 200px;
            } 
            #centro { 
                position: relative;
                width: 50%; 
                top: 0; 
                left: 0;     
                float: right; 
                height: 200px;
            } 
            #derecha { 
                position: relative; 
                width: 50%; 
                top: 0; 
                right: 0; 
                <%--background: #ddf;--%> 
                float: right; 
                height: 200px; 
            } 
            .esqinfder { 
                position: absolute; 
                bottom: 5px; 
                right: 5px; 
                background: #ff0; 
            } 
            table, th, td {
                border: 3px solid #ddd;
            }
            input[type=number] {
                -moz-appearance: textfield;
            }
            select{
                
                width: 250px;
                padding: 10px 15px;
                border: #000000;
                border-radius: 12px;
                background-color: #ddd;
                font-size: larger;
            }

        </style>
    </head>
    
        <% 
            String error = "";
            error = request.getParameter("error");
        %>
        <%
            String user = "";
            String usu=""; 
            try{
                usu = (String)session.getAttribute("val");
                user =(String)session.getAttribute("opc");
                if(user.equals(""))
                {
                    response.sendRedirect("index.jsp");
                }
            
            }catch(Exception ex)
            {
                response.sendRedirect("error.jsp?error= "+ex);
            }
         
        %>
    <%--<div class="container">
            <div class="row">
                <div class="col-md-12">
                    <div class="pr-wrap">
                        <div class="pass-reset">
                            
                            
                            <input type="submit" value="Submit" class="pass-reset-submit btn btn-success btn-sm" required="" />
                        </div>
                    </div>
                    <div class="wrap">                       
                        <form class="login" action="Ingresar">
                            <input name="txtIdentificador" type="text" placeholder="Ingresa tu ID" required=""/>
                            <input name="txtClaveEmp" type="password" placeholder="Clave" required=""/>
                            <input name="btnImprimirTicket" type="submit" value="Ingreso" class="btn btn-success btn-sm" >                             
                        </form>                        
                </div>
                        
            </div>
    </div>--%>
            <div class="row">
                <div class="col-mod-6">
                    <p class="form-title">Menú Administrador</p>
                </div>
            </div>
            
            <%--Acá rescataré la sesion onclick="location='TicketAdmin?btnImprimirTicketAdmin=cerrar'"--%>
                <div>
                    <i class="fa fa-user-circle" style="font-size:36px;"></i> Bienvenido: <a><%=usu%></a>
                    <input type="button" onclick="cerrarSesion()" value="Cerrar Sesión" name="boton" class="btn btn-success btn-sm"/> 
                </div>
                
            
           
                <section> 
                    <div class="col-mod-6">
                        <table <div id="izquierda"></div>
                            <tr>
                                <th>
                                    <form class="login"  action="TicketAdmin" method="post">
                                        <label>Imprime tu Ticket acá:</label><br>
                                        <input name="btnImprimirTicketAdmin" type="submit" value="Imprimir Ticket" class="btn btn-success btn-lg">
                                        <input type="text" name="txtIdEmpleado" value="<%=user%>" hidden=""/>
                                    </form> 
                                </th>                                   
                            </tr>
                        </table>                      
                    </div>
                    <div class="col-mod-4">
                        <table <div id="derecha"></div>
                            <tr>
                                <th>
                                    <form class="login"  action="TicketReunion" method="post">
                                        <h3><label> Seleccione el Ticket a Imprimir:</label></h3> 
                                        <input name="btnReu" type="submit" value="Reuniones" class="btn btn-success btn-sm" > 
                                        <input type="text" name="txtIdEmpleado" value="<%=user%>" hidden=""/>
                                    </form> 
                                </th>                                   
                            </tr>
                        </table>                      
                    </div>
                    <div class="col-mod-4">
                        <table <div id="centro"></div>
                            <tr>
                                <th>
                                    <form class="login"  action="TicketVisitas" method="post">
                                        <h3><label> Seleccione el Ticket a Imprimir:</label></h3>                                                                              
                                        <input name="btnVis" type="submit" value="Visitas" class="btn btn-success btn-sm" >
                                        <input type="text" name="txtIdEmpleado" value="<%=user%>" hidden=""/>
                                    </form> 
                                </th>                                   
                            </tr>
                        </table>                      
                    </div> 
            </section> 
            
            
            
    
</html>

