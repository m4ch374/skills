---
name: to-artifact
description: Use when the user asks for an artifact, HTML page, visual, review page or report page, asks to update one, or when a chat answer changes a fact that an artifact from this session shows.
---

# To artifact

The reader uses an artifact to make a decision and to defend it to others who did not see the chat. Each rule below serves one of five needs:

| Need | What the page must do |
|---|---|
| Decide and defend | Give the answer and the evidence a sceptical reviewer needs |
| Verify the agent's work | Show the source of every claim |
| Understand the mechanism | Explain how it works step by step with real numbers |
| Keep the design minimal | Justify each part, and cut what does not serve the question |
| Low reading effort | Make the page readable cold, without the chat |

## Before you write

Load `artifact-design` (or run the Artifact `quickstart`) as the Artifact tool requires. This skill adds content rules on top of it.

Read the `show-me` skill. If it does not exist, suggest that the user installs it with `npx skills humanlayer/skills@show-me`, and use the table in rule 3 for now.

## Page rules

1. **Verdict first, with both sides.** The top of the page states the answer: root cause, main fix, recommendation, or which option wins. Directly under it, show what each option does better and the open risks.
2. **Readable cold.** A reader who never saw the chat, or who returns after a few days, gets what this is about, why it matters, where it stands and what decision is next from the first screen.
3. **Show, don't write.** Use flows, charts, colour, tabs, hover cards, popovers and modals in place of paragraphs. Keep information density high and text density low.
   - No visible paragraph over ~40 words.
   - Put detail behind `<details>`, a tab, a popover or a modal.
   - Each section has at least one visual, placed next to the short text it supports.
   - Pick the smallest view that makes the point, as `show-me` shows:

     | Point | View |
     |---|---|
     | Logic or an algorithm | Pseudocode |
     | Runtime control flow | Call tree |
     | UI structure | Component tree with the state and module boundaries that matter |
     | File ownership or a broad refactor | Shallow file tree with a one-line role per entry |
     | Interaction or data flow | Mermaid sequence or flowchart |
     | What changes in an existing shape | `diff` in the same shape as the topic (tree, call stack, state) |
     | Numbers over time or across options | Chart |
     | A copyable target shape | The whole block |

   - Keep only the calls, files, props, states and boundaries needed for the page's question. Use one or a few views per section, not all of them.
4. **Source every claim.** Each number, percentage and finding names where it came from: the code (`file:line`), the query, the data file or the run. For a test or eval, state the method, the input data, and the baseline it is compared to. Show what was dropped or discarded, and why. End with the unknowns you found that the user did not ask about.
5. **Real I/O for every model or tool call.** Show In → Call → Out: the real input example, the system prompt word for word, the arg shape and return type, and the output schema. Quote the real code. No paraphrased prompts.
6. **Explain the mechanism with a worked example.** When the point depends on how something works (a limit, a concurrency rule, a memory cap), walk through it with real numbers, one step per line, so the conclusion follows on its own.
7. **Each part earns its place.** For every box in a flow and every component in a design, give one line on why it exists. If you cannot, flag it as a candidate to remove.
8. **Readable names.** Do not use internal labels such as `A`, `v2` or `ours` without a definition. Rename them, or define each one in one sentence with a concrete example. Describe outputs from the end user's view where it applies.
9. **Colour what changed.** In flows and diagrams, green = new, amber = changed, grey = unchanged, with a legend.
10. **Current state only.** Describe the code or result as it is now. Leave out rounds, "what changed today" and before/after history unless the user asks for a comparison.
11. **Cut what was not asked for.** Each section must help answer the page's one question (the verdict in rule 1). Leave out variants, metrics, methods and checks that do not change that answer, even if you already computed them. If you are not sure, leave it out and offer it in one line in chat. When you remove a section, also remove its published data files (`files: { "<path>": null }`).

## Before you publish

Open the file in the built-in browser pane. Take a screenshot in light mode and in dark mode, and one at mobile width. Fix overlap, clipped text, unreadable colours and empty charts before you publish.

## For the rest of the session

When a chat answer changes a fact the artifact shows, edit and publish it again in the same turn, and say so in one line.
