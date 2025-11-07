---
description: Build a sensory bank for your world - cataloging smells, sounds, textures, tastes, and world-specific vocabulary to create vivid, consistent descriptions.
---

## User Input

```text
$ARGUMENTS
```

You **MUST** consider the user input before proceeding (if not empty).

## Output Language Configuration

Before proceeding, check for language configuration:

1. **Load language preference** from `/memory/config.json`:
   - If the file exists and contains a `language` field, use that language for all generated outputs
   - Language codes: `en` (English), `es` (Spanish), `fr` (French), `de` (German), `pt` (Portuguese), `ja` (Japanese), `zh` (Chinese), etc.
   - Default to English if no configuration is found

2. **Apply language to outputs**:
   - Generate sensory descriptions in the configured language
   - Keep technical markers in English for consistency (file paths, section headers)
   - Maintain the template structure while translating the content

## Outline

This command helps you create a comprehensive sensory bank for your story world. By cataloging specific sensory details, you ensure consistency across chapters and create vivid, immersive descriptions that bring your world to life.

### When to Use This Command

**Use `/worldkit.sensory` when**:
- After `/worldkit.worldbuild` to catalog world-specific sensory details
- Before writing detailed scene descriptions
- When you notice repetitive or generic descriptions
- To ensure sensory consistency across chapters
- When reviewers note lack of "grounding" or vivid detail
- To develop unique atmosphere for different locations

**Best timing**:
- After world.md is complete
- Before beginning `/worldkit.write` for first chapters
- Anytime you notice sensory descriptions becoming generic
- When adding new locations or cultures to your world

### Process

1. **Review World Foundation**:
   - Load existing world.md
   - Identify key locations, cultures, time periods
   - Note unique world features requiring sensory catalog
   - Consider what makes this world sensorially distinct

