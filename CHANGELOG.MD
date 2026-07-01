# Changelog

Todos los cambios importantes de este proyecto serán documentados aquí.

Este proyecto sigue el formato de [Keep a Changelog](https://keepachangelog.com/es-ES/1.0.0/)
y utiliza Versionado Semántico (Semantic Versioning).

---

## [0.1.0] - 2026-06-30

### Added

- Estructura inicial del proyecto.
- Configuración de Starship.
- Alias para PowerShell.
- Funciones base para PowerShell.
- Instalador inicial (`install.ps1`).
- Comando `ardev doctor`.
- Integración con Windows Terminal.

### Changed

- Refactorización del instalador.
- Se modularizó el código del instalador.

### Fixed

- Corregido el error de parsing causado por backticks (`).
- Corregido el manejo de rutas usando `$PSScriptRoot`.