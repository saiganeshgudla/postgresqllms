# LMS Startup Script - Start both Backend and Frontend

Write-Host ""
Write-Host "========================================"
Write-Host "  LMS - Learning Management System" -ForegroundColor Cyan
Write-Host "========================================" -ForegroundColor Cyan
Write-Host ""

# Activate virtual environment
& ".\venv\Scripts\Activate.ps1"

# Start Backend
Write-Host "[1/2] Starting FastAPI Backend on port 8000..." -ForegroundColor Green
Write-Host ""
Start-Process powershell -ArgumentList @"
    cd '$PWD'
    & '.\venv\Scripts\python.exe' -m uvicorn app.main:app --reload --host 0.0.0.0 --port 8000
"@ -WindowStyle Normal

# Wait for backend to start
Start-Sleep -Seconds 3

# Start Frontend
Write-Host "[2/2] Starting Flask Frontend on port 5000..." -ForegroundColor Green
Write-Host ""
Start-Process powershell -ArgumentList @"
    cd '$PWD\frontend'
    & '..\venv\Scripts\python.exe' app.py
"@ -WindowStyle Normal

# Display URLs
Write-Host ""
Write-Host "========================================" -ForegroundColor Green
Write-Host "  ✓ Servers Started Successfully!" -ForegroundColor Green
Write-Host "========================================" -ForegroundColor Green
Write-Host ""
Write-Host "Frontend: http://localhost:5000" -ForegroundColor Yellow
Write-Host "Backend:  http://localhost:8000" -ForegroundColor Yellow
Write-Host "API Docs: http://localhost:8000/docs" -ForegroundColor Yellow
Write-Host ""
Write-Host "Press Ctrl+C in each window to stop servers" -ForegroundColor Cyan
Write-Host ""
