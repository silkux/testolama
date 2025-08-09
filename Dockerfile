FROM ollama/ollama:latest

# Railway tries to use /bin/sh, so we need to override the entrypoint
# to handle shell commands properly
EXPOSE 11434

# Create a wrapper script that Railway can execute with sh
RUN echo '#!/bin/sh\nollama serve' > /entrypoint.sh && \
    chmod +x /entrypoint.sh

# Set shell as entrypoint so Railway's /bin/sh command works
ENTRYPOINT ["/bin/sh", "-c"]
CMD ["/entrypoint.sh"]
