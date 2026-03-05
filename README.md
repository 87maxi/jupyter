# Jupyter Notebooks de Referencia para Desarrollo Multilenguaje

Este proyecto es una biblioteca de conocimiento curada, presentada en formato de **Jupyter Notebooks**, diseñada para servir como una referencia rápida y exhaustiva para desarrolladores. Cubre la sintaxis, los patrones de diseño y los conceptos avanzados de varios lenguajes de programación modernos.

El entorno está construido sobre una imagen Docker personalizada basada en Debian 12, con kernels de Jupyter y soporte para **autocompletado avanzado (LSP)** para una experiencia de desarrollo de primer nivel.

---

## 📚 Biblioteca de Notebooks de Referencia

La colección de notebooks se encuentra en el directorio [`./note/`](./note/) y está organizada por lenguaje. Cada sección está diseñada para ser un recurso práctico y completo.

### 🐍 Python
Una guía completa que abarca desde los fundamentos hasta la concurrencia y la metaprogramación.
- **Referencia de Sintaxis**: Tipos de datos, estructuras de control, comprensiones y OOP básica.
- **Estructuras de Datos**: Uso avanzado de listas, tuplas, diccionarios, sets y el módulo `collections`.
- **Funciones y Programación Funcional**: `*args`, `**kwargs`, `lambda`, `map`, `filter`, `reduce` y decoradores.
- **OOP Avanzada**: Métodos mágicos (`dunder`), propiedades, clases abstractas y mixins.
- **Manejo de Errores y Context Managers**: Patrones con `try/except` y la sentencia `with`.
- **Iteradores, Generadores y Decoradores**: Conceptos avanzados para código eficiente y modular.
- **Concurrencia**: Guía sobre `threading`, `multiprocessing` y `asyncio`, y el impacto del GIL.
- **Palabras Reservadas**: Referencia completa de todas las palabras clave y su uso.

### 🦀 Rust
Una inmersión profunda en el lenguaje de sistemas conocido por su seguridad y rendimiento.
- **Referencia de Sintaxis**: Variables, tipos de datos, ownership, borrowing y structs.
- **Módulos y Patrones**: Organización del código, visibilidad y patrones de diseño como Builder y Newtype.
- **Fechas, Errores y Macros**: Uso de `chrono`, manejo de errores idiomático con `Result` y macros declarativas.
- **Metaprogramación Avanzada**: Macros procedurales, `TokenStream` y AST.
- **Concurrencia Avanzada**: `Threads`, `channels`, `Mutex`, `Arc` y el modelo `async/await`.
- **Gestión de Memoria y Punteros**: El Stack, el Heap y los diferentes tipos de punteros (`&`, `Box`, `Rc`, `Arc`).
- **Palabras Reservadas**: Referencia completa de todas las palabras clave y su uso.

### 🐹 Go (Golang)
Guías centradas en la simplicidad, la eficiencia y el potente modelo de concurrencia de Go.
- **Referencia de Sintaxis**: Tipos, `structs`, `slices`, `maps` y control de flujo.
- **Módulos y Paquetes**: Gestión de proyectos con `go mod` y la regla de visibilidad (mayúsculas/minúsculas).
- **Structs, Métodos e Interfaces**: Composición, receptores de puntero y la implementación implícita de interfaces.
- **Concurrencia Avanzada**: `Goroutines`, `channels`, `select`, `sync.WaitGroup` y el paquete `context`.
- **Manejo de Errores**: Patrones con `defer`, `panic`, `recover` y el wrapping de errores.
- **Memoria y Punteros**: El `Garbage Collector`, `new` vs `make` y *escape analysis*.
- **Palabras Reservadas**: Referencia completa de todas las palabras clave y su uso.

