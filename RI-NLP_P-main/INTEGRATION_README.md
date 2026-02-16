# 🚀 NLP + Backend Integration - Quick Start

## ✅ Setup Complete!

Your integration is ready! I've configured everything for you.

---

## 📁 What Was Created

✅ **`.env`** - Configuration file with backend URL  
✅ **`start_backend.ps1`** - Script to start backend (Port 8000)  
✅ **`start_nlp.ps1`** - Script to start NLP service (Port 8001)  
✅ **`test_integration.ps1`** - Script to test integration

---

## 🚀 How to Run (3 Simple Steps)

### **Step 1: Start Backend** (Terminal 1)

```powershell
cd c:\Users\ahmed\OneDrive\Desktop\RI-NLP_P-main
.\start_backend.ps1
```

Wait until you see: `Uvicorn running on http://0.0.0.0:8000`

---

### **Step 2: Start Ollama** (Terminal 2)

```powershell
ollama serve
```

Keep this running in the background.

---

### **Step 3: Start NLP Service** (Terminal 3)

```powershell
cd c:\Users\ahmed\OneDrive\Desktop\RI-NLP_P-main
.\start_nlp.ps1
```

Wait until you see: `Uvicorn running on http://0.0.0.0:8001`

---

### **Step 4: Test Integration** (Terminal 4 - Optional)

```powershell
cd c:\Users\ahmed\OneDrive\Desktop\RI-NLP_P-main
.\test_integration.ps1
```

This will automatically test:
- ✓ Backend health
- ✓ NLP service health  
- ✓ Integration (NLP calling backend)

---

## 🌐 Access Points

Once running, you can access:

| Service | URL | Description |
|---------|-----|-------------|
| **Backend API** | http://localhost:8000/docs | Backend Swagger UI |
| **NLP API** | http://localhost:8001/docs | NLP Swagger UI |
| **Backend Health** | http://localhost:8000/api/v1/health | Backend status |
| **NLP Health** | http://localhost:8001/health | NLP status |

---

## 🧪 Manual Testing

### Test NLP Query

```powershell
$body = @{
    query = "Show me KPIs for shelf_zone_1"
    conversation_id = "test-123"
    user_role = "manager"
} | ConvertTo-Json

Invoke-RestMethod -Uri "http://localhost:8001/nlp/query" `
    -Method Post `
    -ContentType "application/json" `
    -Body $body
```

---

## 🎯 What Happens

```
User Query → NLP Service (8001) → Backend API (8000) → Database → Response
```

**Example Flow:**
1. You ask: "Show me KPIs for shelf_zone_1"
2. NLP classifies intent: `kpi_query`
3. NLP extracts slots: `{branch_id: "shelf_zone_1"}`
4. NLP calls: `http://localhost:8000/api/v1/kpis?branch_id=shelf_zone_1`
5. Backend returns real KPI data
6. NLP generates natural language response
7. You receive: "Here are the KPIs for shelf_zone_1..."

---

## 📊 Configuration

The `.env` file contains:

```env
# Backend Integration
CORE_API_BASE_URL=http://localhost:8000

# NLP Service Port
API_PORT=8001

# LLM Configuration
USE_LLM=true
LLM_PROVIDER=ollama
LLM_MODEL=llama3.2:3b
```

---

## 🛠️ Troubleshooting

### Backend won't start
- Check PostgreSQL is running
- Verify database exists: `retail_ai`
- Check `.env` in backend folder

### NLP won't start
- Make sure Ollama is running: `ollama serve`
- Check model is downloaded: `ollama list`
- Verify `.env` exists in NLP folder

### Integration not working
- Ensure both services are running
- Check logs in both terminals
- Run `.\test_integration.ps1` to diagnose

---

## 🎙️ Voice Chat

Once integration is working, try voice chat:

```powershell
cd c:\Users\ahmed\OneDrive\Desktop\RI-NLP_P-main
python voice_chat.py
```

---

## ✅ Next Steps

1. **Start all services** using the scripts above
2. **Test integration** with `.\test_integration.ps1`
3. **Try voice chat** with `python voice_chat.py`
4. **Build your frontend** that calls the NLP API

---

**Your NLP service is now integrated with your backend!** 🎉
