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

#### preferred mode (if in doubt, try this first):

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
sudo tip --purge
```

## QUICK START

### install tip-notes
See **INSTALL** section above

### create a configuration file

```bash
tip --init
```

### edit configuration file if you want (skip this step is OK)

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

### list all notes which name contain a text

Information within [ ] is optional and if passed limits the search within that group

```bash
tip -f [<group_name>] <text>

```

### list all notes which contain a text incorporated to the note itself

Information within [ ] is optional and if passed limits the search within that group

```bash
tip -F [<group_name>] <text>
```

### backup your notes and configuration files

**tip-notes** has it's own backup routine. Basically user can choose among saving
configurations, notes or both. Backups are stored on a specific backup location
pointed in **tiprc** configuration file, where also is possible to choose
default backup behaviour among --all, --config-only or --notes-only. Backups
are composed by time stamped tar.gz files which names are pretty much self descriptive

To make a backup based on tiprc setup:
```bash
tip -b
```
To override tiprc and backup both, configurations and notes:
```bash
tip -b --all
```
To override tiprc and backup configurations only:
```bash
tip -b --config-only
```
To override tiprc and backup notes only:
```bash
tip -b --notes-only
```


## IMPORTANT FILES AND FOLDERS

### configuration file

```bash
~/.config/tip-notes/tiprc
```
**tiprc** has self explanatory comments, and everything there is made exactly
to be edited by users who wants to change **tip-note**'s default behaviour!

### notes folder

```bash
~/.tip-notes
```
notice that is a hidden folder. See **Visible x hidden notes** folder section
bellow. This location can be changed editing **tiprc** file

### backup folder

```bash
~/tip-notes-backup
```
This location can be changed editing **tiprc** file

### Visible x hidden folders

If folder name is preceded by a dot (".") your folder will be hidden.
**tip-notes** itself is not affected by visibility of folders.
The folder visibility only affects whether your notes, backups and
configurations will be seen by other apps or listed on file browsers like
Nemo, Nautilus, etc

#### visible folder example:

```bash
tip_notes_folder=~/this_is_a_visible_folder
```

#### invisible folder example:

```bash
tip_notes_folder=~/.this_is_a_hidden_folder
```

## LICENSE

**tip-notes** is licensed under Public General License GNU v3.0 or later.
Please see LICENSE.txt for details

## SEE ALSO

for basic usage:
```bash
tip --help
```
for a more comprehensive description:
```bash
man tip
```