### 💎 Ruby
Un recorrido por el lenguaje dinámico enfocado en la productividad y la elegancia de su sintaxis.
- **Referencia de Sintaxis**: Variables, tipos de datos, clases, módulos y la sintaxis de bloques.
- **OOP y Módulos**: Herencia, visibilidad (`public`, `private`), *mixins* (`include` vs `extend`) y *namespaces*.
- **Bloques, Procs y Lambdas**: El corazón de la programación funcional en Ruby y sus diferencias.
- **Manejo de Errores y Gemas**: Gestión de excepciones y el ecosistema de `RubyGems` y `Bundler`.
- **Metaprogramación y Reflexión**: `send`, `method_missing`, `define_method` y otros trucos de la "magia" de Ruby.
- **Concurrencia y Memoria**: El GVL, `Threads`, `Fibers`, `Ractors` (Ruby 3+) y el Garbage Collector.
- **Palabras Reservadas**: Referencia completa de todas las palabras clave y su uso.

### 💧 Elixir
Exploración del lenguaje funcional construido sobre la máquina virtual de Erlang (BEAM), diseñado para la concurrencia y la tolerancia a fallos.
- **Referencia de Sintaxis**: Inmutabilidad, *pattern matching*, el operador `|>` y tipos de datos.
- **Módulos y Funciones**: Cláusulas de función, guardas y funciones anónimas.
- **Control de Flujo y Recursión**: `case`, `cond`, `with` y la optimización de llamada de cola (TCO).
- **Procesos y Concurrencia**: El modelo de actores, `spawn`, `send`, `receive` y `links`.
- **Metaprogramación y Macros**: `quote`, `unquote` y el patrón `__using__`.
- **Errores, Behaviours y Protocolos**: Manejo de errores idiomático, interfaces y polimorfismo.
- **Palabras Reservadas**: Referencia completa de todas las palabras clave y su uso.

### 셸 Bash
Guías prácticas para dominar el scripting en la shell estándar de Linux.
- **Referencia de Sintaxis**: Variables, arrays, `[[...]]` y `((...))`.
- **Administración de Sistemas**: Scripts para monitorizar recursos, gestionar archivos y servicios (`systemd`).
- **Funciones y E/S**: Modularización, redirecciones avanzadas (`&>`), `trap` para manejo de señales y herramientas como `awk`, `sed` y `grep`.
- **Palabras Reservadas**: Referencia completa de todas las palabras clave y su uso.

---

## 🛠️ Entorno de Desarrollo y Uso

### Requisitos
- Docker
- Docker Compose

### 1. Construir y Levantar el Entorno
Ejecuta el siguiente comando en la raíz del proyecto para construir la imagen e iniciar los servicios:

```bash
docker-compose up --build
```

### 2. Acceder a Jupyter Lab
Una vez que el contenedor esté corriendo, abre tu navegador en:
[http://localhost:8080](http://localhost:8080)

*Nota: El token y la contraseña están desactivados por defecto para facilitar el uso en desarrollo local.*

### 3. Persistencia de Datos
Tus notebooks y archivos se guardarán automáticamente en la carpeta local `./note`, la cual está vinculada al directorio `/home/jupyter/note` dentro del contenedor.

### 4. Entorno Técnico
El entorno utiliza compilaciones manuales y herramientas modernas para ofrecer soporte completo en los siguientes lenguajes:

| Lenguaje | Versión | Kernel de Jupyter | Soporte LSP (Completition) |
| :--- | :--- | :--- | :--- |
| **Python** | 3.13.1 | `ipykernel` | `python-lsp-server` |
| **Rust** | Stable | `evcxr_jupyter` | `rust-analyzer` |
| **Golang** | 1.23.4 | `gophernotes` | `gopls` |
| **Ruby** | 3.4.1 | `iruby` | `solargraph` |
| **Elixir** | 1.18.1 | `IElixir` | - |
| **Bash** | Nativo | `bash_kernel` | - |

## 🏗️ Estructura del Proyecto
- `Dockerfile_jupyter_debian`: Definición de la imagen Docker con todas las dependencias.
- `docker-compose.yml`: Configuración del servicio, mapeo de puertos y volúmenes.
- `note/`: Directorio local donde residen todos los notebooks de referencia.