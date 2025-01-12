[Rho System](readme.md)



# Builder
```bash
source path diva
```
Edit [Changes](changes.md).
```bash
clear; diva show state task
```
Edit [Artisan](artisan.md).
```bash
clear; before diva show state task -- diva update
```
```bash
clear; before diva show state task -- diva clean build test check zippe install
```
```bash
clear; before diva show state task -- diva stage
```
```bash
clear; before diva show state task -- diva commit entag push release
```
Other
```bash
diva show database gitbase
```
```bash
diva reverse
```
```bash
diva rename Original.Source Final.Target
```
Using Stack
```bash
diva unpack
source path stack
```
```bash
stack ...
```
```bash
source path diva
diva repack
```
