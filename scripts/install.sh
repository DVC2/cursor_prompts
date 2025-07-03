#!/bin/bash

# Cursor Rules Installation Script
# Installs advanced Cursor MDC rules with backup and recovery options

set -e  # Exit on any error

# Color definitions for better UX
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
BLUE='\033[0;34m'
PURPLE='\033[0;35m'
CYAN='\033[0;36m'
WHITE='\033[1;37m'
NC='\033[0m' # No Color

# Icons for visual appeal
CHECK="✅"
CROSS="❌"
INFO="ℹ️"
ROCKET="🚀"
BACKUP="💾"
FOLDER="📁"

# Script configuration
SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
REPO_ROOT="$(dirname "$SCRIPT_DIR")"
RULES_SOURCE="$REPO_ROOT/.cursor/rules"
TARGET_DIR=".cursor/rules"
BACKUP_DIR=".cursor/rules_backup_$(date +%Y%m%d_%H%M%S)"

# Rule sets definition
declare -A RULE_SETS
RULE_SETS[essential]="commonsense.mdc efficiency.mdc debugging.mdc terminal.mdc audit.mdc"
RULE_SETS[language]="${RULE_SETS[essential]} javascript.mdc typescript.mdc"
RULE_SETS[team]="${RULE_SETS[language]} ADR.mdc session-coordinator.mdc"
RULE_SETS[all]="${RULE_SETS[team]} memory-management.mdc development-journal.mdc"

# Function: Print colored output
print_color() {
    local color=$1
    local message=$2
    echo -e "${color}${message}${NC}"
}

# Function: Print section headers
print_header() {
    echo
    print_color $CYAN "════════════════════════════════════════════════════════════════"
    print_color $WHITE "  $1"
    print_color $CYAN "════════════════════════════════════════════════════════════════"
    echo
}

# Function: Print status messages
print_status() {
    local icon=$1
    local message=$2
    echo -e "  ${icon} ${message}"
}

# Function: Print error and exit
error_exit() {
    print_color $RED "${CROSS} Error: $1"
    exit 1
}

# Function: Print warning
warn() {
    print_color $YELLOW "${INFO} Warning: $1"
}

# Function: Print success
success() {
    print_color $GREEN "${CHECK} $1"
}

# Function: Check if we're in a project directory
check_project_directory() {
    if [[ ! -f "package.json" && ! -f "pyproject.toml" && ! -f "Cargo.toml" && ! -f "go.mod" && ! -f ".git/config" ]]; then
        warn "This doesn't appear to be a project directory."
        echo -e "  ${INFO} Looking for: package.json, pyproject.toml, Cargo.toml, go.mod, or .git/"
        echo
        read -p "  Continue anyway? (y/N): " -n 1 -r
        echo
        if [[ ! $REPLY =~ ^[Yy]$ ]]; then
            print_color $BLUE "Installation cancelled."
            exit 0
        fi
    fi
}

