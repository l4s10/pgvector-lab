# Contexto: Integración de IA con Bases de Datos Vectoriales

Este documento explica, a nivel conceptual, cómo una **Inteligencia
Artificial** se integra con una **base de datos vectorial**, utilizando
como referencia el laboratorio PostgreSQL + pgvector.

El objetivo es entregar **contexto arquitectónico**, no implementación.

------------------------------------------------------------------------

## 1. Idea principal

Una IA **no se conecta directamente** a la base de datos.

Siempre existe una **aplicación intermedia** que:

-   Genera embeddings
-   Consulta la base vectorial
-   Entrega contexto a la IA

------------------------------------------------------------------------

## 2. Arquitectura general

    Usuario
      ↓
    Aplicación / Backend
      ↓
    Modelo de embeddings
      ↓
    Base de datos vectorial (pgvector)
      ↓
    Resultados relevantes
      ↓
    Modelo de lenguaje (IA)

------------------------------------------------------------------------

## 3. Flujo paso a paso

### 3.1 Pregunta del usuario

Ejemplo:

> ¿Qué animales domésticos existen?

------------------------------------------------------------------------

### 3.2 Generación del embedding

La aplicación transforma la pregunta en un vector numérico.

Ejemplo conceptual:

    [0.12, 0.18, 0.33, ...]

------------------------------------------------------------------------

### 3.3 Consulta vectorial

``` sql
SELECT contenido
FROM documentos
ORDER BY embedding <-> :vector_consulta
LIMIT 5;
```

------------------------------------------------------------------------

### 3.4 Construcción de contexto (RAG)

La aplicación envía a la IA:

-   La pregunta original
-   Los resultados recuperados

------------------------------------------------------------------------

## 4. Roles claros

### Base de datos vectorial

-   Almacena vectores
-   Calcula similitud
-   No razona

### IA

-   Genera embeddings
-   Genera lenguaje natural
-   No almacena información

### Aplicación

-   Orquesta el flujo completo

------------------------------------------------------------------------

## 5. Relación con este laboratorio

Este laboratorio cubre:

-   Almacenamiento vectorial
-   Búsqueda por similitud

La integración con IA no está implementada, ya que, este laboratorio se centra en la interacción con la base de datos vectorial.

------------------------------------------------------------------------
