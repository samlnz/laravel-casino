# Frontend preview

This directory contains a small static UI to preview the look-and-feel of the Laravel Casino frontend.

How to preview locally:
- Open `frontend/index.html` in your browser, or serve the directory with a static server (e.g. `npx serve frontend`).

Deployment notes:
- For Railway you can either deploy this as a static site or use the included Dockerfile.
- If you want a React/Vite frontend instead, I can add that (larger, requires a build step).

Connect to backend:
- The UI is static placeholder. Update fetch/API endpoints in the UI to point to your Laravel backend when ready.