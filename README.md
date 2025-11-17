# Landing: Экскурсии на Кубе (русскоязычная)

Короткая статическая landing страница для продвижения экскурсий в Гавану, Варадеро и Сьенфуэгос, ориентированная на русскоговорящую аудиторию.

Файлы:
- `index.html` — главная страница (на русском). Здесь находятся тексты, разделы и форма.
- `styles.css` — стили страницы.

Как протестировать локально
1. Откройте файл `index.html` в браузере (двойной клик или через терминал):

```powershell
Start-Process .\index.html
```

Как работает форма
- Форма собирает данные и открывает почтовый клиент через `mailto:` с предзаполненным subject и телом письма. Это удобно, если вы не хотите подключать бэкенд.

Куда менять контакты
- В `index.html` есть переменные в скрипте: `CONTACT_EMAIL`, `TELEGRAM_LINK`, `WHATSAPP_NUMBER`. Замените их на реальные значения.

Поддержка нескольких языков
- На странице реализован переключатель языков RU / ES в правом верхнем углу. Переключатель меняет все тексты на русский или на испанский.
- Если вы хотите изменить язык по умолчанию, откройте `index.html` и внизу скрипта найдите:

```js
// inicializa con ruso
document.addEventListener('DOMContentLoaded', function(){
	applyTranslations('ru');
});
```

Поменяйте `'ru'` на `'es'` чтобы по умолчанию показывать испанскую версию.

Дополнительно
- Можно заменить `mailto:` на отправку через Formspree или другой сервис, если хотите собирать заявки без использования почтовых клиентов.
- Можно добавить imágenes y assets para una versión más atractiva (recomiendo usar rutas relativas en `index.html`).

Galería de imágenes
- La página incluye una galería con miniaturas y modal. Las imágenes usadas son placeholders desde Unsplash. Si quieres reemplazarlas por imágenes propias, coloca los archivos en una carpeta `assets/` y actualiza los atributos `src` y `data-full` en los elementos `<img>` dentro de la sección `#gallery` en `index.html`.

Ejemplo de reemplazo en `index.html`:

```html
<img src="assets/havana-thumb.jpg" data-full="assets/havana-full.jpg" alt="La Habana" />
```
	- Nota: intenté descargar automáticamente la foto del guía desde Unsplash pero la conexión falló en este entorno; por eso he creado un placeholder local en `assets/guide.svg`. Puedes reemplazarlo por tu foto profesional copiando tu imagen a `assets/guide.jpg` (o `.png`) y actualizando la ruta en `index.html`.

Después de cambiar las imágenes, puedes editar las leyendas (captions) en el objeto `translations` dentro de `index.html` si quieres textos personalizados en RU y ES.

Carrusel
- He convertido la galería en un carrusel horizontal con varios cards. Por defecto usa la misma imagen repetida (la imagen 3). Puedes seguir estos pasos para personalizar:
	1. Reemplaza las URLs dentro de los `<img>` en la sección `#gallery` por tus propias imágenes (usar `assets/` es recomendable para sitios offline).
	2. Ajusta el número de cards añadiendo o eliminando `<figure class="carousel-item">` en `index.html`.
	3. Si quieres, puedo añadir soporte para deslizar con touch avanzado o autoplay.

Fondo cultural ruso
- He añadido un fondo sutil en la página inspirado en la arquitectura rusa (domos/onion domes estilizados) como un patrón SVG repetido con una capa blanca translúcida encima para mantener legibilidad.
- Para cambiar el fondo por otra imagen o patrón, abra `styles.css` y busque la sección que define `background-image` en `body` (es una combinación de `linear-gradient` y un `data:image/svg+xml` embebido). Puedes reemplazar la URL `data:image/svg+xml;utf8,...` por una imagen local, por ejemplo:

```css
body { background-image: linear-gradient(rgba(255,255,255,0.65), rgba(255,255,255,0.65)), url('assets/mi-fondo.jpg'); }
```

O usar otra imagen remota si prefieres.

Banderas en el selector de idioma
- Los botones de idioma ahora muestran banderitas (emoji) junto a la sigla: 🇷🇺 RU y 🇪🇸 ES. Si prefieres iconos SVG en vez de emoji, puedo cambiarlos y colocarlos como `background-image` o `img` dentro de los botones.

Cambiar la imagen de fondo por idioma
- Si quieres que el fondo cambie según el idioma (por ejemplo, foto rusa para RU y otra para ES), puedo implementarlo: añadiría un objeto `backgrounds` en el script y aplicaría `document.body.style.backgroundImage` al cambiar idioma.

Perfil del guía
- He añadido una sección separada con foto y descripción del guía (hombre carismático). Para personalizar:
	- Reemplaza la URL del `src` de `.guide-photo` por tu imagen local en `assets/guide.jpg` o por otra URL.
	- Las cadenas (nombre, rol, biografía) se localizan mediante las claves `guide.name`, `guide.role`, `guide.bio` en el objeto `translations` dentro de `index.html`.
	- Si quieres que la imagen del guía esté disponible localmente, puedo descargarla y crear `assets/guide.jpg` y actualizar el `src` automáticamente.

Дальнейшие улучшения (опционально)
- Подключить серверную обработку заявок (например, Formspree, Netlify Forms или собственный endpoint), чтобы не полагаться на локальный почтовый клиент.
- Добавить реальные изображения, иконки и перевести контент параллельно на английский/испанский при необходимости.

Если хотите, могу:
- Подключить форму к внешнему обработчику (настройка Formspree / Google Forms / endpoint).
- Добавить перевод на русский/английский переключателем.
