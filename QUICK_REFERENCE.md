# 🚀 Quick Reference Guide

## 📍 Servers Status
```
Frontend (Flask):   ✅ http://localhost:5000
Backend (FastAPI):  ✅ http://localhost:8000
Database (Postgres): ✅ Connected
```

## 🎯 Quick Commands

### Start Everything (Windows)
```bash
start.bat
```
or
```powershell
.\start.ps1
```

### Start Backend Only
```bash
python -m uvicorn app.main:app --reload --host 0.0.0.0 --port 8000
```

### Start Frontend Only
```bash
cd frontend
python app.py
```

## 📚 Important URLs
| URL | Purpose |
|-----|---------|
| http://localhost:5000 | Frontend UI |
| http://localhost:8000/docs | API Swagger UI |
| http://localhost:8000/redoc | API ReDoc |

## 🗂️ Project Root Files
```
venv/                    Virtual environment
app/                     Backend code
frontend/                Frontend code
.env                     Database config
requirements.txt         Backend dependencies
frontend/requirements.txt Frontend dependencies
README.md                Full documentation
SETUP_COMPLETE.md        Setup summary
config.json              Project config
start.bat                Batch startup script
start.ps1                PowerShell startup script
```

## 🔗 API Endpoints
```
POST /students/          Create student
GET  /students           List all students
```

## 📝 Test Student API
```bash
curl -X POST http://localhost:8000/students/ \
  -H "Content-Type: application/json" \
  -d '{"full_name":"John Doe","email":"john@example.com"}'
```

## 🛠️ Add New Module (e.g., Courses)

1. Create folder: `app/courses/`
2. Add files: `__init__.py, models.py, schemas.py, crud.py, routes.py`
3. Register in `app/main.py`: 
   ```python
   from app.courses.routes import router as course_router
   app.include_router(course_router)
   ```
4. Create templates in `frontend/templates/`
5. Add routes in `frontend/app.py`

## 🔧 Troubleshooting

**Servers not starting?**
- Activate venv: `.\venv\Scripts\Activate.ps1`
- Install dependencies: `pip install -r requirements.txt`

**Database connection error?**
- Check PostgreSQL is running
- Verify `.env` file has correct DATABASE_URL
- Create database: `createdb lms_db`

**Port already in use?**
- Change port: `--port 8001`
- Or kill process: `lsof -ti:8000 | xargs kill -9`

## 📊 File Structure
```
postgresql/
├── app/                  Backend (FastAPI)
├── frontend/             Frontend (Flask)  
├── venv/                 Virtual Environment
├── .env                  Config
├── requirements.txt      Backend deps
├── README.md             Full docs
└── SETUP_COMPLETE.md     This setup
```

---
**Everything is ready! You can now:**
- ✅ Access frontend at http://localhost:5000
- ✅ Manage students via UI
- ✅ Use API at http://localhost:8000
- ✅ Add new features following the modular pattern
