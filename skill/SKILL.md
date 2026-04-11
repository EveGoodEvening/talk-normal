---
name: talk-normal
slug: talk-normal
description: Stop LLM slop. A 17-rule system prompt that cuts verbose, corporate-sounding LLM output by 56-71% (measured) while preserving information. Works bilingually (English + Chinese). Installs into your AGENTS.md as an always-on behavior modifier.
version: 0.3.0
tags: [prompt, anti-slop, concise, system-prompt, chinese, bilingual, always-on]
homepage: https://github.com/hexiecs/talk-normal
license: MIT
---

# talk-normal

A 17-rule system prompt that stops your LLM from writing like a LinkedIn post. Measured: 71% character reduction on GPT-4o-mini, 56% on GPT-5.4, across 10 prompts in English and Chinese, without losing information.

## What this skill does

When invoked, this skill installs the talk-normal rules into your workspace's `AGENTS.md` file as an always-on behavior modifier. After install, every reply your OpenClaw agent produces follows the 17 rules. The rules live between `# --- talk-normal BEGIN ---` and `# --- talk-normal END ---` markers so they do not conflict with your existing rules in `AGENTS.md`.

This is not a workflow skill you invoke per turn. It is a one-time installer that makes your agent permanently less verbose until you uninstall.

## How to run

To install or update talk-normal in the current workspace:

```bash
bash install.sh
```

The script is idempotent: running it again replaces the existing talk-normal block in place with the latest rules. Nothing else in your `AGENTS.md` is touched.

To remove:

```bash
bash install.sh --uninstall
```

## What gets installed

The contents of `prompt.md` get injected into your `AGENTS.md`. The rules cover:

1. Lead with the answer, then add context only if it helps
2. Kill filler phrases: "Great question", "I'd be happy to", "It's worth noting", "Certainly", "让我们一起来看看", "综上所述"
3. Never restate the question
4. Yes/no questions get a direct answer plus one sentence
5. Comparisons give a recommendation, not a balanced essay
6. Code answers give the code, explain only if non-trivial
7. Explanations cap at 3-5 sentences for conceptual questions
8. Structure (bullets, numbered steps) only when the content has natural structure, not as decoration
9. Match depth to complexity
10. No hypothetical follow-up offers and no conditional next-step menus
11. No plain-language restatements ("翻成人话", "in other words")
12. End with a concrete recommendation, no "In summary" / "Hope this helps" closings
13. Pros/cons: max 3-4 points per side
14. No "不是X，而是Y" / reject-then-correct framing in any variant
15. Plus additional rules covering bullet overuse, corporate tone, hedging

## Updating to the latest rules

```bash
clawhub update talk-normal
bash install.sh
```

The first command pulls the latest skill bundle from ClawHub. The second command re-runs the idempotent installer, replacing the old rule block in `AGENTS.md` with the new one.

## Compatibility

Works on any LLM that honors system prompts or custom instructions: GPT-5.4, GPT-4o-mini, Claude 4.6, Gemini 2.5, Grok 3, Qwen 3, DeepSeek V3, and others. OpenClaw integration is via `AGENTS.md` injection, which the agent reads on every turn.

## Measured effect

Full benchmark data for 10 prompts across GPT-4o-mini and GPT-5.4 is in `TEST_RESULTS.md` in the upstream repository. Average reduction: 71% on GPT-4o-mini, 56% on GPT-5.4, while preserving the information content of the original response.

## Upstream and issues

- Source: https://github.com/hexiecs/talk-normal
- Issues and rule suggestions: https://github.com/hexiecs/talk-normal/issues
- Contributing: see `CONTRIBUTING.md` in the upstream repo for the rule-submission format

## License

MIT
