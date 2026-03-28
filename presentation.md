---
author: Hachem Betrouni | BIGmama Technology | Hyko.ai
date: ""
paging: "%d / %d"
---

# Hachem Betrouni

**CTO at BIGmama Technology**

*Hyko.ai*

Building AI agents across different industries

---

## Who we build for

* **Authors**: Alexandre Jardin -- research assistance, content generation, fact-checking
* **Journalists**: newsletter automation, information collection, translation, source monitoring
* **Entrepreneurs**: competition analysis, menu suggestion, market trend tracking
* **Politicians**: online persona management, sentiment analysis, constituent outreach
* **Legal professionals**: contract review, case research, regulatory monitoring

---

## Agenda

1. General overview
2. Main AI agent components
3. Demo: let's build AI agents
4. How to integrate agents in your organization
5. Shortcomings of agents
6. Next steps

---

## Timeline

**2017** - First paper on LLMs from Google (Attention Is All You Need)

**2022** - OpenAI releases ChatGPT and it disrupts the market
  - Hype builds up
  - Everyone becomes a prompt engineer

**2025** - GPT-5 hits a wall of scaling
  - Focus switches to delivering value
  - Cheaper Chinese models (DeepSeek)
  - Open-source models catching up (Llama, Mistral)
  - MCP protocol standardizes tool integration

**2026** - Year of AI agents
  - Autonomous AI weaponry
  - Mass surveillance
  - LLMs and robots
  - Start of AI agent operational value
  - Rise of privacy concerns
  - Regulation scramble across governments

---

## Really, what is an AI agent?

A **language model** (core engine):

```
┌──────────────┐     ┌─────────────────────────────────┐     ┌───────────────────┐     ┌──────────────┐
│  Input Text  │────▶│  Language Model                 │────▶│  P(next word)     │────▶│  Output Text │
│              │     │  (Weights from training data)   │     │  probability      │     │              │
└──────────────┘     └─────────────────────────────────┘     └───────────────────┘     └──────────────┘
```

That becomes an **agent** when you add:

* Access to **tools** (search, databases, APIs, browsers, code execution)
* A **loop** (reason → act → observe → repeat)
* A **goal** (task to accomplish autonomously)

---

## Agent architecture

```
                         ┌─────────────┐
                         │ User Query  │
                         └──────┬──────┘
                                │
                                ▼
                    ┌───────────────────────┐
               ┌───▶│   AI Agent (LLM)      │
               │    └───────────┬───────────┘
               │                │
               │                ▼
               │       ┌────────────────┐
               │       │  Select Tool   │
               │       └───┬───┬───┬────┘
               │           │   │   │
               │    ┌──────┘   │   └──────┐
               │    ▼          ▼          ▼
               │ ┌────────┐ ┌──────┐ ┌─────────┐
               │ │  Web   │ │  DB  │ │ Browser │
               │ │ Search │ │Query │ │ Action  │
               │ └───┬────┘ └──┬───┘ └────┬────┘
               │     │         │          │
               │     └─────┬───┘──────────┘
               │           ▼
               │    ┌──────────────┐
               │    │   Process    │
               │    │   Results    │
               │    └──────┬───────┘
               │           │
               │           ▼
               │      ┌─────────┐    Yes   ┌────────────────┐
               │      │  Done?  │─────────▶│ Final Response │
               │      └────┬────┘          └────────────────┘
               │           │ No
               └───────────┘
```

---

## Demo

Let's build a few agents with **Hyko.ai**

* Site security audit
* Competition analysis

---

## Use cases AI agents are good at

* Reporting and summarization tasks
* Information search (archive lookup)
* Formating and filling forms
* Repetitive clicking tasks (browser automation, form fill-up)
* Using text based interfaces (cli, api, code)

---

## AI agents are not good at

* General problem solving
* Complex orchestration
* Deploying expertise
* Knowing what is correct
* Using graphical based interfaces

---

## Building your AI agent strategy

* **Preserve your know-how** -- encode institutional knowledge before it walks out the door
* **Scale operations** -- handle 10x the volume without 10x the headcount
* **Free time for strategic work** -- remove repetitive tasks from expert employees
* **Decrease reliance on human resources** -- no sick leaves, burnouts, and trust issues
* **Improve consistency** -- same process, same quality, every time
* **Accelerate onboarding** -- new hires get AI-assisted ramp-up

---

## Importance of security in this age

* Countries building mass surveillance centers
* Better persona profiling through aggregated data
* Leaking strategic information and expertise through AI tools
* Larger attack surface on agents with lower penetration barrier
* Automated cyber attacks with AI agents
* Prompt injection and data exfiltration risks
* Supply chain risks from third-party AI providers

---

## Where to start

1. **Identify** use cases and procedures worth automating
2. **Start with POC** and simple, low-risk tasks
3. **Complexify** as you go -- add tools and workflows incrementally
4. **Use tools with low vendor locking** -- prefer open standards (MCP, open-source models, .txt formats)
5. **Scan your archive** -- your existing data is the most valuable asset
6. **Hire people** familiar with AI and capable of adapting
7. **Measure ROI** -- track time saved, error reduction, throughput gains
8. **Adapt tools** -- adapt internal tool to allow for easy AI integration

> checkout *Super Papillon* - a book about transformation in the age of AI

---

# Let's build your AI agent strategy

**Contact:**

`hk@big-mama.io` Hadj Khelil CEO
`hb@big-mama.io` Hachem Betrouni CTO
