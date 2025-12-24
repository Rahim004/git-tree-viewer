#!/bin/bash
# find_git_repos.sh - ищет все Git репозитории в указанной папке

if [ $# -eq 0 ]; then
    SEARCH_PATH="."
else
    SEARCH_PATH="$1"
fi

echo "🔍 Поиск Git репозиториев в: $SEARCH_PATH"
echo ""

FOUND=0

# Ищем .git папки
find "$SEARCH_PATH" -name ".git" -type d 2>/dev/null | while read -r git_dir; do
    REPO_PATH=$(dirname "$git_dir")
    FOUND=$((FOUND + 1))
    
    echo "========================================"
    echo "Репозиторий #$FOUND: $REPO_PATH"
    
    # Краткая информация о репозитории
    (
        cd "$REPO_PATH" 2>/dev/null && \
        BRANCH=$(git branch --show-current 2>/dev/null || echo "?") && \
        COMMITS=$(git rev-list --count HEAD 2>/dev/null || echo "0") && \
        echo "  Ветка: $BRANCH, Коммитов: $COMMITS"
    ) || echo "  Не удалось получить информацию"
    echo ""
done

echo "📊 Найдено репозиториев: $FOUND"

# Даем права на выполнение
chmod +x find_git_repos.sh
