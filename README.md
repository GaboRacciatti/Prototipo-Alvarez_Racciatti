# Prototipo de Gestión Empresarial
## Descripción
Esta aplicación es un prototipo de gestión empresarial desarrollado en Flutter. Permite administrar empleados, trabajos, visualizar sus perfiles, editar información básica y gestionar las configuraciones del sistema, como el tema (claro/oscuro).
## Características principales
* Listado de empleados: Visualiza la lista completa de empleados con sus roles y estados.
* Listado de trabajos: Visualiza una lista de trabajos finalizados
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
5. Lista de Trabajos Realizados
Incluye: 
 * Icon segun puesto
 * Informacion del trabajo (Nombre empleado, Puesto empleado, Descripcion trabajo)
6. Detalle de trabajos realizados:
Incluye:
 *Informacion: Descripcion, empleado a cargo, puesto
 * TextInput para comentario
 * Swith para marcar si esta finalizado
## Servicios
* API Mock: Se conecta a un endpoint ficticio para simular datos reales.
### Endpoints utilizados:
* https://66f2ca6e71c84d805876bcdb.mockapi.io/api/v1/Empleado
* https://66d9de7f4ad2f6b8ed564dbf.mockapi.io/Trabajos_Realizados

## Cómo ejecutar la aplicación
* Instalación de dependencias: Asegúrate de tener Flutter instalado y luego ejecuta:
```bash
  flutter pub get
```
Para ejecutar la aplicación en un dispositivo o emulador:

``` bash
flutter run
```
