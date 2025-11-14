# Peopletrak

<a alt="Nx logo" href="https://nx.dev" target="_blank" rel="noreferrer"><img src="https://raw.githubusercontent.com/nrwl/nx/master/images/nx-logo.png" width="45"></a>

✨ **Sistema de Gestión de Personal y Control de Punto** ✨

## 🚀 Inicio Rápido

### Requisitos Previos

- Node.js 18+ y npm
- Cuenta de [Auth0](https://auth0.com) (gratuita)
- Cuenta de [Supabase](https://supabase.com) (gratuita)

### Configuración Inicial

1. **Instalar dependencias:**
   ```bash
   npm install
   ```

2. **Configurar variables de entorno:**
   - Copia `env.example.txt` como `.env`
   - Completa las variables con tus credenciales de Auth0 y Supabase
   - Ver [GUIA_LOCAL.md](./GUIA_LOCAL.md) para instrucciones detalladas

3. **Iniciar la aplicación:**
   ```bash
   npm start
   # o
   npx nx serve peopletrak
   ```

La aplicación estará disponible en `http://localhost:4200`

## 📚 Documentación

- **[Guía Completa para Ejecutar Localmente](./GUIA_LOCAL.md)** - Instrucciones detalladas paso a paso
- **[Variables de Entorno](./env.example.txt)** - Ejemplo de configuración

## 🏗️ Build para Producción

Run `npx nx build peopletrak` to build the application. The build artifacts are stored in the output directory (e.g. `dist/` or `build/`), ready to be deployed.

## Running tasks

To execute tasks with Nx use the following syntax:

```
npx nx <target> <project> <...options>
```

You can also run multiple targets:

```
npx nx run-many -t <target1> <target2>
```

..or add `-p` to filter specific projects

```
npx nx run-many -t <target1> <target2> -p <proj1> <proj2>
```

Targets can be defined in the `package.json` or `projects.json`. Learn more [in the docs](https://nx.dev/features/run-tasks).

## Set up CI!

Nx comes with local caching already built-in (check your `nx.json`). On CI you might want to go a step further.

- [Set up remote caching](https://nx.dev/features/share-your-cache)
- [Set up task distribution across multiple machines](https://nx.dev/nx-cloud/features/distribute-task-execution)
- [Learn more how to setup CI](https://nx.dev/recipes/ci)

## Explore the project graph

Run `npx nx graph` to show the graph of the workspace.
It will show tasks that you can run with Nx.

- [Learn more about Exploring the Project Graph](https://nx.dev/core-features/explore-graph)

## Connect with us!

- [Join the community](https://nx.dev/community)
- [Subscribe to the Nx Youtube Channel](https://www.youtube.com/@nxdevtools)
- [Follow us on Twitter](https://twitter.com/nxdevtools)
