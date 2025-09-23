# Python Introduction

This folder contains a small example Python project that demonstrates basic Python usage and how to run the project locally or as a container.

## What is Python?

Python is a high-level, interpreted programming language known for its readability, concise syntax, and broad ecosystem of libraries. It's widely used for scripting, automation, data analysis, web development, and more. This project uses Python to demonstrate a tiny, reproducible example you can run locally or inside a Docker container.

## What is a Regular expression?

A regular expression (regex) is a compact way to describe patterns in text. Regexes are used to search, validate, extract, and transform text. They are widely supported across languages; in Python the `re` module provides regex functionality.

Key concepts:

- Literals: match exact characters, e.g. `cat` matches the substring "cat".
- Character classes: `[abc]` matches `a`, `b`, or `c`; `\d` matches any digit (0-9); `\w` matches word characters (letters, digits, underscore); `\s` matches whitespace.
- Quantifiers: `*` (0 or more), `+` (1 or more), `?` (0 or 1), `{m,n}` (between m and n times).
- Anchors: `^` (start of string/line), `$` (end of string/line).
- Groups & captures: `(...)` groups and captures text; `(?:...)` groups without capturing.
- Alternation: `a|b` matches `a` or `b`.

Common examples (Python):

- Find all numbers in a string:

```python
import re
s = "Order 42, item 7, total 125.50"
numbers = re.findall(r"\d+(?:\.\d+)?", s)
# ['42', '7', '125.50']
```

- Validate a simple email (not exhaustive but practical):

```python
import re
pattern = re.compile(r"^[\w\.-]+@[\w\.-]+\.[A-Za-z]{2,}$")
bool(pattern.match("user@example.com"))  # True
```

- Split CSV-like lines (simple, not full CSV parsing):

```python
import re
line = 'one, two, "three, still three",four'
parts = re.findall(r'"[^"]*"|[^,]+', line)
parts = [p.strip(' "') for p in parts]
```

Notes for using regex in Python:

- Always use raw strings for patterns (prefix with `r'...'`) to avoid double-escaping backslashes.
- Use `re.compile()` if you reuse a pattern; it's slightly faster and clearer.
- Use flags like `re.IGNORECASE`, `re.MULTILINE`, or `re.DOTALL` to modify matching behavior.
- Prefer `csv` module for robust CSV parsing instead of regex when dealing with arbitrary CSV files.

Quick reference patterns:

- `^...$` — full-string match
- `\d+` — one or more digits
- `\w+` — one or more word characters
- `[^,]+` — one or more characters that are not commas
- `(\d{4}-\d{2}-\d{2})` — capture an ISO date like 2020-12-31

Testing and debugging:

- Use online testers (for example regex101.com) to experiment with patterns and get explanations.
- If you get unexpected results in Python, print `repr()` of the pattern and test strings to reveal hidden characters.
- When performance matters, avoid catastrophic backtracking by using non-greedy quantifiers (`*?`, `+?`) or more specific character classes.

Example: using regex in this project

If `main.py` needs to extract structured data from `input.txt`, a small compiled regex can make the parsing clear and testable. For simple CSV or table-like data prefer the `csv` module; use regex for log parsing, validation, or small transforms.

## Project summary

Files in this folder:

- `main.py` — tiny example script that reads `input.txt` and writes `output.csv` (simple demonstration).
- `input.txt` — sample input data used by `main.py`.
- `output.csv` — sample output produced by `main.py` (tracked here for convenience).
- `requirements.txt` — Python package dependencies required to run the project.
- `Dockerfile` — Dockerfile that builds an image able to run `main.py`.

What the example does

The sample script `main.py` reads lines from `input.txt`, performs a simple transformation or parsing, and writes the results to `output.csv`. The goal is to provide a minimal, runnable example and show how to package it in a container.

## How to create a virtual environment?

Recommended: use the builtin `venv` module to create an isolated environment.

1. Open a terminal in this folder (`Python-introduction`).
2. Create the venv:

```powershell
python -m venv .venv
```

3. Activate the environment (PowerShell):

```powershell
.\.venv\Scripts\Activate.ps1
```

4. Install dependencies:

```powershell
pip install -r requirements.txt
```

Notes:

- On macOS / Linux, activate with `source .venv/bin/activate`.
- If you get execution policy errors in PowerShell when activating, run `Set-ExecutionPolicy -Scope CurrentUser -ExecutionPolicy RemoteSigned -Force` as admin or use the `activate.bat` script from cmd.exe instead.

## How to run the project locally?

With the virtual environment active and dependencies installed, run:

```powershell
python main.py
```

The script will read `input.txt` and write `output.csv` in the same folder. Check `output.csv` for results.

If you don't want to use a virtual environment, you can run it with your system Python after installing dependencies globally (not recommended).

## How to run the project as a container?

This project includes a `Dockerfile` so you can run the script inside a Docker container.

1. Build the image (run from the `Python-introduction` folder):

```powershell
docker build -t python-intro:latest .
```

2. Run the container. The example writes output to the container filesystem; to keep results locally, bind-mount the folder:

```powershell
docker run --rm -v ${PWD}:/app python-intro:latest
```

On Windows PowerShell, `${PWD}` expands to the current path. If you prefer an explicit path replace `${PWD}` with the absolute path to the project folder (for example `d:\Ingeniverse\LearningContainers\Python-introduction`).

## Project structure

```
Python-introduction/
├─ Dockerfile
├─ main.py
├─ input.txt
├─ output.csv
├─ requirements.txt
└─ README.md
```
