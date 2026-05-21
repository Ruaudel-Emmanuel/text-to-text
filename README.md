# Text to Text

A local-first n8n workflow project that turns free-form text into structured business output.

## Overview

Text to Text is a practical workflow designed to receive a text message, understand its intent, extract the useful information, apply business rules, and produce an actionable result such as a draft email or a logged business request.

The project was built as a reusable demo for client conversations around AI-powered text processing. It is especially useful for cases such as spontaneous applications, customer requests, booking messages, support tickets, and simple order requests.

## Goal

The main goal is to show that a business can automate part of its manual text handling without building a heavy AI product.

Instead of reading every incoming message by hand, the workflow can:
- classify the request,
- extract key fields,
- check business rules stored in PostgreSQL,
- decide whether clarification is needed,
- generate a professional email,
- log the result for later review.

## Stack

- **n8n** for workflow orchestration
- **Ollama** for running the language model locally
- **PostgreSQL** for business rules and request logs
- **SMTP / Email node** for sending or testing email output

## How it works

1. A user sends a message through a local chat interface.
2. The workflow stores the session context.
3. PostgreSQL provides business rules used to guide the analysis.
4. The local LLM extracts structured data from the message.
5. The workflow checks whether important information is missing.
6. If needed, it asks for clarification.
7. If the request is complete, it generates an email draft.
8. The final result is logged into PostgreSQL.

## Database role

The PostgreSQL database is not the AI itself. It stores:
- business rules (`business_rules_v1`),
- processed requests (`requests_log_v1`),
- and optionally chat memory.

This makes the workflow easier to adapt from one client to another without rebuilding everything from scratch.

## Typical use cases

- Spontaneous job applications
- Customer contact messages
- Booking requests
- Support ticket qualification
- Basic order or quote requests
- Any incoming text that must be turned into clean business data

## Current status

This project is a working prototype and demo foundation.

It is meant to validate a simple idea first:
**text in, useful business output out.**

The architecture can later evolve toward WhatsApp input, richer memory, better routing, or more advanced AI agents if needed.

## Project philosophy

The project is intentionally simple:
- local first,
- pragmatic,
- easy to explain to clients,
- reusable across multiple business cases.

The objective is not to add AI everywhere, but to use AI where it saves time and reduces repetitive manual work.
