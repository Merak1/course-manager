<!DOCTYPE html>
<html>
<head>
    <meta name="layout" content="main"/>
    <script src="https://cdn.ckeditor.com/4.7.2/full-all/ckeditor.js"></script>
</head>

<body>
<header class="not-home">
    <div class="header-content">
        <div class="header-content-inner">
            <h1 id="homeHeading">Cursos</h1>
        </div>
    </div>
</header>
<section>
    <div class="container">
        <h2>Crear nuevo Curso</h2>

        <g:uploadForm action="createCourse" name="createCourse">

            <div class="form-group">
                <label>Nombre del Curso:</label>
                <input type="text" class="form-control" name="name">
            </div>

            <div class="form-group">
                <label>URL para uso en parametros:</label>
                <input type="text" class="form-control" name="url">
            </div>

            <div class="form-group">
                <label>Texto de descripcion del curso</label>
                <textarea name="descript"></textarea>
            </div>

            <div class="form-group">
                <label>Texto de Curso Finalizado</label>
                <textarea name="banner"></textarea>
            </div>

            <div class="form-group">
                <label>Texto de bienvenida</label>
                <textarea name="welcome"></textarea>
            </div>

            <div class="form-group">
                <label>Texto del boton de teoria:</label>
                <input type="text" class="form-control" name="theoryButton">
            </div>

            <div class="form-group">
                <label>Titulo de pagina de teoria:</label>
                <input type="text" class="form-control" name="theoryTitle">
            </div>

            <div class="form-group">
                <label>Texto de pagina de teoria</label>
                <textarea name="theory"></textarea>
            </div>

            <button type="submit" class="btn btn-primary">Enviar</button>
        </g:uploadForm>
    </div>
</section>

<asset:script type="text/javascript">
    CKEDITOR.plugins.addExternal( 'base64image', '/assets/base64image/', 'plugin.js' );
    CKEDITOR.replaceAll(function( textarea, config ) {
        config.extraPlugins = 'base64image';
    });

    $("#createCourse").validate({
        rules: {
            name: "required",
            url: "required",
            descript: "required",
            banner: "required",
            welcome: "required",
            theoryButton: "required",
            theoryTitle: "required",
            theory: "required"
        },
        messages: {
            name: "Por favor ingresa un Nombre",
            url: "Por favor ingresa una url",
            descript: "Por favor ingresa una Descripcion",
            banner: "Por favor ingresa una Descripcion",
            welcome: "Por favor ingresa una Descripcion",
            theoryButton: "Por favor ingresa una Descripcion",
            theoryTitle: "Por favor ingresa una Descripcion",
            theory: "Por favor ingresa una Descripcion"
        },
        submitHandler: function (form) {
            form.submit();
        }
    });
</asset:script>
</body>
</html>