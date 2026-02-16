# Start NLP Service
# Run this in Terminal 2 (after backend is running)

Write-Host "========================================" -ForegroundColor Cyan
Write-Host "  Starting NLP Service (Port 8001)" -ForegroundColor Cyan
Write-Host "========================================" -ForegroundColor Cyan
Write-Host ""

# Navigate to NLP directory
Set-Location "c:\Users\ahmed\OneDrive\Desktop\RI-NLP_P-main"

# Check if virtual environment exists
if (Test-Path ".\venv\Scripts\Activate.ps1") {
    Write-Host "Activating virtual environment..." -ForegroundColor Green
    & .\venv\Scripts\Activate.ps1
} else {
    Write-Host "No virtual environment found. Using global Python." -ForegroundColor Yellow
}

Write-Host ""
Write-Host "Starting NLP server..." -ForegroundColor Green
Write-Host "NLP Service will be available at: http://localhost:8001" -ForegroundColor Cyan
Write-Host "API Docs: http://localhost:8001/docs" -ForegroundColor Cyan
Write-Host ""
Write-Host "Backend URL configured: http://localhost:8000" -ForegroundColor Green
Write-Host ""

# Start the NLP service
python -m uvicorn api_service.main:app --host 0.0.0.0 --port 8001 --reload
