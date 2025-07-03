#Requires -Version 5.1

<#
.SYNOPSIS
    Cursor Rules Installation Script for Windows
    
.DESCRIPTION
    Installs advanced Cursor MDC rules with backup and recovery options.
    Supports three installation modes: Essential, Team, and All.
    
.PARAMETER InstallationType
    The type of installation: Essential, Team, or All
    
.PARAMETER Force
    Skip confirmation prompts
    
.EXAMPLE
    .\install.ps1
    Run interactive installation
    
.EXAMPLE
    .\install.ps1 -InstallationType Essential -Force
    Install essential rules without prompts
    
.NOTES
    Execution Policy: This script requires execution policy to be set to at least RemoteSigned.
    Run: Set-ExecutionPolicy -ExecutionPolicy RemoteSigned -Scope CurrentUser
#>

[CmdletBinding()]
param(
    [Parameter(Mandatory = $false)]
    [ValidateSet("Essential", "Language", "Team", "All")]
    [string]$InstallationType,
    
    [Parameter(Mandatory = $false)]
    [switch]$Force
)

# Set strict mode for better error handling
Set-StrictMode -Version Latest

# Color definitions for better UX
$Colors = @{
    Red     = "Red"
    Green   = "Green"
    Yellow  = "Yellow"
    Blue    = "Blue"
    Magenta = "Magenta"
    Cyan    = "Cyan"
    White   = "White"
}

# Icons for visual appeal (Unicode support)
$Icons = @{
    Check   = "✅"
    Cross   = "❌"
    Info    = "ℹ️"
    Rocket  = "🚀"
    Backup  = "💾"
    Folder  = "📁"
    Warning = "⚠️"
}

# Script configuration
$ScriptRoot = Split-Path -Parent $MyInvocation.MyCommand.Path
$RepoRoot = Split-Path -Parent $ScriptRoot
$RulesSource = Join-Path $RepoRoot ".cursor\rules"
$TargetDir = ".cursor\rules"
$BackupDir = ".cursor\rules_backup_$(Get-Date -Format 'yyyyMMdd_HHmmss')"

# Rule sets definition
$RuleSets = @{
    Essential = @(
        "commonsense.mdc",
        "efficiency.mdc", 
        "debugging.mdc",
        "terminal.mdc",
        "audit.mdc"
    )
    Language = @()
    Team = @()
    All = @()
}

# Build Language, Team and All rule sets
$RuleSets.Language = $RuleSets.Essential + @("javascript.mdc", "typescript.mdc")
$RuleSets.Team = $RuleSets.Language + @("ADR.mdc", "session-coordinator.mdc")
$RuleSets.All = $RuleSets.Team + @("memory-management.mdc", "development-journal.mdc")

# Function: Write colored output
function Write-ColoredMessage {
    param(
        [string]$Message,
        [string]$Color = "White",
        [string]$Icon = ""
    )
    
    $output = if ($Icon) { "  $Icon $Message" } else { $Message }
    Write-Host $output -ForegroundColor $Color
}

# Function: Write section headers
function Write-Header {
    param([string]$Title)
    
    Write-Host ""
    Write-Host "═══════════════════════════════════════════════════════════════" -ForegroundColor Cyan
    Write-Host "  $Title" -ForegroundColor White
    Write-Host "═══════════════════════════════════════════════════════════════" -ForegroundColor Cyan
    Write-Host ""
}

# Function: Write status messages
function Write-Status {
    param(
        [string]$Icon,
        [string]$Message,
        [string]$Color = "White"
    )
    Write-ColoredMessage -Message $Message -Color $Color -Icon $Icon
}

# Function: Write error and exit
function Write-ErrorAndExit {
    param([string]$Message)
    Write-ColoredMessage -Message "Error: $Message" -Color $Colors.Red -Icon $Icons.Cross
    exit 1
}

# Function: Write warning
function Write-Warning {
    param([string]$Message)
    Write-ColoredMessage -Message "Warning: $Message" -Color $Colors.Yellow -Icon $Icons.Warning
}

# Function: Write success
function Write-Success {
    param([string]$Message)
    Write-ColoredMessage -Message $Message -Color $Colors.Green -Icon $Icons.Check
}

