# 1. Usar una imagen oficial de Python ligera
FROM python:3.11-slim

# 2. Establecer el directorio de trabajo dentro del contenedor
WORKDIR /app

# 3. Copiar el archivo de requerimientos e instalar las librerías
COPY requirements.txt .
RUN pip install --no-cache-dir -r requirements.txt

# 4. Copiar todo el código de tu proyecto al contenedor
COPY . .

# 5. Exponer el puerto 8000 para poder conectarnos
EXPOSE 8000

# 6. Comando automático para arrancar el servidor al iniciar el contenedor
CMD ["uvicorn", "main:app", "--host", "0.0.0.0", "--port", "8000"]