# tip notes

a notes taking app for terminal

## INSTALL

```bash
sudo ./install
```

## REMOVE

remove package

```bash
sudo tip --remove
```

remove package, configuration and notes!!! TAKE CARE

```bash
sudo tip --remove-purge
```

## QUICK START

install *tip notes*

```bash
sudo ./install
```

create a configuration file

```bash
tip --config--init
```

edit configuration file if you want (e.g. to change tip notes default editor)

```bash
tip --config
```

create and/or edit a note

```bash
tip -e <my_note_name>
```

see a note

```bash
tip <my_note_name>
```
create and/or edit a note in a specific group

```bash
tip -e <group_name>/<my_note_name>
```

see a note within a group

```bash
tip <group_name>/<my_note_name>
```

list all notes

```bash
tip
```

list all notes within a group

```bash
tip <group_name>
```


## CONFIGURATION FILES AND NOTES

### configuration file

configuration file is stored in a fixed location

```bash
$HOME/.config/tip-notes/tiprc
```

*tiprc* has self explanatory comments, and everything there is made exactly to be edited by users who wants to change *tip*'s default behaviour, **BUT, do not change if you do not understand!**

tip offers an easy way to edit configurations, see:

```bash
tip --help
```

if you messed around and fell unsafe about you have done, just type:

```bash
tip --config-reset
```

this will restore configuration file to it's default. Eventually you may want to manually move your notes back to original location, this is only required if you have changed default notes location in *tiprc* (configuration file) and created notes or moved then manually after that

### notes folder

notes are by default stored at following folder location:

```bash
$HOME/.config/tip-notes/notes
```

this can be changed editing corresponding line in *tip*'s configuration file. The easiest way is by typing the following in shell: 

```bash
tip --config
```

and then changing this line accordingly:

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
