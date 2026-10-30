# Prompt for Claude Code + HyperFrames

## Setup (once)
Requires Node.js 22+ and FFmpeg. In Claude Code run:

```
claude plugin marketplace add heygen-com/hyperframes
claude plugin install hyperframes@hyperframes
```

Unzip `pinoy-motion-assets.zip` into an empty folder, open Claude Code in that folder, then paste the prompt below.

---

## Prompt (copy everything below)

/hyperframes:hyperframes

Build a promotional explainer video for my tax practice's website, **pinoyaccountants.com.au**. It should show new clients exactly how to use the site. Create the HyperFrames project in `./video` (`npx hyperframes init video`) and use only the assets in this folder.

**Read these first:** `STORYBOARD.md` (the shot list and exact captions), `brand/brand.json` (colours, fonts, wording), and the `screens/phone/` images (real screenshots of the site, with sample data).

**Format**
- Vertical 1080×1920 at 30 fps, about 45 seconds, MP4. This is for Facebook/Instagram Reels and TikTok.
- One root composition with `data-width="1080" data-height="1920"`. Each storyboard row is a `.clip` with its own `data-start` / `data-duration`. Use tracks for layering: background, phone, captions, effects.
- Animate with one GSAP timeline (`paused: true`) registered on `window.__timelines` under the composition id, so the renderer can seek every frame.

**Art direction ("Quiet Ledger")**
- Background paper `#FBF8F1`. Forest green `#0F4C3A` / `#0A3529` for headings and the end card. Gold `#B8903A` / `#DDBF70` for accents and highlights. Text `#1B2A25`.
- A thin three-colour stripe across the very top (`#0038A8` | `#B8903A` | `#CE1126`), the same as the website.
- Fonts: load `brand/fonts/fonts.css`. **Fraunces** (700) for big captions, **DM Sans** (500/600) for small text. Don't use Inter, Roboto or Arial.
- Easing everywhere: `cubic-bezier(0.16, 1, 0.3, 1)` (GSAP `"expo.out"` is close). Use staggered reveals (0.1–0.15s apart), never everything at once.
- Show each screenshot inside a simple rounded phone frame: CSS only, about 860px wide, 48px radius, 14px dark bezel, soft long shadow. Pan or scroll inside the frame when a screen is taller than the frame.
- Calm, friendly, premium, Filipino-Australian warmth. No neon, no glitch, no flashing, nothing faster than 0.25s.
- Icons from `icons/*.svg` (stroke `#0F4C3A`) for small accents: doc, shield, check, phone, mail, cal.

**Rules**
1. Follow `STORYBOARD.md` shot by shot, with the captions word for word. Don't invent features, numbers, prices or promises that aren't in it.
2. Use the screenshots as they are. Never redraw, edit or fake website UI. Highlight areas with overlays only (gold ring, soft spotlight, finger-tap pulse).
3. Keep all text inside the safe zone: 120px from the top, 260px from the bottom, 64px from the sides. Captions need at least 4.5:1 contrast against what's behind them (dark text on paper, or white/gold-light on forest).
4. No personal photo of Mar. The mascot logo (`brand/logo-mascot.png`) is the only character.
5. Captions on a solid chip (paper or forest), 56–72px Fraunces for headlines, 36–40px DM Sans for sub-lines.
6. End card (shot 12): forest background, logo, "Start your tax return · about 5 minutes", **pinoyaccountants.com.au** in gold-light, and "Mar Binudin, CPA · Registered Tax Agent" small underneath. Hold it for at least 2 seconds.
7. No audio track for now. I'll add music in CapCut.

**Process**
- Build shot 1 and shot 2 first. Run `npx hyperframes preview`, take a still of frames at 2s and 6s, look at them, and fix any spacing or legibility problems before building the rest.
- Then build shots 3–12, preview again, and check every shot transition.
- Render: `npx hyperframes render` to `video/out/pinoy-website-howto.mp4`. Then use ffmpeg to export a 2-second-per-shot contact sheet (`out/contact-sheet.png`) so I can review it quickly.
- At the end, tell me the final duration and anything you couldn't do.
