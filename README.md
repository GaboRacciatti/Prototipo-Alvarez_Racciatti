# Prototipo de Gestión Empresarial
## Descripción
Esta aplicación es un prototipo de gestión empresarial desarrollado en Flutter. Permite administrar empleados, areas, visualizar sus perfiles, editar información básica y gestionar las configuraciones del sistema, como el tema (claro/oscuro).
## Características principales
* Listado de empleados: Visualiza la lista completa de empleados con sus roles y estados.
* Listado de areas: Visualiza una lista de areas de trabajo 
* Perfil de usuario: Muestra información detallada del perfil, con la posibilidad de editar datos básicos.
* Tema dinámico: Permite cambiar entre tema claro y oscuro mediante un interruptor.
* Interfaz intuitiva: Diseño moderno y fácil de usar, adaptado a diferentes dispositivos.

## Pantallas
1. HomeScreen
Pantalla principal que actúa como hub del sistema. Incluye:
  * Logo de la empresa.
  * Bienvenida al usuario.
  * Navegación a otras secciones mediante un Drawer.
2. Lista de Empleados
Muestra una lista con:
  * Nombre del empleado.
  * Puesto de trabajo.
  * Estado (activo o inactivo).
  *  Al tocar un registro, muestra la pantalla de Detalle del Empleado.
3. Detalle del Empleado
Incluye:
  * Avatar dinámico generado según el nombre.
  * Información personal (nombre, puesto, estado).
  * Campo de texto para agregar comentarios sobre el desempeño.
  * Botón para guardar información con confirmación mediante SnackBar.
4. Perfil del Usuario
Pantalla personalizada que incluye:
  * Avatar dinámico.
  * Información del usuario (nombre, email, ubicación).
  * Opción para cambiar entre tema claro y oscuro.
  * Botón de edición con confirmación.
5. Lista de Áreas
Incluye: 
 * Icon 
 * Informacion del área (Nombre, cantidad empleados, id de area)
6. Detalle del area:
Incluye:
 * Nombre del area, cantidad de empleados, id del area
 * TextInput para comentario
 * Swith para marcar si esta activa
 * Boton para guardar info
## Servicios
* API Mock: Se conecta a un endpoint ficticio para simular datos reales.
### Endpoints utilizados:
* https://api-express-2024.onrender.com/api/v1/Empleado
* https://api-express-2024.onrender.com/api/v1/area 

## Cómo ejecutar la aplicación
* Instalación de dependencias: Asegúrate de tener Flutter instalado y luego ejecuta:
```bash
  flutter pub get
```
Para ejecutar la aplicación en un dispositivo o emulador:

``` bash
flutter run
```
