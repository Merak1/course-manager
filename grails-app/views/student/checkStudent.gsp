<%@ page import="course.manager.Course" %>
<!DOCTYPE html>
<html>
<head>
    <meta name="layout" content="main"/>
    <link rel="stylesheet" type="text/css" href="//cdn.datatables.net/1.10.16/css/jquery.dataTables.css">
    <script type="text/javascript" charset="utf8" src="//cdn.datatables.net/1.10.16/js/jquery.dataTables.js"></script>
</head>

<body>
<div id="agregarCurso" class="modal fade" role="dialog">
    <div class="modal-dialog">
        <!-- Modal content-->
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal">&times;</button>
                <h4 class="modal-title">Agregar nuevo curso a ${student.name}</h4>
            </div>
            <g:if test="${!notAddedCourses}">
                <div class="modal-body">
                    <div class="form-group">
                        <p>Este estudiante ya tiene todos los cursos asignados</p>
                    </div>
                </div>

                <div class="modal-footer">
                    <button class="btn btn-primary" data-dismiss="modal">Cerrar</button>
                </div>
            </g:if>
            <g:else>
                <g:form action="addStudentToCourse">
                    <div class="modal-body">
                        <div class="form-group">
                            <label for="course">Selecciona un curso:</label>

                            <g:select name="course"
                                      from="${notAddedCourses}"
                                      optionKey="id"
                                      optionValue="name"/>
                            <input type="hidden" name="student" value="${student.id}">
                        </div>
                    </div>

                    <div class="modal-footer">
                        <button type="submit" class="btn btn-primary">Enviar</button>
                        <button class="btn btn-primary" data-dismiss="modal">Cerrar</button>
                    </div>
                </g:form>
            </g:else>
        </div>
    </div>
</div>

<div id="removerDeCurso" class="modal fade" role="dialog">
    <div class="modal-dialog">
        <!-- Modal content-->
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal">&times;</button>
                <h4 id="modalRemoveTitle" class="modal-title">Eliminar a ${student.name} del curso: </h4>
            </div>
            <g:form action="removeStudentFromCourse">
                <div class="modal-body">
                    <div class="form-group">
                        <label id="modalRemoveLabel">Seguro que quieres eliminar a ${student.name} del curso: </label>
                    </div>
                    <input type="hidden" name="student" value="${student.id}">
                    <input id="idRemoveCourse" type="hidden" name="course" value="#">
                </div>

                <div class="modal-footer">
                    <button type="submit" class="btn btn-primary">Eliminar</button>
                    <button class="btn btn-primary" data-dismiss="modal">Cerrar</button>
                </div>
            </g:form>
        </div>
    </div>
</div>

<div class="header" style="min-height: 400px; height: 400px;" ng-style="{'background-image':headerImage}">
    <div class="header-op">
        <div class="header-content">
            <div class="header-content-inner">
                <h1 id="homeHeading"
                    style="margin-top: 150px; color: #fff; font-family: 'Raleway', sans-serif; font-size: 50px; font-weight: bold;">CURSOS</h1>
                <hr>
            </div>
        </div>
    </div>
</div>
<section>
    <div class="container">
        <div class="container-fluid">
            <div class="row">
                <div class=" col-12 col-md-4 col-sm-6 " style="max-width: 60%" ;>
                    <img src="/assets/kobayashi.jpg" class="img-responsive " style="max-width: 100%;">
                </div>

                <div class="col-12 col-md-8 col-sm-6 ">
                    <h1 class="text-left">${student.name}<small>Nombre</small></h1>

                    <h2 class="text-left">${student.username}<small>Nombre de usuario</small></h2>

                    <h2 class="text-left">${student.description}<small>Descripción</small></h2>
                </div>
            </div><!--Div row-->
        </div><!--Container-fluid-->
    <!--Este div lo hice solo para que hubiera un espacio a la hora de hacerlo responsivo, si no te convence lo quito-->
        <div class="invisible">...</div>
        <!--Aquí empieza la tabla -->
        <div class="container-fluid ">
            <div class="row">
                <button class="btn btn-primary" data-toggle="modal"
                        data-target="#agregarCurso">Asignar Nuevo Curso</button>
                <table class="table ">
                    <thead>
                    <tr>
                        <th>ID</th>
                        <th>Nombre del curso</th>
                        <th>Acciones</th>
                    </tr>
                    </thead>
                    <tbody>
                    <g:if test="${courses}">
                        <g:each var="course" in="${courses}">
                            <tr>
                                <td>${course.id}</td>
                                <td>${course.name}</td>
                                <td>
                                    <div class="btn-toolbar">
                                        <g:link class="btn btn-primary" controller="courseManager" action="checkCourse"
                                                params="[id: course.id]">Ver Curso</g:link>
                                        <button class="btn btn-primary modalQuitarCurso" data-toggle="modal"
                                                data-target="#removerDeCurso">Quitar de Curso</button>
                                    </div>
                                </td>
                            </tr>
                        </g:each>
                    </g:if>
                    <g:else>
                        <tr>
                            <td align="center">No tiene ningun curso asignado <a data-toggle="modal"
                                                                                 data-target="#agregarCurso">Asignale uno</a>
                            </td>
                        </tr>
                    </g:else>
                    </tbody>
                </table>
            </div>
        </div>
    </div>
</section>
<g:javascript>
    $('.modalQuitarCurso').click(function () {
        var courseId = $(this).parent().parent().prev().prev().text()
        var courseName = $(this).parent().parent().prev().text()
        $('#idRemoveCourse').val(courseId)
        $('#modalRemoveTitle').append(courseName)
        $('#modalRemoveLabel').append(courseName)
    })
</g:javascript>
</body>
</html>