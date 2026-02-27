# LMS (Learning Management System) - Setup & Usage Guide

## 🎯 Project Overview
A Learning Management System built with:
- **Backend**: FastAPI (Python) - RESTful API
- **Frontend**: Flask (Python) - Web Interface
- **Database**: PostgreSQL

## 📂 Project Structure
```
postgresql/
├── app/                          # FastAPI Backend
│   ├── __init__.py
│   ├── main.py                  # FastAPI app initialization
│   ├── database.py              # PostgreSQL connection
│   └── students/                # Students module
│       ├── __init__.py
│       ├── models.py            # SQLAlchemy models
│       ├── schemas.py           # Pydantic schemas
│       ├── crud.py              # Database operations
│       └── routes.py            # API endpoints
│
├── frontend/                     # Flask Frontend
│   ├── app.py                   # Flask app
│   ├── requirements.txt          # Dependencies
│   ├── templates/               # HTML templates
│   │   ├── base.html            # Base template
│   │   ├── index.html           # Students list
│   │   ├── add_student.html     # Add student form
│   │   ├── 404.html
│   │   └── 500.html
│   └── static/                  # Static files
│       ├── css/style.css        # Stylesheet
│       └── js/main.js           # JavaScript
│
├── venv/                        # Virtual environment
├── .env                         # Environment variables
├── requirements.txt             # Backend dependencies
└── README.md
```

## 🚀 Getting Started

### Prerequisites
- Python 3.12+
- PostgreSQL installed and running
- Virtual environment set up

### Installation

#### 1. Activate Virtual Environment
```bash
cd c:\Users\Aditya\OneDrive\Attachments\Desktop\postgresql
.\venv\Scripts\Activate.ps1
```

#### 2. Install Backend Dependencies
```bash
pip install -r requirements.txt
```

#### 3. Install Frontend Dependencies
```bash
pip install Flask==3.0.0 requests==2.31.0
```

## 🔧 Environment Configuration

Create/verify `.env` file in the project root:
```env
DATABASE_URL=postgresql+psycopg2://postgres:171119%40aditya@localhost:5432/lms_db
```

## 🏃 Running the Application

### Option 1: Run Both Servers (Recommended for Development)

**Terminal 1 - Start Backend (FastAPI)**
```bash
cd c:\Users\Aditya\OneDrive\Attachments\Desktop\postgresql
.\venv\Scripts\python.exe -m uvicorn app.main:app --reload --host 0.0.0.0 --port 8000
```

**Terminal 2 - Start Frontend (Flask)**
```bash
cd c:\Users\Aditya\OneDrive\Attachments\Desktop\postgresql\frontend
..\venv\Scripts\python.exe app.py
```

### URLs
- **Frontend**: http://localhost:5000 (Flask - User Interface)
- **Backend API**: http://localhost:8000 (FastAPI - API Server)
- **API Docs**: http://localhost:8000/docs (Swagger UI)
- **API ReDoc**: http://localhost:8000/redoc

## 📋 API Endpoints

### Students Module
| Method | Endpoint | Description |
|--------|----------|-------------|
| GET | `/students` | Get all students |
| POST | `/students/` | Create new student |

**Example Request:**
```bash
curl -X POST http://localhost:8000/students/ \
  -H "Content-Type: application/json" \
  -d '{"full_name":"John Doe","email":"john@example.com"}'
```

**Example Response:**
```json
{
  "id": 1,
  "full_name": "John Doe",
  "email": "john@example.com",
  "is_active": true
}
```

## 🌐 Frontend Features

### Pages Available
1. **Home / Students List** (`/`)
   - Display all students
   - View student details
   - Link to add new student

2. **Add Student** (`/add-student`)
   - Form to add new student
   - Full name and email validation
   - Success/error notifications

3. **Error Pages**
   - 404 Not Found
   - 500 Server Error

## 📊 Database Schema

### Students Table
```sql
CREATE TABLE students (
  id SERIAL PRIMARY KEY,
  full_name VARCHAR NOT NULL,
  email VARCHAR UNIQUE NOT NULL,
  is_active BOOLEAN DEFAULT TRUE
);
```

## 🛠️ Tech Stack

### Backend
- **FastAPI**: Modern web framework
- **SQLAlchemy**: ORM for database
- **Pydantic**: Data validation
- **psycopg2**: PostgreSQL adapter
- **python-dotenv**: Environment variables

### Frontend
- **Flask**: Web framework
- **Bootstrap 5**: UI framework
- **Requests**: HTTP client
- **Jinja2**: Templating engine

### Database
- **PostgreSQL**: Relational database

## 🔄 Development Workflow

### Add New Feature (e.g., Courses)

1. **Create Backend Module**
   ```
   app/courses/
   ├── __init__.py
   ├── models.py
   ├── schemas.py
   ├── crud.py
   └── routes.py
   ```

2. **Register Routes in app/main.py**
   ```python
   from app.courses.routes import router as course_router
   app.include_router(course_router)
   ```

3. **Create Frontend Templates**
   ```
   frontend/templates/
   ├── courses_list.html
   ├── add_course.html
   └── course_detail.html
   ```

4. **Update Frontend Routes (app.py)**
   ```python
   @app.route('/courses')
   def courses():
       # Your code here
   ```

## 📝 Future Enhancements

- ✅ Instructors/Teachers Module
- ✅ Courses Management
- ✅ Enrollments
- ✅ Assignments
- ✅ Grades Tracking
- ✅ Attendance System
- ✅ Notifications
- ✅ User Authentication
- ✅ Payment Integration
- ✅ Analytics & Reports

## 🐛 Troubleshooting

### Backend Won't Start
- Ensure PostgreSQL is running
- Check `DATABASE_URL` in `.env`
- Verify all dependencies are installed: `pip install -r requirements.txt`

### Frontend Shows Connection Error
- Verify backend is running on port 8000
- Check firewall settings
- Ensure `.env` file exists with correct database URL

### Database Connection Failed
- PostgreSQL service is not running
- Wrong credentials in `DATABASE_URL`
- Database `lms_db` doesn't exist

### Port Already in Use
- Change port in command: `--port 8001`
- Or kill process using port: `lsof -ti:8000 | xargs kill -9`

## 📚 Additional Resources

- FastAPI Docs: https://fastapi.tiangolo.com/
- Flask Docs: https://flask.palletsprojects.com/
- SQLAlchemy Docs: https://docs.sqlalchemy.org/
- PostgreSQL Docs: https://www.postgresql.org/docs/

## 👥 Support

For issues or questions, please check:
1. Error messages in terminal
2. Application logs
3. API documentation at `/docs`

---

**Status**: Development Mode ✅
**Last Updated**: January 30, 2026
