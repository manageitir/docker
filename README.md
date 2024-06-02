با استفاده از دستورهای زیر میتوانید بدون نیاز به استفاده از VPN و یا dns های موجود برای دور زدن تحریم‌های داکر تمامی پکیج های داکر را بر روی سرورهای خود نصب کنید و از مخزن کش شده و به روز ایمیج های داکر استفاده کنید.

---

# Ubuntu

اگر سیستم عامل شما اوبونتو است دستور زیر را برای نصب و استفاده از داکر وارد کنید و نیازی به چیز دیگر نیست:
```shell
curl -fsSL https://raw.githubusercontent.com/manageitir/docker/main/install-ubuntu.sh | sh
```

---

# Other
اگر سیستم عامل دیگری به جز اوبونتو دارید ابتدا داکر را نصب کنید و سپس دستور زیر را برای اضافه کردن میرور ایمیج های داکر و دور زدن تحریم‌ها اجرا کنید:

```shell
curl -fsSL https://raw.githubusercontent.com/manageitir/docker/main/mirror.sh | sh
```

---

# Docker Desktop
اگر بر روی سیستم عامل ویندوز و یا مک از داکر دسکتاپ استفاده میکنید به قسمت تنظیمات بروید و وارد قسمت Docker Engine شوید، سپس متن زیر را کپی کنید و در آن قسمت وارد کنید و سپس روی دکمه Apply & restart کلیک کنید:

```json
{
  "registry-mirrors": [
    "https://docker.manageit.ir"
  ]
}
```

---

# Alpine Mirror
همچنین منیجیت سرور میرور به روز از alpine دارد که میتوانید روی سیستم عامل alpine از آن استفاده کنید، برای مثال کدهای زیر شامل نمونه `Dockerfile` برای نصب nginx از میرور منیجیت بر روی ایمیج آلپاین است:

```dockerfile
FROM alpine

# Add manageit alpine mirror to alpine
RUN echo https://mirror.manageit.ir/alpine/v$(echo $(cat /etc/alpine-release) | awk -F . '{print $1"."$2}')/main > /etc/apk/repositories
RUN echo https://mirror.manageit.ir/alpine/v$(echo $(cat /etc/alpine-release) | awk -F . '{print $1"."$2}')/community >> /etc/apk/repositories

# Install nginx for example
RUN apk update && apk add nginx

CMD nginx -g "daemon off;"
```