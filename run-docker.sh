#!/bin/bash

set -o errexit
set -o nounset

# Vérifie que Docker est installé
if ! command -v docker >/dev/null 2>&1; then
    echo "Erreur : Docker n'est pas installé ou n'est pas dans le PATH." >&2
    exit 1
fi

# Vérifie qu'au moins une image et une commande sont fournies
if [ $# -lt 2 ]; then
    echo "Usage: $(basename "$0") <docker-image> <command> [args...]" >&2
    exit 1
fi

# Extraire l'image Docker (premier argument)
DOCKER_IMAGE="$1"
shift  # Supprime le premier argument de la liste

# Exécuter la commande dans le conteneur Docker
docker run --rm -v $(pwd):/data -w /data "$DOCKER_IMAGE" "$@"
