# LB Projectdigital
Bienvenido(a) a nuestro catálogo de cursos.

| Curso | Precio | Categoría | Detalles |
|-------|--------|-----------|----------|
{% for c in site.data.courses %}
| **{{ c.name }}** | ${{ c.price }} | {{ c.category }} | [Ver detalles](/curso/{{ c.slug }}) |
{% endfor %}