# Function: Check execution policy
function Test-ExecutionPolicy {
    $policy = Get-ExecutionPolicy -Scope CurrentUser
    if ($policy -eq "Restricted") {
        Write-Warning "PowerShell execution policy is Restricted."
        Write-Host "  To run this script, execute:" -ForegroundColor Yellow
        Write-Host "  Set-ExecutionPolicy -ExecutionPolicy RemoteSigned -Scope CurrentUser" -ForegroundColor Yellow
        Write-Host ""
        
        if (-not $Force) {
            $response = Read-Host "Would you like to change the execution policy now? (Y/N)"
            if ($response -match "^[Yy]") {
                try {
                    Set-ExecutionPolicy -ExecutionPolicy RemoteSigned -Scope CurrentUser -Force
                    Write-Success "Execution policy updated successfully"
                }
                catch {
                    Write-ErrorAndExit "Failed to update execution policy: $($_.Exception.Message)"
                }
            }
            else {
                Write-ErrorAndExit "Cannot proceed with Restricted execution policy"
            }
        }
    }
}

# Function: Check if we're in a project directory
function Test-ProjectDirectory {
    $projectFiles = @("package.json", "pyproject.toml", "Cargo.toml", "go.mod")
    $gitDir = ".git"
    
    $hasProjectFile = $projectFiles | ForEach-Object { Test-Path $_ } | Where-Object { $_ }
    $hasGit = Test-Path $gitDir
    
    if (-not ($hasProjectFile -or $hasGit)) {
        Write-Warning "This doesn't appear to be a project directory."
        Write-Host "  Looking for: $($projectFiles -join ', '), or .git/" -ForegroundColor Yellow
        Write-Host ""
        
        if (-not $Force) {
            $response = Read-Host "Continue anyway? (y/N)"
            if ($response -notmatch "^[Yy]") {
                Write-ColoredMessage -Message "Installation cancelled." -Color $Colors.Blue
                exit 0
            }
        }
    }
}

# Function: Check if rules source exists
function Test-RulesSource {
    if (-not (Test-Path $RulesSource)) {
        Write-ErrorAndExit "Rules source directory not found: $RulesSource"
    }
    
    # Check if we have the essential rules
    $missingRules = @()
    foreach ($rule in $RuleSets.Essential) {
        $rulePath = Join-Path $RulesSource $rule
        if (-not (Test-Path $rulePath)) {
            $missingRules += $rule
        }
    }
    
    if ($missingRules.Count -gt 0) {
        Write-ErrorAndExit "Missing essential rules: $($missingRules -join ', ')"
    }
}

# Function: Create target directory
function New-TargetDirectory {
    Write-Status -Icon $Icons.Folder -Message "Checking target directory: $TargetDir"
    
    if (-not (Test-Path $TargetDir)) {
        try {
            New-Item -Path $TargetDir -ItemType Directory -Force | Out-Null
            Write-Success "Created directory: $TargetDir"
        }
        catch {
            Write-ErrorAndExit "Failed to create directory: $($_.Exception.Message)"
        }
    }
    else {
        Write-Success "Directory exists: $TargetDir"
    }
}

# Function: Backup existing rules
function Backup-ExistingRules {
    if ((Test-Path $TargetDir) -and (Get-ChildItem $TargetDir -ErrorAction SilentlyContinue)) {
        Write-Status -Icon $Icons.Backup -Message "Backing up existing rules to: $BackupDir"
        
        try {
            New-Item -Path $BackupDir -ItemType Directory -Force | Out-Null
            Copy-Item -Path "$TargetDir\*" -Destination $BackupDir -Recurse -Force
            
            $backupCount = (Get-ChildItem $BackupDir).Count
            Write-Success "Backed up $backupCount existing rule files"
            
            # Store backup location for later reference
            $BackupDir | Out-File -FilePath (Join-Path $TargetDir ".last_backup") -Encoding UTF8
        }
        catch {
            Write-ErrorAndExit "Failed to backup existing rules: $($_.Exception.Message)"
        }
    }
    else {
        Write-Status -Icon $Icons.Info -Message "No existing rules to backup"
    }
}

