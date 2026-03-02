# RFC: ANÁLISIS DE DERIVACIÓN Y VISUALIZACIÓN DE CLAVES ECC EN BLOCKCHAIN

**Estado:** Borrador de Implementación
**Ámbito:** Criptografía de Clave Pública en Redes Distribuidas
**Curvas de Referencia:** secp256k1 (Bitcoin/Ethereum), Ed25519 (Cardano/Solana)

---

## 1. INTRODUCCIÓN
Este documento define los pasos para construir un entorno de análisis en Python que permita visualizar la relación matemática entre una Clave Privada (escalar) y una Clave Pública (punto en el plano) mediante Criptografía de Curva Elíptica (ECC).

---

## 2. REQUISITOS DEL SISTEMA (Librerías Python)
Para la ejecución del análisis, el Notebook debe contar con:
- `fastecdsa`: Para aritmética de curvas de alto rendimiento.
- `matplotlib`: Para la generación de gráficos de la curva.
- `numpy`: Para el manejo de matrices de puntos.
- `hashlib`: Para la derivación de direcciones finales.

---

## 3. ESPECIFICACIONES DEL PROCESO

### 3.1 Definición de la Curva (Modelo de Weierstrass)
La mayoría de las blockchains utilizan la forma: $y^2 = x^3 + ax + b \pmod{p}$.
* **Tarea:** Graficar la curva continua (sin módulo) y la "nube de puntos" (con módulo $p$) para contrastar la teoría vs. la implementación real.



### 3.2 Generación de Clave Privada (d)
* La clave privada es un número entero aleatorio dentro del rango $[1, n-1]$.
* **Importante:** Debe generarse usando entropía del sistema (ej. `secrets` o `os.urandom`).

### 3.3 Multiplicación Escalar (Derivación de Q)
La Clave Pública $Q$ se obtiene mediante la operación: $Q = d \cdot G$
Donde:
- $d$: Clave Privada.
- $G$: Punto Generador base de la curva.
* **Visualización:** El Notebook debe mostrar el método de "Double-and-Add" (Doblado y Suma) para ilustrar cómo se salta de un punto a otro en la curva.



### 3.4 Formatos de Representación
Convertir el punto $Q(x, y)$ a formatos estándar:
- **Uncompressed:** `0x04` + $X$ + $Y$ (65 bytes).
- **Compressed:** `0x02` o `0x03` (depende de la paridad de $Y$) + $X$ (33 bytes).

---

## 4. FLUJO DEL NOTEBOOK (ORDEN DE CELDAS)

1. **Celda de Instalación:** `!pip install fastecdsa matplotlib`
2. **Celda de Parámetros:** Definir $a, b, p$ y $G$.
3. **Celda de Lógica:** Función de suma de puntos y multiplicación escalar.
4. **Celda de Generación:** Crear una clave privada y calcular su pública.
5. **Celda de Visualización:** Gráfico de la curva con el punto $Q$ resaltado.
6. **Celda de Hashing:** Pasar la clave pública por `SHA-256` y `RIPEMD-160` para obtener una dirección de prueba.

---

## 5. SEGURIDAD
- Explicar la inviabilidad de la operación inversa ($d = Q / G$), conocida como el Problema del Logaritmo Discreto de Curva Elíptica (ECDLP).
- Advertencia sobre el uso de generadores de números aleatorios no seguros (débiles).

---
