import { HttpInterceptorFn } from '@angular/common/http';
import { inject } from '@angular/core';
import { AuthService } from '@auth0/auth0-angular';
import { switchMap, catchError, of } from 'rxjs';

export const httpInterceptor: HttpInterceptorFn = (req, next) => {
  // Verificar si Auth0 está configurado
  const auth0Domain = process.env['ENV_AUTH0_DOMAIN'] ?? '';
  const auth0ClientId = process.env['ENV_AUTH0_CLIENT_ID'] ?? '';
  const isAuth0Configured = auth0Domain && auth0ClientId && auth0Domain !== '' && auth0ClientId !== '';

  if (req.url.includes('supabase')) {
    const supabaseApiKey = process.env['ENV_SUPABASE_API_KEY'] ?? '';
    
    // Si Auth0 no está configurado, usar solo la API key de Supabase
    if (!isAuth0Configured) {
      const request = req.clone({
        headers: req.headers
          .set('apikey', supabaseApiKey)
          .set('Access-Control-Allow-Origin', '*')
          .set(
            'Access-Control-Allow-Headers',
            'authorization, x-client-info, apikey, content-type'
          )
          .set('Prefer', 'return=representation')
          .set('Content-Type', 'application/json'),
      });
      return next(request);
    }

    // Modo producción: usar Auth0 + Supabase
    const auth = inject(AuthService);
    return auth.getAccessTokenSilently().pipe(
      switchMap((token) => {
        const request = req.clone({
          headers: req.headers
            .set('apikey', supabaseApiKey)
            .set('Access-Control-Allow-Origin', '*')
            .set(
              'Access-Control-Allow-Headers',
              'authorization, x-client-info, apikey, content-type'
            )
            .set('Prefer', 'return=representation')
            .set('Content-Type', 'application/json')
            .set('Authorization', `Bearer ${token}`),
        });
        return next(request);
      }),
      catchError((error) => {
        // Si falla Auth0, intentar solo con API key
        console.warn('⚠️ Auth0 falló, usando solo API key de Supabase');
        const request = req.clone({
          headers: req.headers
            .set('apikey', supabaseApiKey)
            .set('Content-Type', 'application/json'),
        });
        return next(request);
      })
    );
  }
  
  return next(req);
};
