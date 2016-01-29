# Discourse Dice Roller

Adds a simple dice roller for play-by-post RPGs

## Usage

In a post, type `[roll 2d6]` - when the post it submitted, it will calculate
the rolls.

Roll any number of dice of any size - `[roll 5d10]` `[roll 3d4]` `[roll d20]`
all do what you'd expect.

## Installation

 * Add the plugin's repo url to your container's app.yml file

```
hooks:
  after_code:
    - exec:
        cd: $home/plugins
        cmd:
          - mkdir -p plugins
          - git clone https://github.com/discourse/docker_manager.git
          - git clone https://github.com/Dorthu/discourse-dice-roller.git
```

 * Rebuild the container

```
cd /var/docker
git pull
./launcher rebuild app
```

## Disclaimer

**THIS IS A WORK IN PROGRESS**

Some things are clearly not done:

 * A preview view to show that dice will be rolled
 * Ability to stop users from editing posts when dice are rolled
 * Admin-side configurations
