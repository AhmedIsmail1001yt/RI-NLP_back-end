# Test Integration
# Run this in Terminal 3 (after both services are running)

Write-Host "========================================" -ForegroundColor Cyan
Write-Host "  Testing NLP + Backend Integration" -ForegroundColor Cyan
Write-Host "========================================" -ForegroundColor Cyan
Write-Host ""

# Test 1: Backend Health
Write-Host "1. Testing Backend Health..." -ForegroundColor Yellow
try {
    $backendHealth = Invoke-RestMethod -Uri "http://localhost:8000/api/v1/health" -Method Get
    Write-Host "Backend is running!" -ForegroundColor Green
    Write-Host ""
} catch {
    Write-Host "Backend is not responding. Make sure it's running on port 8000." -ForegroundColor Red
    Write-Host ""
    exit 1
}

# Test 2: NLP Health
Write-Host "2. Testing NLP Service Health..." -ForegroundColor Yellow
try {
    $nlpHealth = Invoke-RestMethod -Uri "http://localhost:8001/health" -Method Get
    Write-Host "NLP Service is running!" -ForegroundColor Green
    Write-Host ""
} catch {
    Write-Host "NLP Service is not responding. Make sure it's running on port 8001." -ForegroundColor Red
    Write-Host ""
    exit 1
}

# Test 3: Integration Test
Write-Host "3. Testing Integration (NLP -> Backend)..." -ForegroundColor Yellow
Write-Host "   Sending query: Show me KPIs for shelf_zone_1" -ForegroundColor Gray
Write-Host ""

$body = @{
    query = "Show me KPIs for shelf_zone_1"
    conversation_id = "test-integration-123"
    user_role = "manager"
} | ConvertTo-Json

try {
    $response = Invoke-RestMethod -Uri "http://localhost:8001/nlp/query" -Method Post -ContentType "application/json" -Body $body
    
    Write-Host "Integration successful!" -ForegroundColor Green
    Write-Host ""
    Write-Host "Response Details:" -ForegroundColor Cyan
    Write-Host "  Intent: $($response.data.intent)" -ForegroundColor White
    Write-Host "  Confidence: $($response.data.confidence)" -ForegroundColor White
    Write-Host "  Routed to: $($response.data.routed_endpoint)" -ForegroundColor White
    Write-Host "  Sources: $($response.data.sources -join ', ')" -ForegroundColor White
    Write-Host ""
    Write-Host "Full Response:" -ForegroundColor Cyan
    $response | ConvertTo-Json -Depth 10 | Write-Host
    
} catch {
    Write-Host "Integration test failed." -ForegroundColor Red
    Write-Host "Error: $_" -ForegroundColor Red
    Write-Host ""
    exit 1
}

Write-Host ""
Write-Host "========================================" -ForegroundColor Green
Write-Host "  All Tests Passed!" -ForegroundColor Green
Write-Host "========================================" -ForegroundColor Green
