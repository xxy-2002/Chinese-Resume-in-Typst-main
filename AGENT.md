# Project Notes

## Project Identity

- This repository is the owner's personal resume repository.
- The resume is written in Typst and targets Chinese resume layouts.
- Treat personal information, photos, contact details, company names, and exported resume files as sensitive.

## Main Files

- `resume.typ`: default resume entry file, currently based on the template example.
- `template.typ`: shared Typst resume template and layout helpers.
- `simple-resume.typ`: simpler standalone resume example.
- `2025_12.typ` and `2025_12 copy.typ`: dated resume variants.
- `profile.jpg` and `照片.jpg`: personal photo assets.
- `icons/`: SVG and image assets used by the resume.
- `examples/`: reference screenshots and sample output.
- `*.pdf` / `*.png`: exported resume artifacts.

## Editing Rules

- Preserve existing resume content unless the user explicitly asks to revise it.
- Keep changes small and reviewable; avoid broad template rewrites for content-only requests.
- Do not invent or alter personal facts. If content is missing, leave a clear placeholder or ask for the exact value.
- Prefer editing Typst source files over generated PDF/PNG outputs.
- Do not add new dependencies unless explicitly requested.
- Keep the repository suitable for a private personal resume workflow.

## Typst Workflow

- Compile the main resume with:

  ```sh
  typst compile resume.typ resume.pdf
  ```

- Compile a dated variant with:

  ```sh
  typst compile 2025_12.typ 2025_12.pdf
  ```

- If Typst is unavailable locally, verify changes by syntax review and report that compilation was not run.

## Agent Notes

- This repo may contain real personal information. Avoid exposing unnecessary details in summaries.
- When reporting changes, mention the files changed and any verification performed.
- For design tweaks, keep the existing compact professional resume style unless the user requests a new direction.
