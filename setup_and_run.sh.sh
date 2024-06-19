#!/bin/bash


GIT_USER="tico087"


REPOS=(
    "https://github.com/$GIT_USER/mariadb-repo.git"
    "https://github.com/$GIT_USER/node-repo.git"
    "https://github.com/$GIT_USER/nginx-repo.git"
    "https://github.com/$GIT_USER/vue-repo.git"
    "https://github.com/$GIT_USER/laravel-repo.git"
)


TARGET_DIR="./modular-env-v1"

clone_or_update_repo() {
    local repo_url=$1
    local repo_name=$(basename "$repo_url" .git)
    local repo_dir="$TARGET_DIR/$repo_name"

    if [ -d "$repo_dir" ]; then
        echo "Updating repository $repo_name..."
        git -C "$repo_dir" pull
    else
        echo "Cloning repository $repo_name..."
        git clone "$repo_url" "$repo_dir"
    fi
}


if [ ! -d "$TARGET_DIR" ]; then
    echo "Creating directory $TARGET_DIR..."
    mkdir -p "$TARGET_DIR"
fi


for repo in "${REPOS[@]}"; do
    clone_or_update_repo "$repo"
done


cd "$TARGET_DIR"


if [ -f "../modular-env-v1/run_docker.sh" ]; then
    echo "Running the Docker setup script..."
    ../modular-env-v1/run_docker.sh
else
    echo "Error: run_docker.sh not found!"
    exit 1
fi


cd -

echo "It's Running .... Enjoy ..."
