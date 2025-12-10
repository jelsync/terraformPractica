
# Terraform Practica

Resumen de las prácticas e instrucciones para reproducir lo hecho en este repositorio (carpeta `terraformPractica`).

**Contenido**
- `practica_1/` — Terraform básico (archivos locales y estado local).
- `practica_2/` — Ejemplo simple de `aws_s3_bucket` y uso del proveedor `aws`.
- `practica_6/` — Creación de EC2 con manejo de `aws_key_pair` y generación de claves (TLS + `aws_key_pair`).
- `practica_7/` — VPC, subredes, Gateway, instancias EC2 y S3. Correcciones realizadas sobre nombres de S3, `random_string` y tags.
- `practica_8/` — Backend remoto (S3 + DynamoDB) y otros ejemplos de VPC.

**Qué hice / problemas encontrados y soluciones**
- Provider AWS: añadí un bloque de `provider` y recordé configurar credenciales (variables de entorno, `~/.aws/credentials` o `profile`).
- S3 bucket: corregí nombres inválidos y formateo de sufijos (`local.s3_suffix`) usando `random_string.result` y añadí guiones para legibilidad.
- Tags: encontré un `TagValue` inválido (`"~> 1.13.3"`) que causaba error `InvalidTag`. Lo cambié a `"1.13.3"` para cumplir las restricciones de AWS.
- Key Pair / SSH: añadí ejemplo para crear un par de claves desde Terraform (`tls_private_key` + `aws_key_pair`) y expliqué cómo fijar permisos en Windows usando `icacls` (o `chmod 600` en WSL/Git Bash) para evitar "UNPROTECTED PRIVATE KEY FILE".
- Backend S3: revisé `backend.tf` y sugerí usar `encrypt = true` (booleano) y configurar `profile` o variables de entorno antes de `terraform init -reconfigure`.
- tfsec: expliqué que la extensión de VS Code requiere el binario `tfsec` instalado y cómo instalar/configurar en Windows (Chocolatey, Scoop o descarga manual), y cómo ajustar `tfsec.path` en `settings.json` si es necesario.

**Requisitos previos**
- Terraform 1.0+ instalado.
- AWS CLI opcional pero recomendado (`aws configure`, `aws sts get-caller-identity`).
- Credenciales AWS válidas (perfil, variables de entorno o role EC2 con IMDS si procede).
- `tfsec` si quieres ejecutar análisis estático (instalar y añadir al `PATH`).

**Comandos básicos**

1. Inicializar (si usas backend remoto y cambiaste credenciales):
```
terraform init -reconfigure
```

2. Planificar:
```
terraform plan
```

3. Aplicar:
```
terraform apply
```
o sin confirmación:
```
terraform apply -auto-approve
```

4. Destruir recursos:
```
terraform destroy -auto-approve
```

5. Probar `tfsec` desde la terminal:
```
tfsec .
```

**Notas operativas y buenas prácticas**
- Nombres de S3 deben cumplir reglas: minúsculas, números y guiones; entre 3 y 63 caracteres; no empezar/terminar con `-`.
- Evita caracteres especiales en valores de tags que AWS pueda rechazar (`~`, `>`, etc.).
- Para claves privadas en Windows, usa `icacls` para dejar sólo permisos de lectura al usuario actual:
```
icacls "C:\ruta\a\mi\mykey.pem" /inheritance:r
icacls "C:\ruta\a\mi\mykey.pem" /grant:r "$env:USERNAME:(R)"
```
- Si creas `aws_key_pair` desde Terraform, puedes guardar la clave privada en un archivo con `local_file` y protegerla.

**Siguiente pasos sugeridos**
- Ejecutar `terraform plan` en las carpetas de práctica que quieras desplegar.
- Instalar `tfsec` y correr análisis en cada carpeta.
- Considerar usar workspaces o estructuras por entorno (dev/prod) para evitar colisiones de nombres.

Si quieres, puedo:
- Añadir instrucciones específicas por `practica_X` (ejemplo de variables, pasos por carpeta).
- Ejecutar cambios en alguno de los archivos para parametrizar mejor (por ejemplo, remover valores hardcodeados).
