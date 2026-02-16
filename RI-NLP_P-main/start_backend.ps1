# Start Backend Service
# Run this in Terminal 1

Write-Host "========================================" -ForegroundColor Cyan
Write-Host "  Starting Backend Service (Port 8000)" -ForegroundColor Cyan
Write-Host "========================================" -ForegroundColor Cyan
Write-Host ""

# Navigate to backend directory
Set-Location "c:\Users\ahmed\OneDrive\Desktop\backend_v1-main"

# Check if virtual environment exists
if (Test-Path ".\.venv\Scripts\Activate.ps1") {
    Write-Host "Activating virtual environment..." -ForegroundColor Green
    & .\.venv\Scripts\Activate.ps1
} else {
    Write-Host "No virtual environment found. Using global Python." -ForegroundColor Yellow
}

Write-Host ""
Write-Host "Starting backend server..." -ForegroundColor Green
Write-Host "Backend will be available at: http://localhost:8000" -ForegroundColor Cyan
Write-Host "API Docs: http://localhost:8000/docs" -ForegroundColor Cyan
Write-Host ""

# Start the backend
python -m uvicorn app.main:app --host 0.0.0.0 --port 8000 --reload
