# 🚀 Autonomous Career Suite

> **An end-to-end, AI-powered autonomous job discovery, triage, resume tailoring, and application tracking pipeline.**

[![License: MIT](https://img.shields.io/badge/License-MIT-blue.svg)](LICENSE)
[![Python 3.10+](https://img.shields.io/badge/Python-3.10+-3776AB.svg?logo=python&logoColor=white)](https://python.org)
[![CustomTkinter GUI](https://img.shields.io/badge/UI-CustomTkinter-blueviolet.svg)](https://github.com/TomSchimansky/CustomTkinter)
[![FastMCP](https://img.shields.io/badge/Protocol-FastMCP-4B32C3.svg)](https://github.com/jlowin/fastmcp)
[![Notion API](https://img.shields.io/badge/Integration-Notion%20API-000000.svg?logo=notion&logoColor=white)](https://developers.notion.com)
[![Claude & Cursor](https://img.shields.io/badge/AI%20Clients-Claude%20%7C%20Cursor-D97706.svg?logo=anthropic&logoColor=white)](https://claude.ai)

---

## 🌟 The Vision

Landing high-impact software engineering roles requires speed, personalization, and meticulous tracking. Most candidates burn out manually scraping job boards, copy-pasting resumes, and losing track of applications.

The **Autonomous Career Suite** completely automates this lifecycle by linking four decoupled, production-grade microservices into an intelligent closed-loop agent pipeline:

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
│  NOTION DUAL-DATABASE BACKBONE                                         │
│  • Database 1: Job Discovery Inbox (Triage & Match Fit)                │
│  • Database 2: Active Applications Tracker (Stages, Dates, Resumes)    │
└──────────────────┬──────────────────────────────────┬──────────────────┘
                   │ Synchronized                     │ MCP Protocol
                   ▼                                  ▼
┌──────────────────────────────────────┐ ┌───────────────────────────────┐
│  2. CAREER COCKPIT GUI               │ │  3. NOTION TRACKER MCP        │
│  (Desktop Mission Control)           │ │  (Claude / Cursor Integration)│
│  • CustomTkinter dark-mode desktop app│ │  • FastMCP server interface  │
│  • Sub-25ms debounced search & filter│ │  • Interactive AI triage tool │
│  • 1-Click Notion promotion & triage │ │  • Run scout & inspect leads  │
│  • Embedded scout runner & live logs │ │                               │
└──────────────────┬───────────────────┘ └───────────────┬───────────────┘
                   │                                     │ Trigger CV tailoring
                   └──────────────────┬──────────────────┘
                                      ▼
┌────────────────────────────────────────────────────────────────────────┐
│  4. OVERLEAF CV AGENT (Headless CLSI Cloud Compiler)                   │
│  • Deep JD keyword & skill analysis                                    │
│  • Headless LaTeX compilation via Overleaf CLSI engine                 │
│  • Attaches tailored 1-page PDF to Notion & logs status 'Applied'      │
└────────────────────────────────────────────────────────────────────────┘
```

---

## 📦 The 4 Pillars

| Component | Repository | Description | Key Technologies |
| :--- | :--- | :--- | :--- |
| **1. Job Discovery Inbox** | [`job-discovery-inbox`](https://github.com/AhmedKhalifa3/job-discovery-inbox) | Autonomous ATS scraper & dynamic scoring engine scanning unlisted job boards and ATS APIs. | `Python`, `ddgs`, `PyYAML`, `requests`, `Notion API` |
| **2. Career Cockpit GUI** | [`career-dashboard-gui`](https://github.com/AhmedKhalifa3/career-dashboard-gui) | Native desktop mission control for rapid manual lead triage, one-click promotion, live scout runs, and profile editing. | `Python`, `CustomTkinter`, `notion-client`, `Dark Theme` |
| **3. Notion Tracker MCP** | [`notion-tracker-mcp`](https://github.com/AhmedKhalifa3/notion-tracker-mcp) | Model Context Protocol server exposing Notion databases to Claude Desktop & Cursor. | `Python`, `FastMCP`, `notion-client`, `mcp` |
| **4. Overleaf CV Agent** | [`overleaf-cv-agent`](https://github.com/AhmedKhalifa3/overleaf-cv-agent) | Headless Overleaf CLSI cloud compiler for generating tailored 1-page LaTeX resumes. | `Python`, `httpx`, `BeautifulSoup4`, `LaTeX`, `CLSI` |

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

### 3. Setup All 4 Components

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

# 2. Career Cockpit GUI (Desktop App)
cd career-dashboard-gui
python3 -m venv .venv && source .venv/bin/activate
pip install -r requirements.txt
./install_desktop_app.sh   # Installs system launcher & desktop menu entry
cd ..

# 3. Notion Tracker MCP
cd notion-tracker-mcp
python3 -m venv .venv && source .venv/bin/activate
pip install -r requirements.txt
cd ..

# 4. Overleaf CV Agent
cd overleaf-cv-agent
python3 -m venv .venv && source .venv/bin/activate
pip install -r requirements.txt
cd ..
```

---

## 🖥️ Career Cockpit Desktop App

You can launch the visual triage station directly:

```bash
cd career-dashboard-gui
./run.sh
```

Or hit your system Super key and launch **Career Cockpit** from your applications menu.

* **Sub-25ms debounced search & tag filters** across roles, companies, locations, and match scores.
* **1-Click promotion (`🚀 Move to Applications`)** to seamlessly promote leads to your tracking board.
* **Built-in Job Scout runner** with real-time streaming console logs.
* **Interactive Profile Editor (`⚙️ Profile`)** to tune keywords, seniority, and preferences without touching raw YAML files.

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

Choose between rapid desktop triage or full autonomous AI conversation:

### Workflow A: Visual Desktop Cockpit
1. **Launch Cockpit:** Open `Career Cockpit` from your app menu or `./run.sh`.
2. **Trigger Scout:** Click **`▶ Run Job Scout`** to scrape ATS boards and score new postings against `profile.yaml`.
3. **Filter & Triage:** Inspect match scores, read full descriptions, and dismiss or archive irrelevant roles.
4. **1-Click Promote:** Click **`🚀 Move to Applications`** to graduate the role to your active Kanban application tracker.

### Workflow B: Autonomous Agent (Claude / Cursor)
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