# Function: Display installation options
function Show-InstallationOptions {
    Write-Header "Choose Installation Option"
    
    Write-Host "  " -NoNewline
    Write-Host "1. Essential" -ForegroundColor Cyan -NoNewline
    Write-Host " (Core rules only)"
    Write-Host "     • Core efficiency and debugging rules"
    Write-Host "     • Rules: commonsense, efficiency, debugging, terminal, audit"
    Write-Host "     • Best for: Any language, minimal setup"
    Write-Host ""
    
    Write-Host "  " -NoNewline
    Write-Host "2. Language" -ForegroundColor Green -NoNewline
    Write-Host " (Recommended for JS/TS projects)"
    Write-Host "     • Essential rules + JavaScript & TypeScript patterns"
    Write-Host "     • Additional: javascript, typescript"
    Write-Host "     • Best for: JavaScript/TypeScript development"
    Write-Host ""
    
    Write-Host "  " -NoNewline
    Write-Host "3. Team" -ForegroundColor Yellow -NoNewline
    Write-Host " (Recommended for teams)"
    Write-Host "     • Language rules + team coordination"
    Write-Host "     • Additional: ADR, session-coordinator"
    Write-Host "     • Best for: Team projects, collaborative development"
    Write-Host ""
    
    Write-Host "  " -NoNewline
    Write-Host "4. All" -ForegroundColor Magenta -NoNewline
    Write-Host " (Power users)"
    Write-Host "     • Complete rule set with advanced features"
    Write-Host "     • Additional: memory-management, development-journal"
    Write-Host "     • Best for: Large projects, advanced workflows"
    Write-Host ""
    
    Write-Host "  " -NoNewline
    Write-Host "5. Cancel" -ForegroundColor Red
    Write-Host ""
}

# Function: Get user choice
function Get-UserChoice {
    while ($true) {
        $choice = Read-Host "  Select option (1-5)"
        switch ($choice) {
            "1" { return "Essential" }
            "2" { return "Language" }
            "3" { return "Team" }
            "4" { return "All" }
            "5" { 
                Write-ColoredMessage -Message "Installation cancelled." -Color $Colors.Blue
                exit 0
            }
            default { 
                Write-ColoredMessage -Message "Invalid option. Please choose 1-5." -Color $Colors.Red
            }
        }
    }
}

# Function: Install rules
function Install-Rules {
    param([string]$RuleSet)
    
    $rules = $RuleSets[$RuleSet]
    Write-Header "Installing $RuleSet Rules"
    
    $installedCount = 0
    $failedCount = 0
    $failedRules = @()
    
    # Create progress tracking
    $totalRules = $rules.Count
    $currentRule = 0
    
    foreach ($rule in $rules) {
        $currentRule++
        $sourceFile = Join-Path $RulesSource $rule
        $targetFile = Join-Path $TargetDir $rule
        
        # Update progress
        $percentComplete = [math]::Round(($currentRule / $totalRules) * 100)
        Write-Progress -Activity "Installing Rules" -Status "Installing $rule" -PercentComplete $percentComplete
        
        if (Test-Path $sourceFile) {
            try {
                Copy-Item -Path $sourceFile -Destination $targetFile -Force
                Write-Status -Icon $Icons.Check -Message "Installed: $rule" -Color $Colors.Green
                $installedCount++
            }
            catch {
                Write-Status -Icon $Icons.Cross -Message "Failed to install: $rule" -Color $Colors.Red
                $failedRules += $rule
                $failedCount++
            }
        }
        else {
            Write-Warning "Rule not found: $rule (skipping)"
            $failedRules += $rule
            $failedCount++
        }
    }
    
    # Complete progress
    Write-Progress -Activity "Installing Rules" -Completed
    
    Write-Host ""
    if ($failedCount -eq 0) {
        Write-Success "Successfully installed all $installedCount rules!"
    }
    else {
        Write-Warning "Installed $installedCount rules, failed to install $failedCount rules"
        if ($failedRules.Count -gt 0) {
            Write-Host "  Failed rules: $($failedRules -join ', ')" -ForegroundColor Yellow
        }
    }
}

