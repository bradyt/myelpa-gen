This repo is an experiment in maintaining emacs package installation as a separate repo, to some extent.

The main idea is to use packages [`elpa-mirror`](https://github.com/redguardtoo/elpa-mirror/) in particular, and [`quelpa`](https://github.com/quelpa/quelpa) secondarily.

The `home-generate` directory is used to generate `myelpa`, a `.gitignore`'d directory which is currently a symlink to a repo to provide packages for my init.

The `home-test` directory can be used to check that `myelpa` is functioning for consumption.

My use of the `home-*` prefix is an allusion to approximately using `HOME=. emacs` in each.

In `home-generate`, currently using familiar archives, [`gnu`](https://elpa.gnu.org/), [`nongnu`](https://elpa.nongnu.org/) and [`melpa-stable`](https://stable.melpa.org/), to install packages. In particular, `melpa-stable` is used to install `quelpa`, which can be used to install quite general packages, especially `elpa-mirror` itself, as well as `evil-org`, which currently has an untagged bug fix, and `terminal-here` which is not on any archives.

I did explore [`package-vc`](https://amodernist.com/texts/package-vc.html) originally, to serve the same function as `quelpa`, but it works by adding symlinks to `elpa/`, which currently `elpa-mirror` seems to skip. Currently `package-vc` is available on the [`emacs-29` branch](https://git.savannah.gnu.org/cgit/emacs.git/tree/lisp/emacs-lisp/package-vc.el?h=emacs-29).

Finally, `home-test` simply sets the following to install the now completely local archive:

```elisp
(setq package-archives
      `(("myelpa" . ,(expand-file-name "../myelpa"))))
```

Still `quelpa` is available here, and might be useful when wanting to quickly test an arbitrary package on your main emacs. You might also just add archives to `package-archives` temporarily. Either way, you can decide to update `myelpa` if you decide the package is something you want to keep.

I've found using `elpa-mirror` an interesting exercise. I didn't use a separate emacs for generating `myelpa` at first, but quickly got the sense I should. And now I think I may consider this approach on into the future. In the past, I've experimented with [git subtrees](https://git.kernel.org/pub/scm/git/git.git/plain/contrib/subtree/git-subtree.txt), [`straight.el`](https://github.com/radian-software/straight.el), and a brief half-hearted attempt at [`borg.el`](https://emacsmirror.net/manual/borg/). Starting `straight.el` up after a `git clean -dffx` is not really encouraging to debugging an init, as it can take a while to prepare everything from scratch. And git subtrees can make a mess of the git history for my init file. But introducing a notion that packages are maintained locally in a separate repo, may help to more easily consider these alternatives, and encourage a cleaner init, that is easier and faster to troubleshoot.
