@echo off
REM LMS Startup Script - Start both Backend and Frontend

echo.
echo ========================================
echo   LMS - Learning Management System
echo ========================================
echo.

REM Activate virtual environment
call venv\Scripts\activate.bat

REM Start Backend in one window
echo.
echo [1/2] Starting FastAPI Backend on port 8000...
echo.
start "FastAPI Backend" python -m uvicorn app.main:app --reload --host 0.0.0.0 --port 8000

REM Wait a bit for backend to start
timeout /t 3 /nobreak

REM Start Frontend in another window
echo.
echo [2/2] Starting Flask Frontend on port 5000...
echo.
cd frontend
start "Flask Frontend" python app.py
cd ..

REM Display URLs
echo.
echo ========================================
echo   ✓ Servers Started Successfully!
echo ========================================
echo.
echo Frontend: http://localhost:5000
echo Backend:  http://localhost:8000
echo API Docs: http://localhost:8000/docs
echo.
echo Press Ctrl+C in each window to stop servers
echo.
