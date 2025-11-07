# Language Support in Worldbuilding Kit

Worldbuilding Kit supports generating all story content (world descriptions, outlines, chapters, and writing) in multiple languages. This feature allows writers to create fiction in their native language or any language of their choice.

## How It Works

### 1. Setting the Language

When initializing a new project, use the `--language` or `--lang` option:

```bash
# English (default)
worldbuild init my-story --ai claude

# Spanish
worldbuild init mi-historia --ai claude --language es

# French
worldbuild init mon-histoire --ai copilot --lang fr

# German
worldbuild init meine-geschichte --ai cursor-agent --language de

# Portuguese
worldbuild init minha-historia --ai gemini --lang pt

# Japanese
worldbuild init 私の物語 --ai claude --language ja

# Chinese
worldbuild init 我的故事 --ai copilot --lang zh
```

### 2. Language Configuration Storage

The language preference is stored in `/memory/config.json` in your project directory:

```json
{
  "language": "es"
}
```

This configuration is automatically read by all worldbuilding commands.

### 3. Supported Languages

The feature supports any language code you specify, including but not limited to:

| Code | Language | Native Name |
|------|----------|-------------|
| `en` | English | English |
| `es` | Spanish | Español |
| `fr` | French | Français |
| `de` | German | Deutsch |
| `pt` | Portuguese | Português |
| `it` | Italian | Italiano |
| `ja` | Japanese | 日本語 |
| `zh` | Chinese | 中文 |
| `ko` | Korean | 한국어 |
| `ru` | Russian | Русский |
| `ar` | Arabic | العربية |
| `hi` | Hindi | हिन्दी |
| `nl` | Dutch | Nederlands |
| `sv` | Swedish | Svenska |
| `pl` | Polish | Polski |
| `tr` | Turkish | Türkçe |

And many more! The system accepts standard ISO 639-1 language codes.

## Commands That Use Language Configuration

All worldbuilding commands respect the language configuration:

### `/worldkit.foundation`
Creates world foundation documents in the configured language, including:
- World rules and principles
- Magic/technology systems
- Cultural frameworks
- Genre conventions

### `/worldkit.worldbuild`
Generates world and story descriptions in the configured language:
- Character profiles with motivations and arcs
- Setting descriptions with vivid details
- Conflict definitions
- Theme explorations

### `/worldkit.outline`
Creates story outlines in the configured language:
- Act structures
- Plot beats
- Character arcs
- Scene planning

### `/worldkit.chapters`
Generates chapter breakdowns in the configured language:
- Chapter summaries
- Scene descriptions
- POV assignments
- Pacing notes

### `/worldkit.write`
Writes the actual story content in the configured language:
- Narrative prose
- Dialogue
- Descriptions
- All literary content

### `/worldkit.expand`
Asks expansion questions and writes expansions in the configured language

### `/worldkit.analyze`
Generates analysis reports in the configured language

### `/worldkit.checklist`
Creates quality checklists in the configured language

## What Remains in English

For consistency across the workflow and to maintain compatibility with the framework, certain elements remain in English:

- **Technical markers**: `[NEEDS EXPANSION]`, status indicators
- **File paths**: `worlds/001-story-name/world.md`
- **Section headers**: `## Characters`, `## Setting` (though content is translated)
- **Command names**: `/worldkit.worldbuild`, etc.
- **Severity levels**: `CRITICAL`, `WARNING`, `INFO`
- **Metadata fields**: `FOUNDATION_VERSION`, timestamps

This ensures that:
1. The templating system works consistently
2. File organization remains predictable
3. Scripts and automation continue to function
4. Multi-language teams can collaborate

## Changing the Language

To change the language for an existing project, edit `/memory/config.json`:

```json
{
  "language": "fr"
}
```

All subsequent worldbuilding commands will use the new language setting.

**Note**: Previously generated content will remain in the old language. You'll need to regenerate content if you want everything in the new language.

## Best Practices

### 1. Choose Your Language Early
Set the language when initializing the project to ensure all content is generated consistently.

### 2. Use Native Language Codes
Use the appropriate ISO 639-1 code for your target language (e.g., `es` for Spanish, not `sp`).

### 3. Match Story Context to Language
If writing a story set in a Spanish-speaking region, consider using Spanish for enhanced authenticity.

### 4. Consider Your AI Assistant's Capabilities
Different AI assistants may have varying proficiency levels in different languages. Test the output quality for your chosen language.

### 5. Maintain Consistency
Once you start generating content in a language, stick with it for the entire project to maintain consistency.

## Examples

### Fantasy Novel in Spanish

```bash
worldbuild init el-reino-perdido --ai claude --language es

# Then use commands:
# /worldkit.foundation Crear una fundación para un mundo de fantasía medieval...
# /worldkit.worldbuild Quiero escribir sobre un reino donde la magia está desapareciendo...
# /worldkit.outline Estructura de tres actos: descubrimiento, viaje, confrontación...
# /worldkit.chapters
# /worldkit.write
```

### Science Fiction in French

```bash
worldbuild init voyage-interstellaire --ai copilot --lang fr

# Then use commands:
# /worldkit.foundation Créer une fondation pour un univers de science-fiction...
# /worldkit.worldbuild Je veux écrire sur un vaisseau spatial perdu...
# /worldkit.outline Structure narrative avec révélations progressives...
# /worldkit.chapters
# /worldkit.write
```

### Mystery in German

```bash
worldbuild init der-vermisste-erbe --ai cursor-agent --language de

# Then use commands:
# /worldkit.foundation Grundlagen für einen Kriminalroman...
# /worldkit.worldbuild Ein Detektiv untersucht das Verschwinden eines Erben...
# /worldkit.outline Drei-Akt-Struktur mit roten Heringen...
# /worldkit.chapters
# /worldkit.write
```

## Troubleshooting

### The output is still in English

1. Check that `/memory/config.json` exists and contains the correct language code
2. Verify the language code is valid (e.g., `es` not `spanish`)
3. Try regenerating the content after fixing the configuration

### Mixed language output

This can happen if:
1. You changed the language mid-project
2. The AI assistant misunderstood the instructions

Solution: Clearly state the desired language in your command prompts as well.

### AI assistant doesn't seem to respect the language

Some AI assistants may need explicit reminders. Try adding the language to your prompt:

```
/worldkit.worldbuild (en español) Quiero escribir sobre...
```

## Technical Details

### Configuration File Structure

The `/memory/config.json` file uses a simple JSON structure:

```json
{
  "language": "en"
}
```

Additional configuration options may be added in future versions.

### How Commands Read the Configuration

Each command template includes an "Output Language Configuration" section that:

1. Attempts to load `/memory/config.json`
2. Extracts the `language` field
3. Applies the language to all generated content
4. Defaults to English if the file or field doesn't exist

### Template Updates

All command templates in `/templates/commands/` have been updated to include language awareness. Custom templates should follow the same pattern.

## Future Enhancements

Planned improvements to language support include:

- [ ] Language-specific writing style guidelines
- [ ] Genre convention libraries for different languages
- [ ] Language-aware character naming suggestions
- [ ] Cultural context assistance for different languages
- [ ] Multi-language glossaries for consistent terminology
- [ ] Translation helpers for switching languages mid-project

## Contributing

If you find issues with language support or have suggestions for improvements, please:

1. Open an issue on GitHub
2. Provide examples of the problem
3. Specify your AI assistant and target language
4. Share relevant output samples (with appropriate redactions)

## See Also

- [Getting Started Guide](../README.md#-get-started)
- [Command Reference](../README.md#-worldbuild-cli-reference)
- [World-Driven Fiction Writing Methodology](../world-driven.md)
