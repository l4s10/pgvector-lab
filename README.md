# Laboratorio PostgreSQL + pgvector

Este repositorio contiene un **entorno local controlado** para
comprender los fundamentos de las **bases de datos vectoriales**
utilizando PostgreSQL y la extensión `pgvector`.

El objetivo es **aprender haciendo**, sin depender inicialmente de
modelos de IA externos.


## 📘 Contexto arquitectónico

Para comprender cómo una Inteligencia Artificial se integra con una base de
datos vectorial y cuál es el rol de cada componente en la arquitectura,
revisar el siguiente documento:

👉 [Contexto: Integración de IA con Bases de Datos Vectoriales](./CONTEXTO_IA_Y_VECTOR_DB.md)

Este documento es **conceptual** y complementa el laboratorio práctico.

------------------------------------------------------------------------

## 1. Objetivo del laboratorio

-   Comprender qué es un vector y cómo se almacena
-   Ejecutar búsquedas por similitud usando SQL
-   Entender el rol de una base de datos vectorial en soluciones
    modernas
-   Proveer una base reutilizable para futuros proyectos (IA, búsqueda
    semántica, RAG)

------------------------------------------------------------------------

## 2. Requisitos

-   Docker
-   Docker Compose

No se requiere instalar PostgreSQL localmente.

------------------------------------------------------------------------

## 3. Levantar el entorno

Desde la raíz del proyecto:

``` bash
docker compose up -d
```

Esto levanta:
-   PostgreSQL 16
-   Base de datos `vectordb`
-   Extensión `pgvector` habilitada
-   Datos de ejemplo precargados

------------------------------------------------------------------------

## 4. Acceso a la base de datos

``` bash
docker exec -it pgvector_lab psql -U postgres -d vectordb
```

------------------------------------------------------------------------

## 5. Conceptos clave

### 5.1 ¿Qué es un vector?

Un vector es una lista ordenada de números:

    [0.1, 0.2, 0.3]

En contextos modernos, estos valores representan características
extraídas de datos como textos, imágenes o sonidos.

------------------------------------------------------------------------

### 5.2 ¿Qué es pgvector?

`pgvector` es una extensión que permite: - Almacenar vectores en
PostgreSQL - Calcular distancias entre ellos - Ordenar resultados por
similitud

PostgreSQL sigue siendo una base de datos relacional; pgvector
**complementa**, no reemplaza, este modelo.

------------------------------------------------------------------------

## 6. Primer experimento: búsqueda por similitud

``` sql
SELECT contenido
FROM documentos
ORDER BY embedding <-> '[0.15, 0.2, 0.25]'
LIMIT 1;
```

**¿Qué ocurre?** - `<->` calcula la distancia entre vectores -
PostgreSQL ordena los resultados desde el más cercano - El resultado
representa el vector más similar al vector de búsqueda

------------------------------------------------------------------------

## 7. Experimentos sugeridos

### Experimento 1: modificar el vector de búsqueda

``` sql
ORDER BY embedding <-> '[0.9, 0.85, 0.7]'
```

### Experimento 2: insertar nuevos datos

``` sql
INSERT INTO documentos (contenido, embedding)
VALUES ('bicicleta', '[0.85, 0.7, 0.6]');
```

### Experimento 3: aumentar la dimensión del vector

Modificar la tabla para usar más dimensiones y analizar implicancias.

------------------------------------------------------------------------

## 8. Relación con IA (contexto)

En sistemas reales: - Los vectores suelen generarse con modelos de
embeddings - La base de datos **no genera inteligencia** - Su rol es
almacenar y recuperar información por similitud

Este laboratorio se enfoca únicamente en la capa de persistencia.

------------------------------------------------------------------------

## 9. ¿Qué más podemos hacer a partir de aquí? -> Más adelante...

-   Agregar índices vectoriales (`ivfflat`)
-   Conectar una API (Node, Laravel, Python)
-   Integrar generación de embeddings con modelos locales o externos

------------------------------------------------------------------------

## 10. Notas finales

Este entorno está pensado como: - Material de aprendizaje - Base para
pruebas técnicas - Punto de partida para soluciones productivas para una bench de bases de datos vectoriales.

Francisco Muñoz - 2026.
