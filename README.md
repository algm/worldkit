<div align="center">
   <img src="./media/logo_small.webp" alt="Worldbuilding Kit Logo"/>
   <h1>🌍 Worldbuilding Kit</h1>
   <h3><em>Write better fiction faster.</em></h3>
</div>

<p align="center">
   <strong>An open source toolkit that helps you create rich, consistent worlds and compelling stories using structured worldbuilding and AI-assisted writing.</strong>
</p>

<p align="center">
   <a href="https://github.com/algm/worldkit/actions/workflows/release.yml"><img src="https://github.com/algm/worldkit/actions/workflows/release.yml/badge.svg" alt="Release"/></a>
   <a href="https://github.com/algm/worldkit/stargazers"><img src="https://img.shields.io/github/stars/algm/worldkit?style=social" alt="GitHub stars"/></a>
   <a href="https://github.com/algm/worldkit/blob/main/LICENSE"><img src="https://img.shields.io/github/license/algm/worldkit" alt="License"/></a>
</p>

---

## Table of Contents

- [🤔 What is World-Driven Fiction Writing?](#-what-is-world-driven-fiction-writing)
- [⚡ Get Started](#-get-started)
- [🤖 Supported AI Agents](#-supported-ai-agents)
- [🔧 Worldbuild CLI Reference](#-worldbuild-cli-reference)
- [🌍 Language Support](#-language-support)
- [📚 Core Philosophy](#-core-philosophy)
- [🌟 Writing Phases](#-writing-phases)
- [🎯 Goals](#-goals)
- [🔧 Prerequisites](#-prerequisites)
- [📋 Detailed Process](#-detailed-process)
- [👥 Maintainers](#-maintainers)
- [💬 Support](#-support)
- [📄 License](#-license)

## 🤔 What is World-Driven Fiction Writing?

World-Driven Fiction Writing **flips the script** on traditional storytelling. Instead of jumping straight into writing, you build a solid foundation first: your world's rules, characters, conflicts, and themes. Then you structure your story with clear outlines and chapter breakdowns—before writing a single paragraph.

This methodology transforms how fiction is created: **worldbuilding becomes executable**, directly guiding your writing rather than being discovered along the way.

## ⚡ Get Started

### 1. Install Worldbuild CLI

Choose your preferred installation method:

#### Option 1: Persistent Installation (Recommended)

Install once and use everywhere:

```bash
uv tool install worldbuild-cli --from git+https://github.com/algm/worldkit.git
```

Then use the tool directly:

```bash
worldbuild init <STORY_NAME>
worldbuild check
```

To upgrade worldbuild run:

```bash
uv tool install worldbuild-cli --force --from git+https://github.com/algm/worldkit.git
```

#### Option 2: One-time Usage

Run directly without installing:

```bash
uvx --from git+https://github.com/algm/worldkit.git worldbuild init <STORY_NAME>
```

**Benefits of persistent installation:**

- Tool stays installed and available in PATH
- No need to create shell aliases
- Better tool management with `uv tool list`, `uv tool upgrade`, `uv tool uninstall`
- Cleaner shell configuration

### 2. Establish world foundation

Launch your AI assistant in the project directory. The `/worldkit.*` commands are available in the assistant.

Use the **`/worldkit.foundation`** command to create your world's governing rules, magic systems, and fundamental principles that will guide all subsequent story development.

```bash
/worldkit.foundation Create a fantasy world foundation with a hereditary magic system, medieval technology level, and five kingdoms in uneasy alliance
```

### 3. Create the world and story

Use the **`/worldkit.worldbuild`** command to describe your story. Focus on characters, setting, conflicts, and themes—not the technical details of writing.

```bash
/worldkit.worldbuild I want to write a story about a young heir who discovers their family's magic is fading, threatening their kingdom's survival. They must journey to the cursed lands beyond the border to find the source of magic while avoiding court assassins who want to seize power during this weakness.
```

### 4. Create a story outline

Use the **`/worldkit.outline`** command to structure your story with acts, plot points, and character arcs.

```bash
/worldkit.outline The story follows a three-act structure. Act I introduces the protagonist discovering the fading magic. Act II shows their dangerous journey and growing powers. Act III brings them back for a climactic confrontation with both the magical threat and political enemies.
```

### 5. Break down into chapters and scenes

Use **`/worldkit.chapters`** to create a detailed chapter-by-chapter and scene-by-scene breakdown.

```bash
/worldkit.chapters
```

### 6. Execute writing

Use **`/worldkit.write`** to draft your story chapter by chapter according to your detailed breakdown.

```bash
/worldkit.write
```

## 🤖 Supported AI Agents

| Agent                                                     | Support | Notes                                             |
|-----------------------------------------------------------|---------|---------------------------------------------------|
| [Claude Code](https://www.anthropic.com/claude-code)      | ✅ |                                                   |
| [GitHub Copilot](https://code.visualstudio.com/)          | ✅ |                                                   |
| [Gemini CLI](https://github.com/google-gemini/gemini-cli) | ✅ |                                                   |
| [Cursor](https://cursor.sh/)                              | ✅ |                                                   |
| [Qwen Code](https://github.com/QwenLM/qwen-code)          | ✅ |                                                   |
| [opencode](https://opencode.ai/)                          | ✅ |                                                   |
| [Windsurf](https://windsurf.com/)                         | ✅ |                                                   |
| [Kilo Code](https://github.com/Kilo-Org/kilocode)         | ✅ |                                                   |
| [Auggie CLI](https://docs.augmentcode.com/cli/overview)   | ✅ |                                                   |
| [CodeBuddy CLI](https://www.codebuddy.ai/cli)             | ✅ |                                                   |
| [Roo Code](https://roocode.com/)                          | ✅ |                                                   |
| [Codex CLI](https://github.com/openai/codex)              | ✅ |                                                   |
| [Amazon Q Developer CLI](https://aws.amazon.com/developer/learning/q-developer-cli/) | ⚠️ | Amazon Q Developer CLI [does not support](https://github.com/aws/amazon-q-developer-cli/issues/3064) custom arguments for slash commands. |
| [Amp](https://ampcode.com/) | ✅ | |

## 🔧 Worldbuild CLI Reference

The `worldbuild` command supports the following options:

### Commands

| Command     | Description                                                    |
|-------------|----------------------------------------------------------------|
| `init`      | Initialize a new Worldbuilding project from the latest template |
| `check`     | Check for installed tools (`git`, `claude`, `gemini`, `code`/`code-insiders`, `cursor-agent`, `windsurf`, `qwen`, `opencode`, `codex`) |

### `worldbuild init` Arguments & Options

| Argument/Option        | Type     | Description                                                                  |
|------------------------|----------|------------------------------------------------------------------------------|
| `<story-name>`         | Argument | Name for your new story directory (optional if using `--here`, or use `.` for current directory) |
| `--ai`                 | Option   | AI assistant to use: `claude`, `gemini`, `copilot`, `cursor-agent`, `qwen`, `opencode`, `codex`, `windsurf`, `kilocode`, `auggie`, `roo`, `codebuddy`, `amp`, or `q` |
| `--script`             | Option   | Script variant to use: `sh` (bash/zsh) or `ps` (PowerShell)                 |
| `--language`, `--lang` | Option   | Language for generated outputs (e.g., `en`, `es`, `fr`, `de`, `pt`, `ja`, `zh`). Default: `en` |
| `--ignore-agent-tools` | Flag     | Skip checks for AI agent tools like Claude Code                             |
| `--no-git`             | Flag     | Skip git repository initialization                                          |
| `--here`               | Flag     | Initialize project in the current directory instead of creating a new one   |
| `--force`              | Flag     | Force merge/overwrite when initializing in current directory (skip confirmation) |
| `--skip-tls`           | Flag     | Skip SSL/TLS verification (not recommended)                                 |
| `--debug`              | Flag     | Enable detailed debug output for troubleshooting                            |
| `--github-token`       | Option   | GitHub token for API requests (or set GH_TOKEN/GITHUB_TOKEN env variable)  |

### Examples

```bash
# Basic story initialization
worldbuild init my-fantasy-novel

# Initialize with specific AI assistant
worldbuild init my-fantasy-novel --ai claude

# Initialize with Cursor support
worldbuild init my-fantasy-novel --ai cursor-agent

# Initialize with PowerShell scripts (Windows/cross-platform)
worldbuild init my-fantasy-novel --ai copilot --script ps

# Initialize with Spanish language output
worldbuild init mi-novela-fantastica --ai claude --language es

# Initialize with French language output
worldbuild init mon-roman --ai copilot --lang fr

# Initialize in current directory with German output
worldbuild init . --ai copilot --language de
# or use the --here flag
worldbuild init --here --ai copilot --lang pt

# Check system requirements
worldbuild check
```

### Language Support

Worldbuilding Kit supports generating all story content (world descriptions, outlines, chapters, and writing) in multiple languages. Use the `--language` or `--lang` option when initializing your project:

**Supported languages include:**
- `en` - English (default)
- `es` - Spanish (Español)
- `fr` - French (Français)
- `de` - German (Deutsch)
- `pt` - Portuguese (Português)
- `ja` - Japanese (日本語)
- `zh` - Chinese (中文)
- And many more...

The language preference is saved in `/memory/config.json` and automatically applied to all worldbuilding commands (`/worldkit.foundation`, `/worldkit.worldbuild`, `/worldkit.outline`, `/worldkit.chapters`, `/worldkit.write`, `/worldkit.character`, `/worldkit.sensory`, `/worldkit.expand`, `/worldkit.bible`, `/worldkit.voice`, `/worldkit.analyze`, `/worldkit.revise`, `/worldkit.checklist`).

**Note:** Technical markers, file paths, and structural elements remain in English for consistency across the workflow.

📖 **For complete language support documentation, examples, and troubleshooting, see [Language Support Guide](docs/language-support.md)**

### Available Slash Commands

After running `worldbuild init`, your AI coding agent will have access to these slash commands for structured worldbuilding:

#### Core Commands

Essential commands for the World-Driven Fiction Writing workflow:

| Command                  | Description                                                           |
|--------------------------|-----------------------------------------------------------------------|
| `/worldkit.foundation`   | Create or update world foundation rules and principles                |
| `/worldkit.worldbuild`   | Define your world, characters, setting, and conflicts                |
| `/worldkit.outline`      | Create story structure with acts, plot points, and character arcs    |
| `/worldkit.chapters`     | Generate detailed chapter and scene breakdown                         |
| `/worldkit.write`        | Execute writing chapter by chapter according to your breakdown        |

#### Optional Commands

Additional commands for enhanced quality and depth:

| Command              | Description                                                           |
|----------------------|-----------------------------------------------------------------------|
| `/worldkit.character`| Deep character development through interviews, backstories, and voice profiling |
| `/worldkit.sensory`  | Build sensory banks (smells, sounds, textures, tastes) for vivid, consistent world details |
| `/worldkit.expand`   | Expand underspecified story elements (recommended before `/worldkit.outline`) |
| `/worldkit.bible`    | Generate comprehensive story bible - index characters, locations, timeline, track consistency |
| `/worldkit.voice`    | Develop and maintain consistent POV character voices through exercises and verification |
| `/worldkit.analyze`  | Cross-element consistency & continuity check (run after `/worldkit.chapters`, before `/worldkit.write`) |
| `/worldkit.revise`   | Multi-pass revision system: dialogue, pacing, show-don't-tell, consistency, and prose polish |
| `/worldkit.checklist`| Generate custom quality checklists to validate story completeness, clarity, and consistency |

### Environment Variables

| Variable            | Description                                                                                    |
|---------------------|------------------------------------------------------------------------------------------------|
| `WORLDBUILD_STORY`  | Override story detection for non-Git repositories. Set to the story directory name (e.g., `001-dying-magic`) to work on a specific story when not using Git branches.<br/>**Must be set in the context of the agent you're working with prior to using `/worldkit.outline` or follow-up commands. |

## 📚 Core Philosophy

World-Driven Fiction Writing is a structured process that emphasizes:

- **Foundation-first worldbuilding** where world rules define what's possible
- **Character-driven plots** where motivations create conflict
- **Structured storytelling** using proven narrative frameworks
- **Iterative refinement** rather than one-shot story generation
- **AI-assisted creativity** that enhances rather than replaces your vision

## 🌟 Writing Phases

| Phase | Focus | Key Activities | Optional Enhancements |
|-------|-------|----------------|----------------------|
| **Foundation Building** | World rules & principles | <ul><li>Define magic/technology systems</li><li>Establish world constraints</li><li>Set genre conventions</li><li>Create consistency guidelines</li></ul> | <ul><li>`/worldkit.foundation`</li></ul> |
| **World Creation** | Characters & setting | <ul><li>Develop compelling characters</li><li>Design vivid settings</li><li>Identify central conflicts</li><li>Explore themes</li></ul> | <ul><li>`/worldkit.worldbuild`</li><li>`/worldkit.character` (deep character dev)</li><li>`/worldkit.sensory` (sensory banks)</li></ul> |
| **Story Outlining** | Plot structure | <ul><li>Apply narrative frameworks</li><li>Map character arcs</li><li>Plan plot points</li><li>Integrate subplots</li></ul> | <ul><li>`/worldkit.outline`</li><li>`/worldkit.expand` (clarify underspecified elements)</li></ul> |
| **Scene Breakdown** | Detailed planning | <ul><li>Break story into chapters</li><li>Define scene goals</li><li>Track POV and pacing</li><li>Prepare for writing</li></ul> | <ul><li>`/worldkit.chapters`</li><li>`/worldkit.bible` (consistency tracking)</li><li>`/worldkit.analyze` (continuity check)</li></ul> |
| **Writing** | Execution | <ul><li>Draft chapters in order</li><li>Maintain voice and style</li><li>Follow the structure</li><li>Preserve consistency</li></ul> | <ul><li>`/worldkit.write`</li><li>`/worldkit.voice` (POV consistency)</li></ul> |
| **Revision** | Polish & refinement | <ul><li>Multi-pass editing</li><li>Strengthen dialogue</li><li>Improve pacing</li><li>Enhance prose quality</li></ul> | <ul><li>`/worldkit.revise` (5 focused passes)</li><li>`/worldkit.checklist` (quality validation)</li></ul> |

## 🎯 Goals

Our research and experimentation focus on:

### Genre flexibility

- Create stories across diverse genres
- Support fantasy, sci-fi, mystery, romance, thriller, and more
- Adapt to different formats (novels, short stories, series)

### Consistency at scale

- Maintain world rules across long stories or series
- Track character development and relationships
- Ensure continuity in complex worldbuilding
- Support multiple interconnected stories in the same world

### Creative enhancement

- Provide structure without constraining creativity
- Support both pantsers and plotters with flexible workflows
- Enable exploration of alternative story directions
- Maintain depth while staying organized

### Iterative refinement

- Support expansion and clarification at any stage
- Allow for discovery during writing while maintaining consistency
- Enable revision and restructuring
- Track story evolution over time

## 🔧 Prerequisites

- **Linux/macOS/Windows**
- [Supported](#-supported-ai-agents) AI coding agent
- [uv](https://docs.astral.sh/uv/) for package management
- [Python 3.11+](https://www.python.org/downloads/)
- [Git](https://git-scm.com/downloads)

If you encounter issues with an agent, please open an issue so we can refine the integration.

---

## 📋 Detailed Process

<details>
<summary>Click to expand the detailed step-by-step walkthrough</summary>

You can use the Worldbuild CLI to bootstrap your writing project. Run:

```bash
worldbuild init <story_name>
```

Or initialize in the current directory:

```bash
worldbuild init .
# or use the --here flag
worldbuild init --here
```

You will be prompted to select the AI agent you are using. You can also specify it directly:

```bash
worldbuild init <story_name> --ai claude
worldbuild init <story_name> --ai gemini
worldbuild init <story_name> --ai copilot
```

### **STEP 1:** Establish world foundation

Go to the project folder and run your AI agent (e.g., `claude`).

You will know things are configured correctly if you see the `/worldkit.*` commands available (including `/worldkit.foundation`, `/worldkit.worldbuild`, `/worldkit.outline`, `/worldkit.chapters`, `/worldkit.write`, and optional commands like `/worldkit.character`, `/worldkit.sensory`, `/worldkit.bible`, `/worldkit.voice`, `/worldkit.expand`, `/worldkit.analyze`, `/worldkit.revise`, `/worldkit.checklist`).

Start by establishing your world's foundation using the `/worldkit.foundation` command:

```text
/worldkit.foundation Create foundation for a space opera setting with faster-than-light travel via jump gates, energy-based weapons, and three competing galactic factions
```

This creates or updates the `/memory/foundation.md` file with your world's fundamental rules.

### **STEP 2:** Create world and story description

Use the `/worldkit.worldbuild` command to describe your story:

>[!IMPORTANT]
>Be as explicit as possible about characters, setting, and conflicts. **Do not worry about writing style or format yet**.

Example prompt:

```text
I want to write a story about Captain Elena Voss, a veteran starship pilot haunted by a past mission that went wrong. She's recruited for a dangerous mission to escort a mysterious scientist through hostile territory. The scientist claims to have discovered an ancient alien technology that could shift the balance of power between the three galactic factions. Elena must choose between following orders, protecting innocent lives, and uncovering the truth about what really happened on her failed mission—which connects to this ancient technology.
```

This creates a `world.md` file in your story directory (e.g., `worlds/001-alien-technology/world.md`).

### **STEP 3:** Expand underspecified elements (optional but recommended)

If your world description has `[NEEDS EXPANSION]` markers or feels thin in places, use `/worldkit.expand`:

```text
/worldkit.expand
```

The AI will ask targeted questions to help you deepen characters, settings, conflicts, and world rules before you outline.

### **STEP 4:** Create story outline

Use `/worldkit.outline` to structure your story:

```text
/worldkit.outline Structure this as a three-act story. Act I: Elena reluctantly takes the mission, we learn about her past. Act II: Journey through dangerous space, growing threat, revelation about the scientist's true goals. Act III: Elena must make impossible choice at the ancient alien facility, confronting both external threat and her past trauma.
```

This generates `outline.md` with detailed act structure, plot points, and character arcs.

### **STEP 5:** Validate the outline

Review the outline and validate it:

```text
Read the outline and check if all plot points are clear, character arcs are complete, and pacing feels appropriate. Let me know if anything needs adjustment.
```

### **STEP 6:** Generate chapter breakdown

Use `/worldkit.chapters` to create detailed chapter and scene breakdown:

```text
/worldkit.chapters
```

This creates `chapters.md` with chapter-by-chapter and scene-by-scene details including POV, goals, conflicts, and outcomes.

### **STEP 7:** Writing

Once ready, use `/worldkit.write` to start drafting:

```text
/worldkit.write
```

The AI will draft chapters according to your detailed breakdown, maintaining voice, style, and consistency with your world foundation.

</details>

---

## 👥 Maintainers

- Den Delimarsky ([@localden](https://github.com/localden))
- John Lam ([@jflam](https://github.com/jflam))

## 💬 Support

For support, please open a [GitHub issue](https://github.com/algm/worldkit/issues/new). We welcome bug reports, feature requests, and questions about using World-Driven Fiction Writing.

## 📄 License

This project is licensed under the terms of the MIT open source license. Please refer to the [LICENSE](./LICENSE) file for the full terms.
