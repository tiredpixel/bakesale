# bakesale

Deployment is much like baking a cake for a bakesale. You lovingly bake a cake,
place it into a cakebox, carry it with care, and wave excitedly at people,
pointing to your cake and perhaps doing a little dance. Why should deployment be
any different?

There are some good deployers around, for which I render grateful thanks. But
my deployment configurations seem to grow ever more complicated, and swiftly
become hard to follow. bakesale is a return to the main ingredients of
deployment, doing only as much as is finger-saving, and leaving the rest to you.
It doesn't care what language your cake is written in; it doesn't necessarily
assume you're deploying to a server rather than a bucket (WIP). For more about
what bakesale doesn't do, see below. :)

More sleep lost by [tiredpixel](http://www.tiredpixel.com).


## Installation

Clone the repository somewhere, then source the main `bakesale.sh` within your
deployment script.

    $ git clone git://github.com/tiredpixel/bakesale.git /Users/mlnw/bakesale

`/Users/mlnw/Deployments/tunefl.sh` :

    #!/bin/bash
    
    source /Users/mlnw/bakesale/bakesale.sh

To update bakesale, use Git.

    $ cd /Users/mlnw/bakesale/
    $ git pull


## Example

Here is a complete example for deploying a Rails application, baking using Git,
carrying using rsync+ssh, and waving using ssh+rvm+bundle and ssh+rvm+foreman.

`/Users/mlnw/Deployments/tunefl.sh` :

    #!/bin/bash
    
    source /Users/mlnw/bakesale/bakesale.sh
    
    # = Bake
    
    bakesale bake git git://github.com/tiredpixel/tunefl.git
    
    bakesale bake copy /Users/mlnw/Deployments/tunefl.env .env
    
    bakesale bake link /var/log/tunefl/ log
    
    # = Carry
    
    bakesale carry rsync_ssh \
        tunefl@example.com:tunefl/ \
        "--exclude vendor/bundle/ --exclude .bundle/ --exclude bin/"
    
    # = Wave
    
    bakesale wave ssh_rvm_bundle \
        tunefl@example.com \
        /usr/local/rvm/environments/ruby-2.0.0-p0@tunefl \
        tunefl/
    
    bakesale wave ssh_rvm_foreman \
        tunefl@example.com \
        /usr/local/rvm/environments/ruby-2.0.0-p0@tunefl \
        "export --root tunefl/ --app tunefl --user tunefl upstart /etc/init"
    
    ssh tunefl@example.com touch tunefl/tmp/restart.txt


## It doesn't...

Here are some of the things bakesale doesn't do, for better or for worse. It
doesn't:

- require that Git is installed remotely;

- cache Git clones to save downloading;

- assume a remote `current/`, `releases/`, `shared/` structure;

- require that the remote is a server (WIP);

- require that the remote has authorisation to Git clone repositories and Gems;

- assume Ruby, although helper scripts are supplied for RVM and Bundler,

- encourage you to pollute your codebase with production credentials or scripts (that includes `config/deploy.rb`).


## Contributions

Contributions are embraced with much love and affection! Please fork the
repository and wizard your magic. In most cases, working on only one helper
script (in `stages/`) per commit is clearest. Then send a pull request. Simples!
If you'd like to discuss what you're doing or planning to do, or if you get
stuck on something, then just wave. :)

Target Systems: Debian-based; OS X.

Watch This Space: carry helper scripts for Rackspace Cloud Files and Amazon S3,
particularly to help with deployment of static sites.

Do whatever makes you happy. We'll probably still like you. :)


## Blessing

May you find peace, and help others to do likewise.


## Licence

© [tiredpixel](http://www.tiredpixel.com) 2013. It is free software, released
under the MIT License, and may be redistributed under the terms specified in
`LICENSE`.
