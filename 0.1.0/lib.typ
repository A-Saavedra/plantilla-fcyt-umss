// lib.typ
#let conf-facultad(
  titulo: "Título de la Presentación",
  autor: "Tu Nombre",
  modo: "claro",
  body
) = {
  // 1. Definición de colores internos
  let colores = if modo == "oscuro" {
    (fondo: rgb("#000814"), texto: rgb("#FFF3B0"), acento: rgb("#00B4D8"))
  } else {
    (fondo: rgb("#FFFFFF"), texto: rgb("#212121"), acento: rgb("#D9480F"))
  }

  // 2. Configuración de página y texto
  set page(paper: "presentation-16-9", fill: colores.fondo, margin: 2cm)
  set text(font: "Roboto", fill: colores.texto, size: 22pt)

  // 3. Reglas de títulos
  show heading: it => {
    set text(fill: if it.level == 1 { colores.acento } else { colores.texto })
    it
    v(0.2em)
    line(length: 100%, stroke: 1.5pt + colores.acento)
    v(0.5em)
  }

  // Portada
  align(center + horizon)[
    #text(size: 32pt, weight: "bold", titulo)
    #v(1em)
    #autor
  ]

  pagebreak()
  body
}

// Exportamos componentes útiles
#let formula_box(body) = align(center, block(
  fill: rgb("#f0f0f0"), stroke: (left: 5pt + rgb("#D9480F")),
  inset: 1em, radius: 4pt, width: 95%, text(fill: black, body)
))
