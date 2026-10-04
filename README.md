# 🚀 Autonomous Career Suite

> **An end-to-end, AI-powered autonomous job discovery, triage, resume tailoring, and application tracking pipeline.**

[![License: MIT](https://img.shields.io/badge/License-MIT-blue.svg)](LICENSE)
[![Python 3.10+](https://img.shields.io/badge/Python-3.10+-3776AB.svg?logo=python&logoColor=white)](https://python.org)
[![FastMCP](https://img.shields.io/badge/Protocol-FastMCP-4B32C3.svg)](https://github.com/jlowin/fastmcp)
[![Notion API](https://img.shields.io/badge/Integration-Notion%20API-000000.svg?logo=notion&logoColor=white)](https://developers.notion.com)
[![Claude & Cursor](https://img.shields.io/badge/AI%20Clients-Claude%20%7C%20Cursor-D97706.svg?logo=anthropic&logoColor=white)](https://claude.ai)

---

## 🌟 The Vision

Landing high-impact software engineering roles requires speed, personalization, and meticulous tracking. Most candidates burn out manually scraping job boards, copy-pasting resumes, and losing track of applications.

The **Autonomous Career Suite** completely automates this lifecycle by linking three decoupled, production-grade microservices into an intelligent closed-loop agent pipeline:

```text
┌────────────────────────────────────────────────────────────────────────┐
│  1. JOB DISCOVERY INBOX (Scraper & Dynamic Scorer)                     │
│  • Precision ATS search dorks (Personio, Greenhouse, Lever, Ashby)     │
│  • Profile-driven scoring engine (profile.yaml)                        │
│  • Zero-duplicate persistent cache (seen_jobs.json)                    │
└───────────────────────────────────┬────────────────────────────────────┘
                                    │ Pushes matching leads as 'New'
                                    ▼
┌────────────────────────────────────────────────────────────────────────┐
│  2. NOTION TRACKER MCP (Claude / Cursor Integration Layer)             │
│  • Model Context Protocol (FastMCP) server                             │
│  • Dual-database architecture: Discovery Inbox + Active Applications   │
│  • Interactive AI triage ('list_discovered_jobs', 'run_job_scout')     │
└───────────────────────────────────┬────────────────────────────────────┘
                                    │ Trigger application & CV tailoring
                                    ▼
┌────────────────────────────────────────────────────────────────────────┐
│  3. OVERLEAF CV AGENT (Headless CLSI Cloud Compiler)                   │
│  • Deep JD keyword & skill analysis                                    │
│  • Headless LaTeX compilation via Overleaf CLSI engine                 │
│  • Attaches tailored 1-page PDF to Notion & logs status 'Applied'      │
└────────────────────────────────────────────────────────────────────────┘
```

---

## 📦 The 3 Pillars

| Component | Repository | Description | Key Technologies |
| :--- | :--- | :--- | :--- |
| **1. Job Discovery Inbox** | [`job-discovery-inbox`](https://github.com/AhmedKhalifa3/job-discovery-inbox) | Autonomous ATS scraper & dynamic scoring engine that scans unlisted job boards and APIs. | `Python`, `ddgs`, `PyYAML`, `requests`, `Notion API` |
| **2. Notion Tracker MCP** | [`notion-tracker-mcp`](https://github.com/AhmedKhalifa3/notion-tracker-mcp) | Model Context Protocol server exposing Notion databases to Claude Desktop & Cursor. | `Python`, `FastMCP`, `notion-client`, `mcp` |
| **3. Overleaf CV Agent** | [`overleaf-cv-agent`](https://github.com/AhmedKhalifa3/overleaf-cv-agent) | Headless Overleaf CLSI cloud compiler for generating tailored 1-page LaTeX resumes. | `Python`, `httpx`, `BeautifulSoup4`, `LaTeX`, `CLSI` |

---

## ⚡ Quickstart

### 1. Clone the Entire Suite (Including Submodules)

```bash
git clone --recurse-submodules https://github.com/AhmedKhalifa3/autonomous-career-suite.git
cd autonomous-career-suite
```

*(If you already cloned without submodules, run: `git submodule update --init --recursive`)*

---

### 2. Configure Environment Variables

Copy the global configuration template:

```bash
cp .env.example .env
```

Fill in your API keys in `.env`:
* **`NOTION_API_KEY`**: Your Notion integration internal token.
* **`NOTION_DATABASE_ID`**: Main Applications database ID.
* **`NOTION_DISCOVERED_JOBS_DB_ID`**: Discovery Inbox database ID.
* **`OVERLEAF_PROJECT_ID`**: Your Overleaf resume project ID.
* **`OVERLEAF_SESSION_COOKIE`**: Your Overleaf authenticated session cookie.

---

### 3. Setup All 3 Components

Run the automated setup script:

```bash
chmod +x quickstart.sh
./quickstart.sh
```

Or manually initialize each module:

```bash
# 1. Job Discovery Inbox
cd job-discovery-inbox
python3 -m venv .venv && source .venv/bin/activate
pip install -r requirements.txt
cp profile.example.yaml profile.yaml
cd ..

# 2. Notion Tracker MCP
cd notion-tracker-mcp
python3 -m venv .venv && source .venv/bin/activate
pip install -r requirements.txt
cd ..

# 3. Overleaf CV Agent
cd overleaf-cv-agent
python3 -m venv .venv && source .venv/bin/activate
pip install -r requirements.txt
cd ..
```

---

## 🤖 Claude Desktop & Cursor Integration

Add `notion-tracker-mcp` to your Claude Desktop configuration (`~/.config/Claude/claude_desktop_config.json` on Linux, `~/Library/Application Support/Claude/claude_desktop_config.json` on macOS):

```json
{
  "mcpServers": {
    "notion-job-tracker": {
      "command": "/absolute/path/to/autonomous-career-suite/notion-tracker-mcp/.venv/bin/python",
      "args": ["/absolute/path/to/autonomous-career-suite/notion-tracker-mcp/server.py"],
      "env": {
        "NOTION_API_KEY": "secret_your_notion_key",
        "NOTION_DATABASE_ID": "your_applications_db_id",
        "NOTION_DISCOVERED_JOBS_DB_ID": "your_discovery_inbox_db_id"
      }
    }
  }
}
```

Now Claude Desktop and Cursor can directly execute the full discovery, triage, and application cycle in conversation!

---

## 🔄 Daily Workflow Walkthrough

1. **Scout for New Roles:**
   Tell Claude:
   > *"Claude, run job scout for the past 24 hours."*  
   *`scout.py` searches Personio, Greenhouse, Lever, and Ashby, matches postings against your `profile.yaml`, and pushes approved leads directly to Notion.*

2. **Triage Fresh Leads:**
   Tell Claude:
   > *"Check my Job Discovery Inbox using `list_discovered_jobs` and show me the fresh leads."*  
   *Claude displays the table, summarizes match fit, and flags any outliers.*

3. **Dismiss or Tailor:**
   Tell Claude:
   > *"Dismiss lead #2. For lead #1, tailor my CV and compile the PDF via Overleaf."*  
   *The agent updates Notion status to `Dismissed` for #2, compiles a tailored PDF for #1, creates an application entry, and attaches the compiled resume.*

---

## 📄 License

This suite is open-source under the [MIT License](LICENSE).
Built with ❤️ by [Ahmed Khalifa](https://github.com/AhmedKhalifa3).
