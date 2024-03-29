![BrightCoders Logo](../img/logo.png)

- [Proyecto Final](#proyecto-final)
  - [Objetivos](#objetivos)
  - [Instrucciones](#instrucciones)
  - [Entregables](#entregables)
  - [Flujo de trabajo sugerido](#flujo-de-trabajo-sugerido)
    - [\[ 01 \] Descripción del proyecto](#-01--descripción-del-proyecto)
    - [\[ 02 \] Requerimientos funcionales](#-02--requerimientos-funcionales)
    - [\[ 03 \] Requerimientos no funcionales](#-03--requerimientos-no-funcionales)
    - [\[ 04 \] Plan de trabajo](#-04--plan-de-trabajo)
    - [\[ 05 \] Diseño de la UI](#-05--diseño-de-la-ui)
    - [\[ 07 \] Modelo de la base de datos](#-07--modelo-de-la-base-de-datos)
    - [\[ 08 \] GitHub Planner](#-08--github-planner)
  - [Definiciones](#definiciones)
  - [Recursos](#recursos)
  
# Proyecto Final

  Atributo |  Valor
 --- | --- |
 Tipo | Colaborativo
 Estrategia | Collaborative
 Modo | Síncrono
 Dedicación | 180 horas
 Duración | 45 días

## Objetivos

- Desarrollar experiencia en el trabajo colaborativo remoto para desarrollo de aplicaciones
- Desarrollar experiencia en el uso de React Native para la codificación de aplicaciones móviles

## Instrucciones

1. Como equipo deberán acordar sobre cuál será el proyecto final sobre el que estarán trabajando. Puede ser:
   1. Un producto o aplicación original o idea de emprendimiento
   2. Un producto o aplicación inspirada o similar a una existente
   3. Una clonación de algún producto o servicio existente.
2. Considerar que el proyecto sea retador, es decir, que el proceso de su desarrollo te deje además de un producto, aprendizajes
3. El concepto sobre que se trabajará el proyecto es un MVP. Es decir un producto que incluye las características o funcionalidades mínimas necesarias para probar una idea o producto en una etapa temprana del ciclo de desarrollo.
4. __BONUS__ Considera en tu proyecto parte de su funcionalidad trabajarla como una [API REST](https://guides.rubyonrails.org/api_app.html). Esto te servirá para aprender como una API REST utilizando Rails.
5. Una vez que llegaron a un acuerdo deberán definir las características (funcionalidad) del prototipo a desarrollar, en este análisis se debe tomar en consideración el tiempo que tienen para desarrollarlo así como la velocidad y tamaño del equipo. No debe ser un listado muy detallado pero si claro de las ideas o funcionalidades propuestas. Para facilitar este proceso, procura organizarlas en [milestones](#definiciones) y para cada milestone puedes agregar alguna descripción para precisar algunos puntos.
6. El siguiente paso, es crear un mockup o diseño básico de la UI de la aplicación. Entre otras cosas este diseño servirá para tener una mejor idea del esfuerzo que requerirán para desarrollar el proyecto para que con base en esto realicen ajustes de ser necesario. Puedes apoyarte en herramientas como [uizard](https://uizard.io/es/), [Figma](https://www.figma.com/) ó similares.
7. También, necesitarás un modelo inicial para tu base de datos genera el modelo inicial utilizando una herramienta como [dbdiagram.io](https://dbdiagram.io/home) ó similar.
8. Con el diseño, el equipo podrá iniciar a planear las tareas para su primer sprint. Antes de crear tus tareas asegúrate de crear y configurar el proyecto de GitHub [(ver instrucciones)](project-planner.md)
9. Una vez planificado tu sprint inicia a codificar siguiendo nuestro [flujo de trabajo para el desarrollo ágil]((workflow.md))

## Entregables

- Descripción del proyecto
- Plan de trabajo
- Descripción de requerimientos funcionales
- Descripción de requerimientos no funcionales
- Propuesta de diseño de UI
- Código fuente
- Despliegue de la aplicación (deployment)
- Documentación para su instalación, ejecución y pruebas

## Flujo de trabajo sugerido

# O nly P hones

### [ 01 ] Descripción del proyecto

Es un e-commerce (tienda en linea), en donde solo se venden telefonos, el cual te permite comprar y vender, al igual que hacer una comparacion de telefonos en
cuanto a calidad, precio y caracteristicas.

### [ 02 ] Requerimientos funcionales

- Milestone 1. Registro de usuarios y vendedores (CRUD)
- Milestone 2. Probar funcionalidad de la [API](https://docs.device-specs.io/smartphones/api-endpoints)
- Milestone 3. Sesión y carrito de comprador
- Milestone 4. Sesión de vendedor
- Milestone 5. Deploy
- Milestone 6. Corrección de detalles

### [ 03 ] Requerimientos no funcionales

> Registra los aspectos no funcionales a considerar como tecnologías, calidad, etc.
- Tecnologías
  -  RNF 1. Ruby on Rails versión 7.x.x
  -  RNF 2. Compilador de estilos SASS
  -  RNF 3. Framework CSS Bootstrap 5
  -  RNF 4. PostgreSQL
  -  RNF 5. MVC
- Calidad
  - RNF 6. Rubocop
  - RNF 7. Rubycritic


### [ 04 ] Plan de trabajo

> Organiza tus requerimientos ó `milestones` de manera calendarizada.

Milestone | WK1 | WK2 | WK3 | WK4 | WK5 | WK6 | WK7 | WK8 | WK9 |
---|---|---|---|---|---|---|---|---|---|
 #1 | X | X |   |   |   |   |   |   |   |
 #2 |   |   | X |   |   |   |   |   |   |
 #3 |   |   | X | X | X |   |   |   |   |
 #4 |   |   |   | X | X | X |   |   |   |
 #5 |   |   |   |   |   |   | X | X |   |
 #6 |   |   |   |   |   |   | X | X | X |

### [ 05 ] Diseño de la UI

> Propuesta de diseño [OnlyPhones](https://www.figma.com/file/OoDhwMGWm2OgPLJEgjWv0D/OnlyPhones?node-id=40%3A221&t=IhxOFbAgRBIH8AJa-1)

### [ 07 ] Modelo de la base de datos

[Modelo de Base de Datos](https://dbdiagram.io/d/63e58509296d97641d7fd7cb)

### [ 08 ] GitHub Planner

> [Planner del proyecto](https://github.com/orgs/BrightCoders-Institute/projects/40)

## Definiciones

- Milestone
  - Es un punto específico en un proyecto que marca una etapa significativa de desarrollo.
  - Funciona como una señal para ayudar a visualizar cuánto progreso se ha logrado y qué queda por hacer.
  - Se descomponen en tareas
- Tarea
  - Historias de usuario, issues, tickets, etc
  - Descripción breve y sencilla de una característica del producto a desarrollar desde el punto de vista de la persona que desea la nueva capacidad, puede ser un usuario, cliente, o cualquier stakeholder.

## Recursos

- [Minimum Viable Product](https://www.agilealliance.org/glossary/mvp/#q=~(infinite~false~filters~(tags~(~'mvp))~searchTerm~'~sort~false~sortDirection~'asc~page~1))
- [Minimum Viable Product (MVP)](https://www.productplan.com/glossary/minimum-viable-product/)
- [Design Thinking](https://www.interaction-design.org/literature/topics/design-thinking)
- [El proceso de pensamiento de diseño](https://www.youtube.com/watch?v=_r0VX-aU_T8)
- [Metodología Design Thinking. Ejemplos](https://www.youtube.com/watch?v=_ul3wfKss58)
- [Design Thinking ejemplo sencillo](https://www.youtube.com/watch?v=_H33tA2-j0s)