# Function: Check if rules source exists
check_rules_source() {
    if [[ ! -d "$RULES_SOURCE" ]]; then
        error_exit "Rules source directory not found: $RULES_SOURCE"
    fi
    
    # Check if we have the essential rules
    local missing_rules=()
    for rule in ${RULE_SETS[essential]}; do
        if [[ ! -f "$RULES_SOURCE/$rule" ]]; then
            missing_rules+=("$rule")
        fi
    done
    
    if [[ ${#missing_rules[@]} -gt 0 ]]; then
        error_exit "Missing essential rules: ${missing_rules[*]}"
    fi
}

# Function: Create target directory
create_target_directory() {
    print_status "${FOLDER}" "Checking target directory: $TARGET_DIR"
    
    if [[ ! -d "$TARGET_DIR" ]]; then
        mkdir -p "$TARGET_DIR"
        success "Created directory: $TARGET_DIR"
    else
        success "Directory exists: $TARGET_DIR"
    fi
}

# Function: Backup existing rules
backup_existing_rules() {
    if [[ -d "$TARGET_DIR" ]] && [[ -n "$(ls -A "$TARGET_DIR" 2>/dev/null)" ]]; then
        print_status "${BACKUP}" "Backing up existing rules to: $BACKUP_DIR"
        
        mkdir -p "$BACKUP_DIR"
        cp -r "$TARGET_DIR"/* "$BACKUP_DIR/" 2>/dev/null || true
        
        local backup_count=$(ls -1 "$BACKUP_DIR" 2>/dev/null | wc -l)
        success "Backed up $backup_count existing rule files"
        
        # Store backup location for later reference
        echo "$BACKUP_DIR" > "$TARGET_DIR/.last_backup"
    else
        print_status "${INFO}" "No existing rules to backup"
    fi
}

# Function: Display installation options
show_installation_options() {
    print_header "Choose Installation Option"
    
    echo -e "  ${CYAN}1. Essential${NC} (Core rules only)"
    echo "     • Core efficiency and debugging rules"
    echo "     • Rules: commonsense, efficiency, debugging, terminal, audit"
    echo "     • Best for: Any language, minimal setup"
    echo
    
    echo -e "  ${GREEN}2. Language${NC} (Recommended for JS/TS projects)"
    echo "     • Essential rules + JavaScript & TypeScript patterns"
    echo "     • Additional: javascript, typescript"
    echo "     • Best for: JavaScript/TypeScript development"
    echo
    
    echo -e "  ${YELLOW}3. Team${NC} (Recommended for teams)"
    echo "     • Language rules + team coordination"
    echo "     • Additional: ADR, session-coordinator"
    echo "     • Best for: Team projects, collaborative development"
    echo
    
    echo -e "  ${PURPLE}4. All${NC} (Power users)"
    echo "     • Complete rule set with advanced features"
    echo "     • Additional: memory-management, development-journal"
    echo "     • Best for: Large projects, advanced workflows"
    echo
    
    echo -e "  ${RED}5. Cancel${NC}"
    echo
}

# Function: Get user choice
get_user_choice() {
    while true; do
        read -p "  Select option (1-5): " choice
        case $choice in
            1) echo "essential"; return ;;
            2) echo "language"; return ;;
            3) echo "team"; return ;;
            4) echo "all"; return ;;
            5) 
                print_color $BLUE "Installation cancelled."
                exit 0
                ;;
            *) 
                print_color $RED "Invalid option. Please choose 1-5."
                ;;
        esac
    done
}

# Function: Install rules
install_rules() {
    local rule_set=$1
    local rules="${RULE_SETS[$rule_set]}"
    
    print_header "Installing $rule_set Rules"
    
    local installed_count=0
    local failed_count=0
    local failed_rules=()
    
    for rule in $rules; do
        local source_file="$RULES_SOURCE/$rule"
        local target_file="$TARGET_DIR/$rule"
        
        if [[ -f "$source_file" ]]; then
            if cp "$source_file" "$target_file"; then
                print_status "${CHECK}" "Installed: $rule"
                ((installed_count++))
            else
                print_status "${CROSS}" "Failed to install: $rule"
                failed_rules+=("$rule")
                ((failed_count++))
            fi
        else
            warn "Rule not found: $rule (skipping)"
            failed_rules+=("$rule")
            ((failed_count++))
        fi
    done
    
    echo
    if [[ $failed_count -eq 0 ]]; then
        success "Successfully installed all $installed_count rules!"
    else
        warn "Installed $installed_count rules, failed to install $failed_count rules"
        if [[ ${#failed_rules[@]} -gt 0 ]]; then
            echo "  Failed rules: ${failed_rules[*]}"
        fi
    fi
}

# Function: Show success message and next steps
show_success_message() {
    local rule_set=$1
    
    print_header "Installation Complete!"
    
    success "Cursor rules have been installed successfully!"
    echo
    print_color $BLUE "📋 Next Steps:"
    echo "  1. ${ROCKET} Restart Cursor IDE to load the new rules"
    echo "  2. ${INFO} Open any project file to see rules in action"
    echo "  3. ${INFO} Check Cursor's status bar for active rules"
    echo
    
    print_color $BLUE "🔧 Configuration:"
    echo "  • Rules installed in: $TARGET_DIR"
    echo "  • Rule set: $rule_set"
    echo "  • Rules will activate automatically based on file types"
    echo
    
    if [[ -f "$TARGET_DIR/.last_backup" ]]; then
        local backup_dir=$(cat "$TARGET_DIR/.last_backup")
        print_color $BLUE "💾 Backup Information:"
        echo "  • Previous rules backed up to: $backup_dir"
        echo "  • To restore: cp $backup_dir/* $TARGET_DIR/"
        echo
    fi
    
    print_color $BLUE "📚 Learn More:"
    echo "  • Documentation: README.md"
    echo "  • Contributing: CONTRIBUTING.md"
    echo "  • Usage examples: examples/use_cases/"
    echo
    
    print_color $GREEN "${ROCKET} Happy coding with optimized AI assistance!"
}

# Function: Show rule information
show_rule_info() {
    local rule_set=$1
    local rules="${RULE_SETS[$rule_set]}"
    
    echo
    print_color $BLUE "Rules to be installed:"
    for rule in $rules; do
        local rule_name=$(basename "$rule" .mdc)
        case "$rule_name" in
            "commonsense") echo "  • commonsense.mdc - Best practices and mistake prevention" ;;
            "efficiency") echo "  • efficiency.mdc - Tool call optimization and resource management" ;;
            "debugging") echo "  • debugging.mdc - Efficient debugging with minimal tool calls" ;;
            "terminal") echo "  • terminal.mdc - Optimized terminal operations" ;;
            "audit") echo "  • audit.mdc - Comprehensive code quality assurance" ;;
            "javascript") echo "  • javascript.mdc - JavaScript ES2022+ best practices and patterns" ;;
            "typescript") echo "  • typescript.mdc - TypeScript type system mastery and patterns" ;;
            "ADR") echo "  • ADR.mdc - Architectural Decision Records automation" ;;
            "session-coordinator") echo "  • session-coordinator.mdc - Session continuity and handoffs" ;;
            "memory-management") echo "  • memory-management.mdc - Advanced memory and context management" ;;
            "development-journal") echo "  • development-journal.mdc - Development pattern tracking" ;;
            *) echo "  • $rule" ;;
        esac
    done
    echo
}

# Function: Cleanup on error
cleanup() {
    if [[ -n "$BACKUP_DIR" ]] && [[ -d "$BACKUP_DIR" ]] && [[ ! -s "$TARGET_DIR/.last_backup" ]]; then
        warn "Cleaning up incomplete backup directory"
        rm -rf "$BACKUP_DIR" 2>/dev/null || true
    fi
}

# Trap for cleanup on error
trap cleanup ERR

# Main execution
main() {
    print_header "Cursor Rules Installer"
    
    print_color $BLUE "Welcome to the Cursor Rules installer! ${ROCKET}"
    echo "This script will install advanced Cursor MDC rules to optimize your AI development experience."
    echo
    
    # Pre-flight checks
    print_status "${INFO}" "Running pre-flight checks..."
    check_project_directory
    check_rules_source
    create_target_directory
    
    # Backup existing rules
    backup_existing_rules
    
    # Get user choice
    show_installation_options
    rule_set=$(get_user_choice)
    
    # Show what will be installed
    show_rule_info "$rule_set"
    
    # Confirm installation
    read -p "Proceed with installation? (Y/n): " -n 1 -r
    echo
    if [[ $REPLY =~ ^[Nn]$ ]]; then
        print_color $BLUE "Installation cancelled."
        exit 0
    fi
    
    # Install rules
    install_rules "$rule_set"
    
    # Show success message
    show_success_message "$rule_set"
}

# Run main function
main "$@" 