# Documentación Ahorra YA

Repositorio de documentación MkDocs para el proyecto **Ahorra YA**.

## Ejecutar localmente

```bash
python -m venv .venv
# Windows PowerShell
.\.venv\Scripts\Activate.ps1
python -m pip install --upgrade pip
python -m pip install -r requirements-docs.txt
python -m mkdocs serve
```

Abrir: <http://127.0.0.1:8000/>

## Publicar en GitHub Pages

Este repositorio incluye el workflow `.github/workflows/deploy-docs.yml`.
En GitHub, activar Pages con fuente **GitHub Actions**. Cada push a `main` construye y publica la documentación.

## Estructura

```text
mkdocs.yml
docs/
requirements-docs.txt
.github/workflows/deploy-docs.yml
```
