import { inject } from '@angular/core';
import { ActivatedRouteSnapshot, CanActivateFn, Router } from '@angular/router';
import { AuthService } from '@auth0/auth0-angular';
import { from, map, take, of } from 'rxjs';

export const authGuardFn: CanActivateFn = (next: ActivatedRouteSnapshot) => {
  // Modo desarrollo: Si Auth0 no está configurado, permitir acceso
  const auth0Domain = process.env['ENV_AUTH0_DOMAIN'] ?? '';
  const auth0ClientId = process.env['ENV_AUTH0_CLIENT_ID'] ?? '';
  
  // Si las credenciales están vacías, permitir acceso (modo desarrollo)
  if (!auth0Domain || !auth0ClientId || auth0Domain === '' || auth0ClientId === '') {
    console.warn('⚠️ Modo desarrollo: Auth0 no configurado, acceso permitido sin autenticación');
    return of(true);
  }

  // Modo producción: Verificar autenticación con Auth0
  const auth = inject(AuthService);
  const router = inject(Router);
  return from(auth.isAuthenticated$).pipe(
    take(1),
    map((isLogged) => (isLogged ? isLogged : router.createUrlTree(['/login'])))
  );
};
