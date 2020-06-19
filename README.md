# README

Esta é uma aplicação API only feita em Rails 6 para cadastro de Cursos, videos e relaciona-los. 

# Funcionamento

Parâmetros obrigatórios:
  username -> nome do usuário (admin habilitado por padrão).
  password -> senha de administrador

UserAPI::API => '/v1/user/' -> Usuário 
  '/new' -> Novo usuário. Parametros: new_username => novo nome do usuário, new_user_password => nova senha.
  
CourseResourceAPI::API => '/v1/course_resource/' -> Cursos.
  '/new' -> Novo curso. Parametros: name => novo nome do curso, description => descrição do curso, author => autor do curso.
  '/list' -> Mostra a lista de usuários. Parametros: page_size => tamanho da página, page_number => número de páginas, tipo de ordenação => aceita "name", para ordenar por nome e "created_at" para ordenar por criação. 
  
VideoResourceAPI::API => '/v1/video_resource/' -> Videos.
  '/new' -> Novo curso. Parametros: name => novo nome do video, description => descrição do video, url => url do video.
    
VideoCourseAPI::API => '/v1/video_course/' -> Integrar cursos com vídeos
  '/new' -> Nova relação entre video e curso. Parametros: new_username => novo nome do usuário, new_user_password => nova senha.

PS: Tentei usar uma gem (doorkeeper) para criar a autenticação e não funcionou bem em uma aplicação API only. Perdi muito tempo tentado adaptar, mas não funcionou como deveira. Acabei fazendo uma por mim mesmo. 
