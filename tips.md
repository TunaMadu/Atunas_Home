# Symbolic links (Stow is also great...)

For symbolic links, always use complete or absolute paths!!

> ln -s ~/foo  ~/.config/foo

The following examples will not work
```
    ln -s ~/something .config/something
    ln -s something  ~/.config/something
```

Stow is a great alternative for symlinks. But adds unnecessary complexity
to our configs.
