# Jupyter Multilingüe (Debian Edition)

Este proyecto proporciona un entorno de Jupyter Lab completo con múltiples intérpretes de lenguajes de programación instalados y configurados como kernels de Jupyter. El objetivo es ofrecer un entorno robusto, actualizado y con soporte para autocompletado avanzado basado en Debian 12.

## 🚀 Versiones Instaladas (Enero 2025)

El entorno utiliza compilaciones manuales y herramientas modernas para ofrecer soporte completo en los siguientes lenguajes:

| Lenguaje | Versión | Kernel de Jupyter | Soporte LSP (Completition) |
| :--- | :--- | :--- | :--- |
| **Python** | 3.13.1 | `ipykernel` | `python-lsp-server` |
| **Rust** | Stable | `evcxr_jupyter` | `rust-analyzer` |
| **Golang** | 1.23.4 | `gophernotes` | `gopls` |
| **Ruby** | 3.4.1 | `iruby` | `solargraph` |
| **Erlang** | 27.2 | Base para Elixir | - |
| **Elixir** | 1.18.1 | `IElixir` | - |
| **Bash** | Nativo | `bash_kernel` | - |

## ✨ Características Especiales

- **Autocompletado (LSP):** Se ha configurado `jupyterlab-lsp` para proporcionar autocompletado inteligente, salto a definición y análisis de errores en tiempo real según el lenguaje activo.
- **Rust Interactivo:** Gracias al kernel `evcxr`, puedes ejecutar código Rust de alto rendimiento directamente en las celdas del notebook.
- **Librerías Criptográficas:** Incluye soporte preinstalado para `fastecdsa`, `pynacl`, `bip-utils`, `mnemonic` y visualizaciones interactivas con `Plotly` e `ipywidgets`.

## 🛠️ Requisitos
- Docker
- Docker Compose

## 🏁 Instrucciones de Uso

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

## 🏗️ Estructura del Proyecto
- `Dockerfile_jupyter_debian`: Definición de la imagen con todas las compilaciones manuales y servidores de lenguaje (LSP).
- `docker-compose.yml`: Configuración del servicio, mapeo de puertos y volúmenes persistentes.
- `note/`: Directorio local para almacenar tus proyectos, agrupados por categorías (ej. `criptografia/`).

## ⚙️ Configuración Personalizada
Si deseas cambiar las versiones de los lenguajes, puedes modificar los valores de `ARG` en el archivo `Dockerfile_jupyter_debian`:

```dockerfile
ARG PYTHON_VERSION=3.13.1
ARG GOLANG_VERSION=1.23.4
ARG RUBY_VERSION=3.4.1
ARG ERLANG_OTP=27.2
ARG ELIXIR_VERSION=1.18.1
```

### 📈 Configuración de Recursos (CPU y Memoria)

Para optimizar el rendimiento y la capacidad de ejecutar múltiples procesos o notebooks en paralelo, el servicio `jupyter_note` en `docker-compose.yml` ha sido configurado con límites de recursos:

```yaml
    deploy:
      resources:
        limits:
          cpus: "2.0" # Limita el contenedor a 2 CPUs
          memory: 4G # Limita la memoria a 4 GB
```

Puedes ajustar los valores de `cpus` y `memory` según los recursos disponibles en tu máquina host y tus necesidades específicas.
