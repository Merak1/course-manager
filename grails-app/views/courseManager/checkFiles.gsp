<!DOCTYPE html>
<html>
<head>
    <meta name="layout" content="main"/>
    <script src="https://cdn.ckeditor.com/4.7.2/full-all/ckeditor.js"></script>
    <link rel="stylesheet" type="text/css" href="//cdn.datatables.net/1.10.16/css/jquery.dataTables.css">
    <script type="text/javascript" charset="utf8" src="//cdn.datatables.net/1.10.16/js/jquery.dataTables.js"></script>
</head>

<body>
<div class="header" style="min-height: 400px; height: 400px;" ng-style="{'background-image':headerImage}">
    <div class="header-op">
        <div class="header-content">
            <div class="header-content-inner">
                <h1 id="homeHeading"
                    style="margin-top: 150px; color: #fff; font-family: 'Raleway', sans-serif; font-size: 50px; font-weight: bold;">Archivos de Lecciones</h1>
                <hr>
            </div>
        </div>
    </div>
</div>


<div class="modal fade" id="modalAgregarArchivo" role="dialog">
    <div class="modal-dialog">
        <div class="modal-content">

            <div class="modal-header">
                <h1>Subir nuevo Archivo</h1>
            </div>

            <g:uploadForm action="addFileToLesson" name="addLessonForm">
                <div class="modal-body">
                    <div class="form-group">
                        <label>Archivo:</label>
                        <input type="file" name="file" class="form-control">
                    </div>

                    <input type="hidden" name="lessonId" value="${lesson.id}">

                </div>

                <div class="modal-footer">
                    <button type="submit" class="btn btn-primary">Subir archivo</button>
                    <button type="button" class="btn btn-primary" data-toggle="modal"
                            data-target="#modalAgregarArchivo">Cerrar</button>
                </div>
            </g:uploadForm>

        </div>
    </div>

</div>

<div class="modal fade" id="modalQuitarArchivo" role="dialog">
    <div class="modal-dialog">
        <div class="modal-content">
            <g:form action="removeFileFromLesson">
                <input type="hidden" name="lessonId" value="${lesson.id}">
                <input type="hidden" name="lessonFileId" id="removeLessonFileId" value="#">

                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal">&times;</button>

                    <h3 class="modal-title text-center" id="titleRemoveLessonFile"></h3>
                </div>

                <div class="modal-footer">
                    <button type="submit" class="btn btn-primary">Si, quiero borrar.</button>
                    <button type="button" class="btn btn-primary" data-dismiss="modal">No, quiero seguir.</button>
                </div>
            </g:form>
        </div>
    </div>
</div>

<section>
    <div class="container">
        <div class="container-fluid">
            <div class="row">
                <div class="col-12 col-md-8 col-sm-6 ">
                    <h1 class="text-left">${lesson.name} <small>Leccion</small></h1>
                </div>
            </div>

            <div class="row text-center">
                <div class="btn-group">
                    <button type="button" id="botonModalCrearLeccion" data-toggle="modal"
                            data-target="#modalAgregarArchivo" class="btn btn-primary">Agregar nuevo Archivo</button>
                </div>
            </div>

            <div class="row">
                <!--Este div lo hice solo para que hubiera un espacio a la hora de hacerlo responsivo, si no te convence lo quito-->
                <div class="invisible">...</div>
                <!--Aquí empieza la tabla -->
                <div class="container-fluid ">
                    <table class="table table-responsive">
                        <thead>
                        <tr>
                            <th>Nombre</th>
                            <th>Link</th>
                            <th>Acciones</th>
                        </tr>
                        </thead>
                        <tbody>
                        <g:if test="${lessonFiles}">
                            <g:each var="file" in="${lessonFiles}">
                                <tr>
                                    <td>${file.name}</td>
                                    <td class="hidden">${file.id}</td>
                                    <td>
                                        <div class="btn-toolbar"><a download
                                                                    href="${file.fileURL}">Descargar Archivo</a></div>
                                    </td>
                                    <td>
                                        <div class="btn-toolbar">
                                            <button class="btn btn-primary modalQuitarArchivo" data-toggle="modal"
                                                    data-target="#modalQuitarArchivo">Borrar Archivo
                                            </button>
                                        </div>
                                    </td>
                                </tr>
                            </g:each>
                        </g:if>
                        <g:else>
                            <tr>
                                <td align="center">Esta leccion no tiene ningun archivo <a data-toggle="modal"
                                                                                           data-target="#modalCrearLeccion">Crea uno</a>
                                </td>
                            </tr>
                        </g:else>
                        </tbody>
                    </table>
                </div>
            </div><!--Div row-->
        </div><!--Container-fluid-->
    </div>
</section>
<g:javascript>


    $('.modalQuitarArchivo').click(function () {
        var lessonFileId = $(this).parent().parent().prev().prev().text()
        var lessonFile = $(this).parent().parent().prev().prev().prev().text()
        $('#removeLessonFileId').val(lessonFileId)
        $('#titleRemoveLessonFile').text("¿Estás seguro de querer borrar el archivo: " + lessonFile + "?")
    })

</g:javascript>
</body>
</html>
