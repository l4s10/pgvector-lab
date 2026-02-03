-- ============================================================
-- Inicialización del laboratorio PostgreSQL + pgvector
-- ============================================================

-- Habilita la extensión pgvector
-- Permite trabajar con columnas de tipo VECTOR
CREATE EXTENSION IF NOT EXISTS vector;

-- ------------------------------------------------------------
-- Tabla de ejemplo
-- ------------------------------------------------------------
-- embedding VECTOR(3):
-- - El número indica la dimensión del vector
-- - En escenarios reales puede ser 384, 768, 1536, etc.
CREATE TABLE documentos (
    id SERIAL PRIMARY KEY,
    contenido TEXT,
    embedding VECTOR(3)
);

-- ------------------------------------------------------------
-- Datos de prueba
-- ------------------------------------------------------------
-- Los valores son ficticios y se usan solo para experimentar
INSERT INTO documentos (contenido, embedding)
VALUES
('gato',  '[0.1, 0.2, 0.3]'),
('perro', '[0.2, 0.1, 0.4]'),
('auto',  '[0.9, 0.8, 0.7]');
