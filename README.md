# Terraform Azure Project

## O Projekcie

Terraform Azure Project to inicjatywa mająca na celu zbudowanie skalowalnej i zautomatyzowanej infrastruktury w chmurze Microsoft Azure przy użyciu narzędzia Terraform. W ramach projektu rozwijana jest statyczna aplikacja internetowa oraz wdrażane są procesy CI/CD. Projekt skupia się na efektywności, automatyzacji i zgodności z najlepszymi praktykami w zarządzaniu infrastrukturą jako kodem (IaC).

---

## Zakres Prac

### Zarządzanie Infrastrukturą w Azure
Za pomocą Terraform tworzymy i konfigurujemy zasoby w Azure, takie jak grupy zasobów, funkcje aplikacyjne czy bazy danych. Skupiamy się na modularności i elastyczności, co pozwala na łatwe dostosowywanie kodu do potrzeb różnych projektów.

### Aplikacja Statyczna
Projekt zawiera wdrożenie prostej aplikacji typu Single Page Application (SPA), która wykorzystuje zasoby Azure do obsługi zapytań oraz dostarczania treści statycznych. W ramach prac aplikacja jest rozbudowywana o funkcjonalności takie jak formularze czy połączenia z backendem.

### Automatyzacja CI/CD
W celu przyspieszenia wdrażania, konfigurujemy procesy Continuous Integration i Continuous Deployment (CI/CD) z użyciem GitHub Actions. Kluczowe elementy automatyzacji obejmują:
- Zarządzanie tajemnicami za pomocą GitHub Secrets.
- Automatyczne testowanie kodu Terraform.
- Publikację aplikacji na środowiskach testowych i produkcyjnych.

### Monitorowanie i Testowanie
Projekt uwzględnia integrację narzędzi monitorujących, takich jak Azure Monitor i Application Insights, aby śledzić wydajność aplikacji i analizować potencjalne problemy. Dodatkowo korzystamy z narzędzi bezpieczeństwa, takich jak Checkov czy tfsec, aby zapewnić zgodność z najlepszymi praktykami.

---

## Cele Projektu

- Zautomatyzowane wdrożenie infrastruktury Azure za pomocą Terraform.
- Wdrożenie i rozwój aplikacji internetowej wykorzystującej zasoby chmurowe.
- Implementacja pełnego cyklu CI/CD w oparciu o narzędzia GitHub.
- Utrzymanie wysokiej jakości kodu dzięki narzędziom walidacji i testom bezpieczeństwa.
- Tworzenie modularnych i skalowalnych rozwiązań do ponownego wykorzystania w innych projektach.

---

## Technologie

- **Terraform**: Zarządzanie infrastrukturą jako kodem.
- **Azure**: Dostarczanie zasobów chmurowych.
- **GitHub Actions**: Automatyzacja procesów CI/CD.
- **Application Insights & Azure Monitor**: Monitorowanie i analiza aplikacji.
- **Checkov & tfsec**: Analiza bezpieczeństwa kodu Terraform.

---

## Repozytoria i Zasoby

- [Devind](https://github.com/ksz-priv/devind): Repozytorium do nauki i eksperymentów.
- [Single Web App](https://github.com/ksz-priv/singlewebapp_dvnd): Kod aplikacji statycznej wdrażanej w ramach projektu.

---

## Autor
https://github.com/ksz-priv
---
