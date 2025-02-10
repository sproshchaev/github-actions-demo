# GitHub Actions Demo

## 📌 Описание проекта
Проект демонстрирует использование **GitHub Actions** для автоматизации CI/CD процесса в Java-проекте с использованием **Maven** и **Docker**.

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

### ⚙️ Описание настроек
#### CI/CD Configuration (ci.yml)
Этот YAML файл описывает сценарий Continuous Integration (CI) для GitHub Actions.

1. **Триггеры**
    - `on`:
        - `push`: Сценарий запускается при каждом `push` в ветку `main`.
        - `pull_request`: Сценарий запускается при каждом создании pull request в ветку `main`.

2. **Задачи (jobs)**
    - `build`
        - `runs-on: ubuntu-latest`: Сценарий выполняется на виртуальной машине с операционной системой Ubuntu.

3. **Шаги (steps)**
    1. **Checkout code**
        - Используется действие `actions/checkout@v2`, чтобы клонировать репозиторий в виртуальную машину.

    2. **Set up JDK 17**
        - Используется действие `actions/setup-java@v2`, чтобы установить JDK версии 17 с дистрибутивом Liberica и архитектурой x64.

    3. **Build with Maven**
        - Команда `mvn -B package --file pom.xml` компилирует проект и упаковывает его с помощью Maven.

    4. **Test with Maven**
        - Команда `mvn test --batch-mode` выполняет тесты с помощью Maven.

    5. **Build Docker image**
        - Команда `docker build . -t github-actions-demo` создает образ Docker из текущей директории и помечает его как `github-actions-demo`.

    6. **Login to Docker Hub**
        - Команда выполняет вход в Docker Hub с использованием сохраненных секретов (переменные среды) `DOCKER_HUB_USERNAME` и `DOCKER_HUB_PASSWORD`.

    7. **Tag and Push Docker image**
        - Команда `docker tag` добавляет тег к образу Docker.
        - Команда `docker push` отправляет образ на Docker Hub.

#### Dockerfile
```dockerfile
# Use OpenJDK 17 as the base image
FROM openjdk:17-jdk-slim

# Set the working directory
WORKDIR /app

# Copy the built jar file from the target directory
COPY target/github-actions-demo-1.0.jar /app/github-actions-demo.jar

# Command to run the application
CMD ["java", "-jar", "github-actions-demo.jar"]
```

Этот Dockerfile выполняет следующие действия:
1. Использует образ `openjdk:17-jdk-slim` в качестве базового для запуска Java-приложения.
2. Устанавливает рабочую директорию `/app`.
3. Копирует скомпилированный JAR файл из директории `target` в рабочую директорию контейнера.
4. Устанавливает команду запуска приложения с помощью `java -jar`.

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
Проект не имеет лицензии.
```