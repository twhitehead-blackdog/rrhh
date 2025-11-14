import { ChangeDetectionStrategy, Component, inject, OnInit } from '@angular/core';
import { Router } from '@angular/router';
import { AuthService } from '@auth0/auth0-angular';
import { Button } from 'primeng/button';
import { Card } from 'primeng/card';
import { Toast } from 'primeng/toast';

@Component({
  selector: 'pt-login',
  imports: [Card, Button, Toast],
  template: `
    <div
      class="w-full h-screen bg-gradient-to-r from-indigo-500 via-purple-500 to-pink-500 flex flex-col items-center justify-center p-4"
    >
      <p-toast />
      <p-card class="w-full md:w-2/5">
        <ng-template #title>Iniciar sesion</ng-template>

        <ng-template #footer>
          <div class="flex flex-col sm:flex-row gap-4 sm:justify-end">
            <p-button label="Entrar al dashboard" (click)="signIn()" />
          </div>
        </ng-template>
      </p-card>
    </div>
  `,
  styles: ``,
  changeDetection: ChangeDetectionStrategy.OnPush,
})
export class LoginComponent implements OnInit {
  public auth = inject(AuthService);
  private router = inject(Router);

  ngOnInit() {
    // Si Auth0 no está configurado, redirigir automáticamente al dashboard
    const auth0Domain = process.env['ENV_AUTH0_DOMAIN'] ?? '';
    const auth0ClientId = process.env['ENV_AUTH0_CLIENT_ID'] ?? '';
    
    if (!auth0Domain || !auth0ClientId || auth0Domain === '' || auth0ClientId === '') {
      console.warn('⚠️ Modo desarrollo: Redirigiendo al dashboard sin autenticación');
      this.router.navigate(['/timeclock']);
    }
  }

  signIn() {
    const auth0Domain = process.env['ENV_AUTH0_DOMAIN'] ?? '';
    const auth0ClientId = process.env['ENV_AUTH0_CLIENT_ID'] ?? '';
    
    // Si Auth0 no está configurado, redirigir directamente
    if (!auth0Domain || !auth0ClientId || auth0Domain === '' || auth0ClientId === '') {
      this.router.navigate(['/timeclock']);
      return;
    }
    
    // Modo producción: usar Auth0
    this.auth.loginWithRedirect({});
  }
}
