# CLAUDE.md — Dolce Diavolo

## Contexto del proyecto

Sitio web de marca para **Dolce Diavolo**, café colombiano de origen con concepto italiano.
Propiedad de Jairo Sepúlveda (Infraestructura-IT).

**Concepto de marca:** basado en la cita de Talleyrand — *«Negro como el diablo, caliente como el infierno, puro como un ángel, dulce como el amor»*. Toda la narrativa visual recorre el eje **diavolo → angelo** (oscuro → claro).

## Estado actual (jun 2026)

- 🟢 **EN PRODUCCIÓN:** https://dolcediavolo.com (verificado en vivo)
- Dominio registrado en **Cloudflare Registrar**
- Repo: `automatizacion-it/dolcediavolo` (GitHub Pages, rama `main`, raíz)
- DNS: 2 registros CNAME en Cloudflare (`@` y `www` → `automatizacion-it.github.io`), **DNS only** (nube gris). Si se activa proxy naranja: SSL/TLS en modo "Full (strict)".
- HTTPS emitido por GitHub Pages, archivo `CNAME` en la raíz del repo (**no borrar**)
- Ruta local: `C:\Users\User01\OneDrive\2026-proyectos\dolcediavolo`
- Cuenta gh: `automatizacion-it` (`gh auth switch --user automatizacion-it`)

## Estructura

```
dolcediavolo/
├── index.html          # Home: viaje scroll 4 versos (fases de color de fondo)
├── tienda.html         # E-commerce estático: 3 tostados + combo + accesorios
├── origen.html         # Historia: finca, proceso, "due anime" CO/IT
├── preparaciones.html  # "I Rituali": 7 métodos del espresso al cold brew
├── etiquetas.html      # Diseño de empaque (interno, NO va en el nav público)
├── CNAME               # dolcediavolo.com (NO borrar — rompe el dominio)
├── deploy.ps1          # Script de despliegue inicial (ya ejecutado)
└── README.md
```

## Historial de cambios

### v1.1 — Responsive completo (jun 2026)
- **Menú hamburger** en `tienda.html` y `origen.html` para ≤760px: CSS-only (checkbox `#ham` + label), animación de barras a X, desplegable bajo el header. Antes el menú simplemente se ocultaba en móvil sin alternativa.
- **index.html:** secciones a 92vh y padding reducido en ≤600px, logo hero más pequeño, grillas de tostados compactadas.
- **preparaciones.html:** fichas técnicas en grid 2×2 en móvil, nav compacto (oculta texto del logo).
- **etiquetas.html:** etiquetas escalan a `min(340px, 92vw)` en pantallas ≤420px.
- **Botón WhatsApp** reducido a 50px en móvil en las 5 páginas.
- Footers centrados en móvil. Validación de parseo HTML en las 5 páginas.

### v1.0 — Lanzamiento inicial (jun 2026)
- **Naming:** dominio `dolcediavolo.com` elegido y registrado (candidatos descartados: diablosuave, tintodiablo, angelnegro)
- **index.html:** home con viaje scroll por los 4 versos de Talleyrand; el fondo cambia de fase (Nero → Brace → Crema → Oro) con IntersectionObserver; logo SVG inline (taza + aureola + cola de diablo)
- **preparaciones.html:** "I Rituali" — 7 métodos ordenados del diablo al ángel (Espresso, Moka, Tinto Campesino, Prensa Francesa, V60, Chemex, Cold Brew), cada uno con ficha técnica (ratio/molienda/tiempo/temperatura) y 4 pasos
- **tienda.html / origen.html / etiquetas.html:** estructura e-commerce inspirada en cafeamorperfecto.com (barra de anuncios, nav sticky, hero banner, grillas de producto con precios COP, footer comercial) adaptada a la identidad propia
- **Línea de producto:** INFERNO (oscuro 5/5, $46.000), PURGATORIO (medio 3/5, $46.000), PARADISO (claro 1/5, $52.000), combo "La Commedia Completa" ($129.000); bolsas 350 g como mockups SVG
- **Reorganización:** nav completo en index y preparaciones; páginas enlazadas entre sí; CTA del index → tienda
- **WhatsApp:** botón flotante en las 5 páginas con mensaje precargado + enlace en footers (número PLACEHOLDER `573001234567`)
- **Infraestructura:** CNAME, .gitignore, README.md, deploy.ps1; repo creado con gh CLI; Pages activado vía `gh api`; dominio vinculado; DNS Cloudflare con CNAME flattening; certificado HTTPS emitido
- **Verificado en vivo** en https://dolcediavolo.com

## Reglas de diseño (NO romper)

- **Paleta oficial:** Nero `#0d0806` · Brace `#1f0c08` · Inferno `#9e2b25` · Ember `#c2452d` · Oro `#c9974a` · Crema `#f3e9d7` / `#f6efe2` · Tinta `#241510`. Siempre en variables CSS `:root`.
- **Tipografías:** Cinzel (títulos/marca), Cormorant Garamond Italic (citas/versos), Jost (cuerpo). Vía Google Fonts (licencia OFL, apta comercial).
- **Logo:** SVG inline siempre (taza + aureola dorada arriba + cola de diablo abajo). Nunca como imagen externa.
- **Productos:** INFERNO (5/5), PURGATORIO (3/5), PARADISO (1/5) — niveles de tueste en granos, mantener consistencia en web, etiquetas y cualquier pieza nueva.
- **Idioma:** copy en español con acentos italianos (eyebrows tipo "Origine", "I Tre Tostati").
- Vanilla HTML/CSS/JS en un solo archivo por página. **Sin frameworks, sin build, sin dependencias.**
- Las fases de color por scroll usan IntersectionObserver con clases `fase-*` en `<body>`.
- Botón WhatsApp flotante presente en toda página nueva (clase `.wa-flotante`).
- **Responsive:** breakpoints en 760px (hamburger) y 600px (compactación). El menú hamburger es CSS-only — mantener ese patrón en páginas nuevas.

## Pendientes

- [ ] **CRÍTICO antes de divulgar:** reemplazar WhatsApp placeholder `573001234567` por el número real (5 páginas, botón + footers)
- [ ] Favicon + og:image (para compartir en redes) + sitemap.xml
- [ ] Carrito es decorativo: integrar pasarela (Wompi/MercadoPago) o flujo de pedidos por WhatsApp
- [ ] Reverso de etiquetas: tabla nutricional, EAN-13, registro INVIMA, lote/fecha de tueste, QR a /preparaciones
- [ ] Fotos reales de producto (reemplazar mockups SVG cuando existan)
- [ ] Registro de marca en la SIC (clase 30 — café) y verificación de usuario en Instagram
- [ ] Datos reales de la finca en origen.html (nombre, municipio, caficultor) cuando se definan

## Flujo de actualización

```powershell
cd C:\Users\User01\OneDrive\2026-proyectos\dolcediavolo
gh auth switch --user automatizacion-it
# ...editar archivos...
git add . ; git commit -m "tipo: descripcion" ; git push
# GitHub Pages publica automáticamente en ~1 min
```
