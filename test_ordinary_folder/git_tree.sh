
#!/bin/bash
# git_tree.sh - показывает дерево веток Git репозитория

# ====================================================
# КОНФИГУРАЦИЯ И ОБРАБОТКА АРГУМЕНТОВ
# ====================================================

# Показ помощи
show_help() {
    echo "Использование: $0 [ОПЦИИ] <путь_к_папке>"
    echo ""
    echo "Опции:"
    echo "  -h, --help      Показать эту справку"
    echo "  -s, --simple    Простой вывод"
    echo "  -v, --verbose   Подробный вывод"
    echo "  -a, --all       Показать все ветки"
    echo ""
    echo "Примеры:"
    echo "  $0 .                      # Текущая папка"
    echo "  $0 ~/projects/myapp       # Конкретная папка"
    echo "  $0 -a .                   # Показать все ветки"
}

# Значения по умолчанию
REPO_PATH="."
SIMPLE_MODE=false
VERBOSE_MODE=false
SHOW_ALL=false

# Обработка аргументов
while [[ $# -gt 0 ]]; do
    case $1 in
        -h|--help)
            show_help
            exit 0
            ;;
        -s|--simple)
            SIMPLE_MODE=true
            shift
            ;;
        -v|--verbose)
            VERBOSE_MODE=true
            shift
            ;;
        -a|--all)
            SHOW_ALL=true
            shift
            ;;
        -*)
            echo "Ошибка: Неизвестная опция '$1'"
            show_help
            exit 1
            ;;
        *)
            REPO_PATH="$1"
            shift
            ;;
    esac
done

# ====================================================
# ФУНКЦИИ
# ====================================================

check_folder_exists() {
    if [ ! -d "$1" ]; then
        echo "ОШИБКА: Папка '$1' не существует!"
        exit 1
    fi
}

check_git_repository() {
    local folder="$1"
    
    cd "$folder" || {
        echo "ОШИБКА: Не могу перейти в папку '$folder'"
        exit 1
    }
    
    if [ ! -d ".git" ]; then
        echo "Папка '$folder' НЕ является Git репозиторием"
        return 1
    fi
    
    if ! git rev-parse --git-dir > /dev/null 2>&1; then
        echo "Это пустой Git репозиторий (нет коммитов)"
        return 2
    fi
    
    echo "Найден Git репозиторий"
    echo ""
    return 0
}

show_basic_info() {
    echo "========================================"
    echo "ИНФОРМАЦИЯ О РЕПОЗИТОРИИ"
    echo "========================================"
    echo ""
    
    CURRENT_BRANCH=$(git branch --show-current 2>/dev/null)
    if [ -n "$CURRENT_BRANCH" ]; then
        echo "Текущая ветка: $CURRENT_BRANCH"
    else
        echo "Текущая ветка: (не на ветке)"
    fi
    
    echo "Последний коммит:"
    git log --oneline -1 2>/dev/null || echo "  (нет коммитов)"
    
    TOTAL_COMMITS=$(git rev-list --all --count 2>/dev/null)
    echo "Всего коммитов: ${TOTAL_COMMITS:-0}"
    
    REMOTE_URL=$(git remote get-url origin 2>/dev/null)
    if [ -n "$REMOTE_URL" ]; then
        echo "Удаленный репозиторий: $REMOTE_URL"
    fi
    
    echo ""
}

show_branch_tree() {
    echo "========================================"
    echo "ДЕРЕВО ВЕТОК"
    echo "========================================"
    echo ""
    
    echo "Графическое представление:"
    echo "--------------------------------"
    
    if [ "$SHOW_ALL" = true ]; then
        git log --all --graph --oneline --decorate -15 2>/dev/null || echo "  (не удалось)"
    else
        git log --graph --oneline --decorate -15 2>/dev/null || echo "  (не удалось)"
    fi
    
    echo ""
    
    echo "Список веток:"
    echo "--------------------------------"
    
    if [ "$SHOW_ALL" = true ]; then
        BRANCHES=$(git branch -a --format="%(refname:short)" 2>/dev/null)
    else
        BRANCHES=$(git branch --format="%(refname:short)" 2>/dev/null)
    fi
    
    if [ -z "$BRANCHES" ]; then
        echo "  (нет веток)"
    else
        while IFS= read -r BRANCH; do
            if [ "$BRANCH" = "$CURRENT_BRANCH" ]; then
                echo "  * $BRANCH ← текущая"
            else
                echo "    $BRANCH"
            fi
        done <<< "$BRANCHES"
    fi
    
    echo ""
}

show_statistics() {
    if [ "$SIMPLE_MODE" = true ]; then
        return
    fi
    
    echo "========================================"
    echo "СТАТИСТИКА"
    echo "========================================"
    echo ""
    
    LOCAL_BRANCHES_COUNT=$(git branch | wc -l)
    STAGED_FILES=$(git diff --cached --numstat 2>/dev/null | wc -l)
    MODIFIED_FILES=$(git diff --name-only 2>/dev/null | wc -l)
    
    echo "Локальных веток: $LOCAL_BRANCHES_COUNT"
    
    if [ $STAGED_FILES -gt 0 ]; then
        echo "Подготовлено к коммиту: $STAGED_FILES файл(ов)"
    fi
    
    if [ $MODIFIED_FILES -gt 0 ]; then
        echo "Изменено: $MODIFIED_FILES файл(ов)"
    fi
    
    if [ $STAGED_FILES -eq 0 ] && [ $MODIFIED_FILES -eq 0 ]; then
        echo "Рабочая директория чиста"
    fi
    
    echo ""
}

# ====================================================
# ОСНОВНОЙ ПОТОК
# ====================================================

ORIGINAL_DIR=$(pwd)

check_folder_exists "$REPO_PATH"

check_git_repository "$REPO_PATH"
if [ $? -ne 0 ]; then
    cd "$ORIGINAL_DIR"
    exit 1
fi

CURRENT_BRANCH=$(git branch --show-current 2>/dev/null)

show_basic_info
show_branch_tree
show_statistics

cd "$ORIGINAL_DIR"

echo "========================================"
echo "Анализ завершен!"
echo "========================================"
