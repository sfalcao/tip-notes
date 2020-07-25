# tip notes

a notes taking app for terminal

## INSTALL

there are two methods here:

### 1. Preferred mode

#### 1.1 generate a deb file with:

```bash
cd /support

./make-deb <deb package destination folder>
```

#### 1.2 then use you system package manager to install tip-notes, for example, typing:

```bash
cd <deb package destination folder>

sudo gdebi <deb package file>
```

### 2. Alternative mode

this method has a *disadvantage* of installation not been tracked by system packaging system.
Installation method does not affect **tip-notes** usage, but method in section 1.1 is preferable 

```bash
sudo ./install
```

## REMOVE

### remove package

The method used to install **tip-notes** affects the way you remove it

#### prefered mode (if in doubt, try this first):

```bash
sudo apt remove tip-notes
```

if this method fails, don't worry, use the *alternative method* bellow

#### alternative mode:

if preferred mode above fails, then type:

```bash
sudo tip --remove
```

### remove package and configuration files!

the following command removes **tip-notes** and it's configuration files!

#### prefered mode (if in doubt, try this first):

```bash
sudo apt purge tip-notes
```

#### alternative mode:

if preferred mode above fails, then type:

```bash
sudo tip --remove-purge
```

## QUICK START

### install tip-notes
See **INSTALL** section above

### create a configuration file

```bash
tip --config--init
```

### edit configuration file if you want (e.g. to change tip notes default editor)

```bash
tip --config
```

### create and/or edit a note

```bash
tip -e <my_note_name>
```

### see a note

```bash
tip <my_note_name>

```
### create and/or edit a note in a specific group

```bash
tip -e <group_name>/<my_note_name>
```

### see a note within a group

```bash
tip <group_name>/<my_note_name>
```

### list all notes

```bash
tip
```

### list all notes within a group

```bash
tip <group_name>
```


## CONFIGURATION FILES AND NOTES

### configuration file

#### configuration file is stored in a fixed location:

```bash
$HOME/.config/tip-notes/tiprc
```

**tiprc** has self explanatory comments, and everything there is made exactly
to be edited by users who wants to change **tip-note**'s default behaviour!

#### to edit tiprc:

```bash
tip --config
```

#### if you messed around and fell unsafe about you have done, type:

```bash
tip --config-reset
```

this will restore configuration file to it's default

### notes folder

#### notes are by default stored at following folder location:

```bash
$HOME/.config/tip-notes/notes
```

#### To change notes location, type:

```bash
tip --config
```

and then change this line accordingly:

```bash
tip_notes_folder=~/.config/tip-notes/notes
```

e.g.

```bash
tip_notes_folder=~/my_notes
```

**ATTENTION!** Do not leave empty spaces around '=' sign when editing this line and change only the part AFTER '=' sign!

## SEE ALSO

```bash
tip --help
```
