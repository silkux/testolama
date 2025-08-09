FROM ollama/ollama:latest

# Set environment variables for Railway
ENV OLLAMA_HOST=0.0.0.0
ENV OLLAMA_ORIGINS=*
ENV PORT=11434

# Create a startup script
RUN echo '#!/bin/bash\n\
# Start Ollama server in background\n\
ollama serve &\n\
\n\
# Wait for server to start\n\
sleep 15\n\
\n\
# Pull the model (use a small one for free tier)\n\
ollama pull llama3.2:1b\n\
\n\
# Keep container running\n\
wait' > /start.sh && chmod +x /start.sh

# Expose the port
EXPOSE 11434

# Run the startup script
CMD ["/start.sh"]
