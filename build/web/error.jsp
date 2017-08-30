<%-- 
    Document   : Index1
    Created on : 26-05-2017, 19:36:57
    Author     : Cristian
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="REFRESH" content="2; URL=index.jsp"> <%--Esta linea devuelve automaticamente a Index despues de x seg--%>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <title>IMPRESIÓN DE TICKETS </title>
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
        <style> 
            body
            {
                background: url('img/index.jpg') fixed;
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
    font-size: 12px;
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

.pass-reset input[type="email"]
{
    width: 100%;
    margin: 5px 0 0 0;
    padding: 5px 10px;
    background: 0;
    border: 0;
    border-bottom: 1px solid #000000;
    outline: 0;
    font-style: italic;
    font-size: 12px;
    font-weight: 400;
    letter-spacing: 1px;
    margin-bottom: 5px;
    color: #000000;
    outline: 0;
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
        </style>>
    </head>
    <body>
        <% 
            String error = " ";
            error = request.getParameter("error");
        %>
        <div class="container">
            <div class="row">
                <div class="col-md-12">
                    <div class="pr-wrap">
                        <div class="pass-reset">
                            
                            
                            <input type="submit" value="Submit" class="pass-reset-submit btn btn-success btn-sm" required="" />
                        </div>
                    </div>
                    <div class="wrap">
                        <p class="form-title">
                            Impresión Ticket Colación</p>
                        <form class="login" action="Ingresar">
                            <input name="txtIdentificador" type="text" placeholder="Ingresa tu ID" required=""/>
                            <input name="txtClaveEmp" type="password" placeholder="Clave" required=""/>
                            <input name="btnImprimirTicket" type="submit" value="Ingreso" class="btn btn-success btn-sm" > 
                            <label> <h1><%=error%></h1></label>
                             
                             <%--<input type="text" name="lblError" value="" />-->
                            
                            <%-- AQUI COMIENZA MODAL
                            <div class="container">
                            
                            <!-- Trigger the modal with a button -->
                           <!-- <input name="btnImprimirTicket" type="submit" value="IMPRIMIR TICKET" class="btn btn-success btn-sm" required="" data-toggle="modal" data-target="#myModal" >
                            <!--<button type="submit" class="btn btn-info btn-lg" data-toggle="modal" data-target="#myModal">Open Modal</button>

                            <!-- Modal -->
                            <div class="modal fade" id="myModal" role="dialog">
                              <div class="modal-dialog">

                                <!-- Modal content-->
                                <div class="modal-content">
                                  <div class="modal-header">
                                      <button type="submit" class="close" data-dismiss="modal">&times;</button>
                                    
                                    <!--<h4 class="modal-title">Modal Header</h4>-->
                                  </div>
                                  <div class="modal-body center-block">
                                    <p>Tu ticket fue imprimido.</p>
                                  </div>
                                  <div class="modal-footer">
                                      <button type="submit" class="btn btn-default" data-dismiss="modal">Close</button>
                                  </div>
                                </div>

                              </div>
                            </div>

                          </div>
                            <!--ACÁ TERMINA MODAL --> --%>
                        </form>
                        
                    </div>
                </div>
            </div>
                            <div class="posted-by">© 2017 Masters - TI. Derechos Reservados.  <%--<a href="http://www.jquery2dotnet.com">Bhaumik Patel</a>--%> </div>
            
            
        </div>
    </body>
</html>

