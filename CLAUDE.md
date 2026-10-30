# Motion

HyperFrames video projects (HTML compositions rendered to MP4). Each folder, such as `my-video/`, is one project; start with the `/hyperframes` skill.

- The HyperFrames skills live in `.claude/skills/`. A SessionStart hook (`.claude/hooks/session-start.sh`) installs the headless Chrome used for rendering in cloud sessions.
- The cloud network blocks CDNs such as cdn.jsdelivr.net, but the npm registry works. Load libraries from a local copy (`npm pack <pkg>@<version>`, then copy the file into the project's `vendor/`) instead of a CDN `<script src>`, or the render fails.
