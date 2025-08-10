#!/bin/bash
# Script para crear la estructura de archivos dentro de la carpeta GlossaryAI existente

set -e

# Crear carpetas
mkdir -p backend/app/migrations
mkdir -p frontend/src/pages
mkdir -p frontend/src/components
mkdir -p nginx

# Archivos backend
cat > backend/requirements.txt <<EOL
Flask==2.3.4
psycopg2-binary==2.9.10
SQLAlchemy==2.0.20
Flask-Migrate==4.0.4
python-dotenv==1.0.0
passlib[bcrypt]==1.7.4
Authlib==1.2.0
Flask-JWT-Extended==4.4.4
redis==4.5.5
rq==1.13.0
EOL

touch backend/.env.example backend/Dockerfile backend/app/__init__.py backend/app/config.py backend/app/models.py backend/app/routes.py

# Archivos frontend
cat > frontend/package.json <<EOL
{
  "name": "glossaryai-frontend",
  "private": true,
  "scripts": {
    "dev": "vite",
    "build": "vite build",
    "preview": "vite preview"
  },
  "dependencies": {
    "react": "^18.2.0",
    "react-dom": "^18.2.0",
    "axios": "^1.4.0",
    "react-router-dom": "^6.12.1",
    "tailwindcss": "^4.0.0"
  }
}
EOL

touch frontend/vite.config.js frontend/index.html frontend/src/main.jsx frontend/src/App.jsx frontend/src/pages/Login.jsx frontend/src/pages/Register.jsx frontend/src/pages/GlossaryList.jsx frontend/src/components/GlossaryCard.jsx

# Archivos raíz
touch docker-compose.yml README.md nginx/default.conf

echo "Estructura interna del proyecto GlossaryAI creada con éxito."

