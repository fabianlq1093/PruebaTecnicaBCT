--1.	Listar los nombres de los estudiantes cuyo apellido comience con la letra G. 

SELECT E.Nombre FROM Estudiante E
	WHERE  ltrim(substring(E.Nombre,charindex(' ',E.Nombre), CHARINDEX(' ',ltrim(SUBSTRING(E.Nombre,charindex(' ',E.Nombre),LEN(E.Nombre)-charindex(' ',E.Nombre)))) )) Like 'G%'

SELECT E.Nombre FROM Estudiante E
	WHERE E.PrimerApellido Like 'G%'

--2.	¿Quiénes son los autores del libro “Visual Studio Net”? Listar solamente los nombres.

SELECT A.Nombre FROM Autor A 
	INNER JOIN LibAut LA ON A.IdAutor = LA.IdAutor
	INNER JOIN Libro  L  ON L.IdLibro = LA.IdLibro
		WHERE L.Titulo = 'Visual Studio Net'

--3.	Listar los nombres de los estudiantes a los que se prestaron libros del área de “Base de Datos”.

SELECT DISTINCT E.Nombre FROM Estudiante E
	INNER JOIN Prestamo P ON E.IdLector = P.IdLector
	INNER JOIN Libro L ON L.IdLibro = P.IdLibro
		WHERE L.Area = 'Base de Datos'

--4.	Listar los títulos de los libros que debían devolverse el “10/04/2007”.

SELECT L.Titulo FROM Libro L
	INNER JOIN Prestamo P ON L.IdLibro = P.IdLibro
		WHERE P.FechaDevolucion = '2007-04-10'

--5.	Listar los datos de los estudiantes cuya edad es mayor al promedio.

SELECT E.IdLector, E.CI, E.Nombre, E.Direccion, E.Carrera, E.Edad, (SELECT AVG(C.Edad) FROM Estudiante C) AS EdadPromedio
	FROM ESTUDIANTE E
		WHERE E.Edad > (SELECT AVG(C.Edad) FROM Estudiante C)

--6.	Agrupar por título y editorial y a su vez mostrar la cantidad de estudiantes que posean préstamos de libros sin devolver.

SELECT L.Titulo, L.Editorial, COUNT(E.idLector) AS CantidadEstudiantes FROM Libro L 
	INNER JOIN Prestamo P ON P.idLibro = L.idLibro
	INNER JOIN Estudiante E ON P.idLector = E.idLector
	WHERE P.Devuelto = 0
		GROUP BY
			L.Titulo, L.Editorial

--7.	Listar los estudiantes que posean préstamos sin devolver de libros que tengan al menos un autor de nacionalidad “Costarricense”.

SELECT DISTINCT E.Nombre AS NombreEstudiante
	FROM Libro L 
		INNER JOIN Prestamo P	ON P.idLibro = L.idLibro
		INNER JOIN Estudiante E ON P.idLector = E.idLector
		INNER JOIN LibAut LA	ON LA.IdLibro = L.IdLibro
		INNER JOIN Autor A		ON LA.idautor = A.idAutor
		WHERE 
			P.Devuelto = 0
			AND A.Nacionalidad = 'Costarricense'


