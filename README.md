# handy-tools

handy-tools is just a collection of scripts and such that I keep around to make my day a little simpler.

## Tools

### `src/bash/generate_password`

Generates a random password of a given length and copies it to the clipboard.

```sh
generate_password 24
```

Pulls characters from `/dev/urandom` (avoiding ambiguous-looking ones like `0`/`O` and `1`/`l`) and pipes the result into `xclip`.

### `src/perl/alarma`

Colorizes text from stdin by highlighting regex matches inline. Useful for making patterns pop in log output.

```sh
tail -f app.log | alarma -g OK -y WARN -r ERROR
```

- `-g`, `--greenPattern` — pattern to highlight green
- `-y`, `--yellowPattern` — pattern to highlight yellow
- `-r`, `--redPattern` — pattern to highlight red
- `-l`, `--lineWise` — color the whole line containing a match, not just the match

### `src/perl/column-alarma`

A column-aware variant of `alarma`. Colors whole lines based on the numeric value in a chosen column, e.g. for flagging high usage in `df`-style output.

```sh
df | column-alarma -c 4 -a 60 -u 90
```

- `-c`, `--column` — column index to read the value from (default `4`)
- `-a`, `--alert` — threshold for yellow (default `60`)
- `-u`, `--urgent` — threshold for red (default `90`)
- `-i`, `--ignorePattern` — skip lines matching this pattern (default `^PVC`)
- `-d`, `--direction` — `rising` (high is bad) or `falling` (low is bad)

### `src/perl/hashpics`

Sorts images and videos into `YYYY/MM/DD` directories based on their date. The date is taken from the filename if present, otherwise from EXIF metadata. Drop a `.hashpics-as-symlinks` file in the directory to create symlinks instead of moving files.

```sh
hashpics ~/Pictures/unsorted
```

Requires `Image::ExifTool`, `Path::Class`, and `exiftran`.

### `src/perl/Ticker.pm`

A tiny Perl module providing a spinning CLI progress indicator (`- \ | /`).

```perl
use Ticker;
my $t = Ticker->new;
$t->init;
$t->tick while $still_working;
```
