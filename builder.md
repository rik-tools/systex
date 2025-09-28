Rik Tools: [Systex](readme.md)



# Builder
Builder preserves the development workflow.
```bash
source path ghcup
source .diva/cmp
source .diva/env
ghcup set ghc 9.10.2
ghcup set cabal 3.16.0.0
ghcup set stack 3.7.1
ghcup set hls 2.11.0.0
path
```
```bash
diva show truth
```
```bash
diva show update
```
```bash
diva show stack
```
```bash
diva show git
```
Edit [Changes](changes.md), [Artisan](artisan.md) or [use](usr/use-filer).
```bash
clear; before diva show update -- diva update
```
```bash
clear; before diva show stack -- diva clean build test package check publish
```
```bash
clear; before diva show git -- diva stage
```
```bash
clear; before diva show git -- diva entag push release
```
Using Stack
```bash
diva unpack
```
```code
$ stack ...
```
```bash
diva repack
```
Other
```bash
before diva show stack -- diva scrub
```
```bash
diva reverse
```
