FROM ollama/ollama:latest

# Set environment variables for Railway
ENV OLLAMA_HOST=0.0.0.0
ENV OLLAMA_ORIGINS=*
ENV PORT=11434

# Expose the port
EXPOSE 11434

# Start Ollama server and pull model
CMD ollama serve & \
    sleep 15 && \
    ollama pull llama3.2:1b && \
    wait