# Function: Show success message and next steps
function Show-SuccessMessage {
    param([string]$RuleSet)
    
    Write-Header "Installation Complete!"
    
    Write-Success "Cursor rules have been installed successfully!"
    Write-Host ""
    Write-ColoredMessage -Message "📋 Next Steps:" -Color $Colors.Blue
    Write-Host "  1. $($Icons.Rocket) Restart Cursor IDE to load the new rules"
    Write-Host "  2. $($Icons.Info) Open any project file to see rules in action"
    Write-Host "  3. $($Icons.Info) Check Cursor's status bar for active rules"
    Write-Host ""
    
    Write-ColoredMessage -Message "🔧 Configuration:" -Color $Colors.Blue
    Write-Host "  • Rules installed in: $TargetDir"
    Write-Host "  • Rule set: $RuleSet"
    Write-Host "  • Rules will activate automatically based on file types"
    Write-Host ""
    
    $backupFile = Join-Path $TargetDir ".last_backup"
    if (Test-Path $backupFile) {
        $backupDir = Get-Content $backupFile -Raw | ForEach-Object { $_.Trim() }
        Write-ColoredMessage -Message "💾 Backup Information:" -Color $Colors.Blue
        Write-Host "  • Previous rules backed up to: $backupDir"
        Write-Host "  • To restore: Copy-Item '$backupDir\*' '$TargetDir' -Force"
        Write-Host ""
    }
    
    Write-ColoredMessage -Message "📚 Learn More:" -Color $Colors.Blue
    Write-Host "  • Documentation: README.md"
    Write-Host "  • Contributing: CONTRIBUTING.md"
    Write-Host "  • Usage examples: examples\use_cases\"
    Write-Host ""
    
    Write-ColoredMessage -Message "$($Icons.Rocket) Happy coding with optimized AI assistance!" -Color $Colors.Green
}

# Function: Show rule information
function Show-RuleInfo {
    param([string]$RuleSet)
    
    $rules = $RuleSets[$RuleSet]
    
    Write-Host ""
    Write-ColoredMessage -Message "Rules to be installed:" -Color $Colors.Blue
    
    foreach ($rule in $rules) {
        $ruleName = [System.IO.Path]::GetFileNameWithoutExtension($rule)
        switch ($ruleName) {
            "commonsense" { Write-Host "  • commonsense.mdc - Best practices and mistake prevention" }
            "efficiency" { Write-Host "  • efficiency.mdc - Tool call optimization and resource management" }
            "debugging" { Write-Host "  • debugging.mdc - Efficient debugging with minimal tool calls" }
            "terminal" { Write-Host "  • terminal.mdc - Optimized terminal operations" }
            "audit" { Write-Host "  • audit.mdc - Comprehensive code quality assurance" }
            "javascript" { Write-Host "  • javascript.mdc - JavaScript ES2022+ best practices and patterns" }
            "typescript" { Write-Host "  • typescript.mdc - TypeScript type system mastery and patterns" }
            "ADR" { Write-Host "  • ADR.mdc - Architectural Decision Records automation" }
            "session-coordinator" { Write-Host "  • session-coordinator.mdc - Session continuity and handoffs" }
            "memory-management" { Write-Host "  • memory-management.mdc - Advanced memory and context management" }
            "development-journal" { Write-Host "  • development-journal.mdc - Development pattern tracking" }
            default { Write-Host "  • $rule" }
        }
    }
    Write-Host ""
}

# Function: Main execution
function Invoke-Main {
    try {
        Write-Header "Cursor Rules Installer"
        
        Write-ColoredMessage -Message "Welcome to the Cursor Rules installer! $($Icons.Rocket)" -Color $Colors.Blue
        Write-Host "This script will install advanced Cursor MDC rules to optimize your AI development experience."
        Write-Host ""
        
        # Pre-flight checks
        Write-Status -Icon $Icons.Info -Message "Running pre-flight checks..."
        Test-ExecutionPolicy
        Test-ProjectDirectory
        Test-RulesSource
        New-TargetDirectory
        
        # Backup existing rules
        Backup-ExistingRules
        
        # Get user choice or use parameter
        if (-not $InstallationType) {
            Show-InstallationOptions
            $ruleSet = Get-UserChoice
        }
        else {
            $ruleSet = $InstallationType
        }
        
        # Show what will be installed
        Show-RuleInfo -RuleSet $ruleSet
        
        # Confirm installation
        if (-not $Force) {
            $response = Read-Host "Proceed with installation? (Y/n)"
            if ($response -match "^[Nn]") {
                Write-ColoredMessage -Message "Installation cancelled." -Color $Colors.Blue
                exit 0
            }
        }
        
        # Install rules
        Install-Rules -RuleSet $ruleSet
        
        # Show success message
        Show-SuccessMessage -RuleSet $ruleSet
    }
    catch {
        Write-ErrorAndExit "An unexpected error occurred: $($_.Exception.Message)"
    }
}

# Run main function if script is executed directly
if ($MyInvocation.InvocationName -ne '.') {
    Invoke-Main
} 