2. **Catalog by Sense - Smell**:
   
   **Location-Specific Smells**:
   - Market district: [spices, cooking, crowd smells]
   - Palace: [incense, wood polish, perfumes]
   - Slums: [sewage, smoke, bodies]
   - Forest: [pine, damp earth, decay]
   
   **Character-Associated Smells**:
   - Protagonist: [personal scent, profession smells]
   - Antagonist: [distinctive perfume/cologne, environment]
   
   **Emotional/Memory Triggers**:
   - Comfort: [bread baking, mother's perfume]
   - Danger: [ozone before magic, blood, fear-sweat]
   - Nostalgia: [childhood home, old books]
   
   **Seasonal/Temporal**:
   - Spring: [rain on stone, flowers, fresh growth]
   - Night vs Day: [cool air, dew, woodsmoke]

3. **Catalog by Sense - Sound**:
   
   **Environmental Soundscapes**:
   - City morning: [bells, vendors, cart wheels, crowds]
   - Forest: [bird calls, wind, creek, branches]
   - Palace: [footsteps echoing, whispers, silk rustling]
   
   **World-Specific Sounds**:
   - Magic: [hum, crack, whisper, silence]
   - Technology: [unique mechanical sounds]
   - Creatures: [monster calls, familiar animals]
   
   **Human Sounds**:
   - Language rhythms: [how different cultures speak]
   - Music: [instruments, styles, contexts]
   - Work: [blacksmith, kitchen, training yard]
   
   **Silence Types**:
   - Peaceful silence vs. threatening silence
   - Dead silence vs. natural quiet
   - Anticipatory quiet

4. **Catalog by Sense - Texture**:
   
   **Materials & Fabrics**:
   - Noble clothing: [silk, velvet, fine wool]
   - Common clothing: [rough linen, leather, homespun]
   - Armor/Weapons: [oiled leather, cold steel, worn grip]
   
   **Environmental Textures**:
   - Weather: [rain, wind, heat, cold]
   - Surfaces: [stone floors, dirt paths, polished wood]
   
   **Physical Contact**:
   - Friendly: [hand on shoulder, embrace]
   - Hostile: [grab, shove, grip]
   - Intimate: [specific to relationship]

5. **Catalog by Sense - Taste**:
   
   **Food & Drink**:
   - Common meals: [peasant fare, travel rations]
   - Luxury foods: [noble feasts, rare delicacies]
   - Cultural specific: [traditional dishes, ceremonial foods]
   - Beverages: [water quality, wine, ale, unique drinks]
   
   **Involuntary Tastes**:
   - Fear: [copper, bile]
   - Magical: [ozone, sweetness, ash]
   - Environmental: [dust, smoke, salt air]
   - Physical states: [blood, exhaustion, hunger]

6. **Catalog by Sense - Sight (Unique Visuals)**:
   
   **Light Quality**:
   - Magic light vs. fire vs. sun
   - How different locations are lit
   - Dawn/dusk specific colors
   
   **Color Associations**:
   - Cultural meanings of colors
   - Natural vs. synthetic dyes
   - What colors appear where
   
   **Movement & Gesture**:
   - How different cultures move
   - Class-specific body language
   - Unique gestures and their meanings

7. **Build World-Specific Vocabulary**:
   
   **Avoid Generic Earth Words** where possible:
   - Instead of "horse" → [world-specific mount name]
   - Instead of "sword" → [specific weapon type]
   - Instead of "bread" → [culture-specific staple]
   
   **Create Unique Terms for**:
   - Weather phenomena
   - Time measurements
   - Currency and trade goods
   - Professions and titles
   - Tools and technology
   - Social concepts
   
   **Metaphors and Idioms**:
   - What do people compare things to?
   - Common sayings and curses
   - What imagery is culturally meaningful?

8. **Map Sensory Contrasts**:
   
   Important locations should have **distinct sensory profiles**:
   
   **Location A vs Location B**:
   - Different smells
   - Different soundscapes
   - Different textures underfoot
   - Different visual qualities
   - Different tastes in the air
   
   This helps readers orient themselves instantly.

### Output Structure

Create `{STORY_DIR}/sensory-bank.md`:

```markdown
# Sensory Bank: [Story Title]

**World**: [World name]
**Created**: [DATE]
**Purpose**: Comprehensive catalog of sensory details for consistency and vividness

## SMELL

### By Location

#### [Location 1 - e.g., Capital City Market]

- **Morning**: [fresh bread, dew, woodsmoke]
- **Midday**: [spices (cinnamon, cumin, cardamom), sweat, animal dung, hot metal]
- **Evening**: [cooking fires, roasting meat, beer, perfumes]
- **Rain**: [wet stone, petrichor, ozone]

#### [Location 2 - e.g., Royal Palace]

- **Public halls**: [beeswax candles, cut flowers, incense, old wood polish]
- **Private chambers**: [lavender sachets, parchment, ink]
- **Kitchens**: [roasting fowl, herbs, yeast, wine]

### By Character

- **[Protagonist Name]**: [leather, soap (or lack), ink-stained fingers, horse]
- **[Antagonist Name]**: [expensive amber perfume, parchment, fear-sweat underneath]

### By Emotion/Memory

- **Comfort**: [mother's lavender water, baking bread, woodsmoke from home hearth]
- **Danger**: [ozone before storm/magic, blood (copper and iron), burning hair]
- **Nostalgia**: [old books, grandfather's pipe, seaside salt]

## SOUND

### Environmental Soundscapes

#### [Location 1 - Capital City]

**Morning**:
- Temple bells at dawn (deep, resonant)
- Vendors setting up stalls (wood on cobblestone)
- Shutters opening (creak, slam)
- First customers haggling

**Midday**:
- Crowd roar (constant low murmur punctuated by shouts)
- Cart wheels on cobbles (clatter, rumble)
- Street musicians (lute, drum, voices)
- Blacksmith hammering (rhythmic clang)

#### [Location 2 - Wilderness]

**Day**:
- Wind through pines (whisper, rush)
- Creek over stones (burble, splash)
- Bird calls (specific species)
- Branch crack underfoot

**Night**:
- Owl hoots
- Small creature rustles
- Wind changes tone
- Insects (chirp, buzz)

### World-Specific Sounds

- **Magic**: [low hum building to crack, whispered Words, sudden silence]
- **Technology**: [clockwork tick, steam hiss, gear grind]
- **Creatures**: [dragon rumble, familiar chirp, monster shriek]

### Human Sounds

- **[Culture 1] Speech**: [rapid, musical, lots of fricatives]
- **[Culture 2] Speech**: [guttural, slow, clicking consonants]
- **Noble Class**: [measured, clear, carrying]
- **Common Class**: [faster, dropping consonants, louder]

## TEXTURE

### Fabrics & Materials

#### By Social Class

**Noble**:
- Silk (cool, smooth, flows like water)
- Velvet (soft, deep pile, catches light)
- Fine wool (soft, not scratchy, warm without weight)
- Fur trim (luxuriously soft, warm)

**Common**:
- Linen (crisp when clean, softens with wear)
- Homespun wool (scratchy, heavy, warm)
- Leather (worn smooth or still stiff)
- Cotton (rare, trade good, soft)

#### Armor & Weapons

- Chain mail (cold, heavy, clinks)
- Leather armor (stiff, oiled, creaking)
- Sword grip (leather-wrapped, molded to hand)
- Shield (smooth inside, scarred outside)

### Environmental

#### Weather

- Rain (cold needles, soaking weight, running down neck)
- Wind (pushing, pulling, stealing warmth)
- Sun (warming back, tightening skin)
- Snow (cold burn, wet then numb)

#### Surfaces

- Cobblestones (uneven, worn smooth in center, rain-slick)
- Dirt path (dust in summer, mud in rain)
- Palace marble (cold, smooth, echoing)
- Forest floor (soft moss, crunchy leaves, roots)

## TASTE

### Food & Drink

#### Common Meals

- **[Culture 1 Staple]**: [rye bread - dense, sour, filling]
- **Travel Rations**: [dried meat (salty, tough), hard cheese, stale flatbread]
- **Common Drink**: [small beer (weak, slightly sour), water (metallic from well)]

#### Luxury Foods

- **Noble Feast**: [roasted swan with saffron, honeyed figs, spiced wine]
- **Rare Delicacy**: [sea urchin roe (briny, creamy), imported chocolate]

### Involuntary Tastes

- **Fear**: [copper in mouth, bile rising]
- **After Magic**: [ozone, sweet-sour, ash]
- **Exhaustion**: [metallic, dry, thick tongue]
- **Blood**: [salt, copper, iron]
- **Environmental**: [dust (gritty), smoke (acrid), salt air (briny)]

## SIGHT - UNIQUE VISUALS

### Light Quality

- **Magic Light**: [blue-white, shadowless, cold]
- **Candlelight**: [warm, flickering, shadowy]
- **Firelight**: [orange-red, dancing, smoky]
- **Dawn**: [pink-gold, long shadows, misty]
- **Dusk**: [purple-blue, soft edges, cooling]

### Color Associations

- **[Culture 1]**: [Red = mourning, White = celebration]
- **[Culture 2]**: [Purple = royalty, Blue = common]
- **Natural Dyes**: [faded, muted tones]
- **Synthetic/Magic Dyes**: [impossibly bright, uniform]

## WORLD-SPECIFIC VOCABULARY

### Avoid Generic Terms

| Generic Earth Word | World-Specific Term | Description |
|-------------------|---------------------|-------------|
| Horse | [Destrier] | [Larger, bred for war, intelligent] |
| Sword | [Blade type] | [Curved, single-edge, ceremonial] |
| Bread | [Local name] | [Flatbread, sourdough, specific grain] |
| Money | [Currency name] | [Copper bits, gold dragons, etc.] |

### Unique Cultural Terms

**[Culture 1]**:
- **[Word]**: [Meaning - e.g., "Xara" - the feeling of coming home]
- **[Word]**: [Meaning - e.g., "Tempa" - honor-debt between families]

**Time & Measurement**:
- **Hour equivalent**: [Bell-marks, sun-quarters]
- **Day equivalent**: [Turn, cycle]
- **Year equivalent**: [Rotation, season-round]

### Metaphors & Idioms

**Common Sayings**:
- "[Phrase]" = [Meaning - e.g., "Sharp as winter wind" = dangerously clever]
- "[Phrase]" = [Meaning]

**Curses**:
- "[Mild curse]" = [Context when used]
- "[Strong curse]" = [Context when used]

**Blessings**:
- "[Phrase]" = [Meaning and context]

## SENSORY PROFILES BY LOCATION

### [Location 1 - Capital City Market]

**Instant Recognition**:
- **Smell**: Spices, crowds, animals
- **Sound**: Vendor shouts, haggling, constant background roar
- **Sight**: Colorful awnings, crowds, goods displayed
- **Texture**: Cobbles underfoot, jostling crowds
- **Taste**: Dust in air, sample foods

**Distinct From Other Locations**: [How it differs]

### [Location 2 - Royal Palace]

**Instant Recognition**:
- **Smell**: Incense, beeswax, old wood
- **Sound**: Echoing footsteps, whispers, rustling silk
- **Sight**: Gold trim, tapestries, high ceilings
- **Texture**: Smooth marble, cool air
- **Taste**: Clean air, perfume on tongue

**Distinct From Other Locations**: [How it differs]

## CONSISTENCY CHECKS

### Character-Associated

- **[Character Name]** should always smell like [X]
- **[Character Name]** voice should always sound [X]
- **[Location]** should always have [distinctive sensory element]

### Seasonal

- **Spring**: [smells, sounds, textures]
- **Summer**: [smells, sounds, textures]
- **Fall**: [smells, sounds, textures]
- **Winter**: [smells, sounds, textures]

### Time of Day

- **Dawn**: [light quality, temperature, sounds]
- **Midday**: [light, heat, activity]
- **Dusk**: [light shift, cooling, sounds change]
- **Night**: [darkness quality, temperature, nocturnal sounds]

## WRITING REMINDERS

- ✅ Use at least 2 senses per scene (not just sight)
- ✅ Let POV character's background affect what they notice
- ✅ Unique sensory detail can replace dialogue tags
- ✅ Weather affects multiple senses simultaneously
- ✅ Emotional states change sensory perception
- ✅ Contrast sensory profiles between locations
- ✅ Return to signature scents/sounds for familiarity
- ❌ Don't overload - 2-3 vivid details better than laundry list
- ❌ Don't default to sight only
- ❌ Don't use same descriptions repeatedly

## QUICK REFERENCE TABLES

### Character Sensory Signatures

| Character | Smell | Sound (Voice) | Visual Trait |
|-----------|-------|---------------|--------------|
| [Name] | [X] | [Y] | [Z] |

### Location Quick ID

| Location | Signature Smell | Signature Sound | Signature Visual |
|----------|-----------------|-----------------|------------------|
| [Place] | [X] | [Y] | [Z] |

```

## Best Practices

**Do**:
- ✅ Use specific over generic (not "flowers" but "jasmine")
- ✅ Consider how POV character's background affects sensory focus
- ✅ Create sensory contrasts between locations
- ✅ Layer multiple senses in important scenes
- ✅ Return to signature sensory elements for orientation
- ✅ Update sensory bank as world expands

**Don't**:
- ❌ List all senses mechanically in every scene
- ❌ Use same sensory details repeatedly
- ❌ Default to sight-only descriptions
- ❌ Ignore how weather/time affects sensory experience
- ❌ Make all locations sensorially similar
- ❌ Forget cultural differences in sensory interpretation

## Error Handling

- **No world.md found**: Create basic sensory bank, flag for later expansion
- **Overwhelming amount**: Start with 3 key locations, expand over time
- **Generic descriptions**: Prompt for specific, world-unique details
- **Contradicts world rules**: Flag and resolve inconsistency

## Success Criteria

- Each location has distinct sensory profile
- Multiple senses cataloged (not just sight)
- World-specific vocabulary established
- Character-associated sensory signatures clear
- Contrasts between locations obvious
- Easy to find appropriate sensory detail when writing
- Consistency maintained across chapters
- Readers feel immersed in world

## Notes

**How detailed should this be?**
- Start with 3-5 key locations
- Expand as you write and discover what you need
- More detail for locations with multiple scenes
- Less detail for pass-through locations

**When to consult this?**
- Before writing a scene in a new location
- When description feels flat or generic
- During revision for sensory enhancement
- To check consistency across chapters

**This isn't a checklist for every scene** - it's a reference bank. Use it to keep your world vivid and consistent, not to mechanically check off all five senses in every paragraph.
