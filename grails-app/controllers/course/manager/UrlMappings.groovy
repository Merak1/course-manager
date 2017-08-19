package course.manager

class UrlMappings {

    static mappings = {
        "/$controller/$action?/$id?(.$format)?" {
            constraints {
                // apply constraints here
            }
        }

        "/"(view: "/index")
        "500"(view: '/error')
        "404"(view: '/notFound')

        "/cursos/"(controller: "course", action: "courses")
        "/cursos/$idCurso/lecciones/"(controller: "course", action: "lessons")
        "/cursos/$idCurso/informacion/"(controller: "course", action: "info")
        "/cursos/$idCurso/lecciones/teoria/"(controller: "course", action: "theory")
        "/cursos/$idCurso/lecciones/bienvenida/"(controller: "course", action: "welcome")
        "/cursos/$idCurso/lecciones/$idLeccion/"(controller: "course", action: "getLesson")

    }
}