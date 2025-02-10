# GitHub Actions Demo

## 📌 Описание проекта
Этот проект демонстрирует использование **GitHub Actions** для автоматизации CI/CD процесса в Java-проекте с использованием **Maven** и **Docker**.

## 📂 Структура проекта
```text
github-action-demo/
├── .github/
│   └── workflows/
│       └── ci.yml   # Конфигурация GitHub Actions
├── src/
│   └── main/
│       └── java/
│           └── com/
│               └── prosoft/
│                   └── HelloWorld.java  # Основной Java-класс
├── src/
│   └── test/
│       └── java/
│           └── com/
│               └── example/
│                   └── HelloWorldTest.java  # Тесты JUnit
├── Dockerfile   # Docker-образ для развертывания
├── pom.xml   # Конфигурация Maven
```

## 🚀 CI/CD с GitHub Actions
Проект использует **GitHub Actions** для автоматизации следующих шагов:

1. **Сборка кода** с помощью Maven
2. **Запуск тестов**
3. **Создание Docker-образа**
4. **Публикация образа в Docker Hub**

### 🔧 Настройка GitHub Actions
Файл CI/CD workflow: `.github/workflows/ci.yml`

**Основные этапы:**
- Используется **Liberica JDK 17**
- Сборка проекта с помощью Maven
- Запуск тестов
- Сборка Docker-образа
- Аутентификация и публикация образа в **Docker Hub**

### 🔑 Переменные окружения (Secrets)
Для работы с **Docker Hub** необходимо задать **секреты** в GitHub:

| Secret               | Описание                           |
|----------------------|----------------------------------|
| `DOCKER_HUB_USERNAME` | Имя пользователя в Docker Hub  |
| `DOCKER_HUB_PASSWORD` | Пароль или Access Token         |

## 🛠️ Запуск проекта локально
### 1️⃣ Клонирование репозитория
```sh
git clone https://github.com/your-username/github-actions-demo.git
cd github-actions-demo
```
### 2️⃣ Сборка проекта
```sh
mvn clean package
```
### 3️⃣ Запуск тестов
```sh
mvn test
```
### 4️⃣ Запуск Docker-контейнера
```sh
docker build -t github-actions-demo .
docker run -p 8080:8080 github-actions-demo
```

### 🐳 Docker Hub

Образ доступен в Docker Hub по следующей ссылке: 

[https://hub.docker.com/r/sproshchaev/github-actions-demo](https://hub.docker.com/r/sproshchaev/github-actions-demo)

## 📜 Лицензия
Проект распространяется под лицензией **MIT**.

