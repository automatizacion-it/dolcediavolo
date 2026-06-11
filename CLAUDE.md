# CLAUDE.md — Dolce Diavolo

## Contexto del proyecto

Sitio web de marca para **Dolce Diavolo**, café colombiano de origen con concepto italiano.
Propiedad de Jairo Sepúlveda (Infraestructura-IT). Dominio `dolcediavolo.com` registrado en Cloudflare.

**Concepto de marca:** basado en la cita de Talleyrand — *«Negro como el diablo, caliente como el infierno, puro como un ángel, dulce como el amor»*. Toda la narrativa visual recorre el eje **diavolo → angelo** (oscuro → claro).

## Estructura

```
dolcediavolo/
├── index.html          # Home: viaje scroll 4 versos (fases de color de fondo)
├── tienda.html         # E-commerce estático: 3 tostados + combo + accesorios
├── origen.html         # Historia: finca, proceso, "due anime" CO/IT
├── preparaciones.html  # "I Rituali": 7 métodos del espresso al cold brew
├── etiquetas.html      # Diseño de empaque (interno, NO va en el nav público)
├── CNAME               # dolcediavolo.com (NO borrar — rompe el dominio)
└── README.md
```

## Reglas de diseño (NO romper)

- **Paleta oficial:** Nero `#0d0806` · Brace `#1f0c08` · Inferno `#9e2b25` · Ember `#c2452d` · Oro `#c9974a` · Crema `#f3e9d7` / `#f6efe2` · Tinta `#241510`. Siempre en variables CSS `:root`.
- **Tipografías:** Cinzel (títulos/marca), Cormorant Garamond Italic (citas/versos), Jost (cuerpo). Vía Google Fonts.
- **Logo:** SVG inline siempre (taza + aureola dorada arriba + cola de diablo abajo). Nunca como imagen externa.
- **Productos:** INFERNO (oscuro 5/5), PURGATORIO (medio 3/5), PARADISO (claro 1/5) — niveles de tueste en granos, mantener consistencia.
- **Idioma:** copy en español con acentos italianos (eyebrows tipo "Origine", "I Tre Tostati").
- Vanilla HTML/CSS/JS en un solo archivo por página. **Sin frameworks, sin build, sin dependencias.**
- Las fases de color por scroll usan IntersectionObserver con clases `fase-*` en `<body>`.

## Pendientes conocidos

- [ ] Reemplazar número WhatsApp placeholder `573001234567` por el real (buscar en las 5 páginas + footers)
- [ ] Carrito es decorativo: integrar pasarela (Wompi/MercadoPago) o pedidos por WhatsApp
- [ ] Reverso de etiquetas: tabla nutricional, EAN-13, registro INVIMA, QR
- [ ] Fotos reales de producto (reemplazar mockups SVG cuando existan)
- [ ] SEO: og:image, favicon, sitemap.xml

## Deploy

GitHub Pages desde rama `main`, raíz del repo. Org: ver `deploy.ps1`.
Dominio: CNAME en Cloudflare → `<org>.github.io` (CNAME flattening en apex).
