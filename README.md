
# Cards API (Go)

Serve your `cards.json` over HTTP for the Android client.

## Endpoints
- `GET /health` → `{"status":"ok"}`
- `GET /cards` → contents of `cards.json`

## Run locally
```bash
cd server-go
go run .
# Then browse http://localhost:8000/cards
```

## Build a binary
```bash
go build -o cards-api .
./cards-api
```

## Docker
```bash
docker build -t cards-api-go:latest .
docker run --rm -p 8000:8000 cards-api-go:latest
```

## Deploy to Koyeb (two ways)

### A) Buildpack (no Docker needed)
1. Push this folder to GitHub as a repository (e.g., `cards-api-go`).
2. On Koyeb: Create App → Web Service → from GitHub.
3. Runtime: **Go** (auto-detected).
4. Command (Start): leave empty (Koyeb runs the built binary) *or* set to `./cards-api`.
   - Ensure your repo root contains `main.go` and `go.mod` (it does).
5. Deploy. Your app will be available at `https://<app>.koyeb.app/`

### B) Docker
1. Push repo to GitHub.
2. On Koyeb: Create App → Web Service → select Dockerfile from repo.
3. Deploy.
4. Service will expose:
   - `GET /health`
   - `GET /cards`

## Android baseUrl
Use the public Koyeb URL, e.g.:
```kotlin
baseUrl("https://<app>.koyeb.app/")
```

## Notes
- CORS is open (`*`) for dev convenience.
- Server uses `$PORT` if provided (Koyeb sets it), default 8000.
