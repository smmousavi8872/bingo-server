
# Bingo Cards API (Go)

Minimal Go server that serves `cards.json` for your Android client.

## Endpoints
- `GET /health` → `{"status":"ok"}`
- `GET /cards` → streams `cards.json`

## Run locally
```bash
go run .
# http://localhost:8000/health
# http://localhost:8000/cards
```

## Docker (local)
```bash
docker build -t bingo-server .
docker run --rm -p 8000:8000 bingo-server
```

## Deploy to Koyeb
1. Push these files to the **repo root**.
2. In Koyeb → Create App → Web Service → From GitHub.
3. Builder: **Dockerfile**
   - Build context: `/` (repo root)
   - Dockerfile path: `Dockerfile` (no leading slash)
4. Deploy. You’ll get `https://<app>.koyeb.app/`.
   - `GET /health`
   - `GET /cards`

### Environment
- `PORT` is set by Koyeb automatically.
- `CARDS_FILE` (optional): override JSON path (default `/app/cards.json`).

## Notes
- Keep `cards.json` at repo root and **not** in `.dockerignore`.
