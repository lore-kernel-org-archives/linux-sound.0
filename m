From: Scott Grigsby <grigsby@proxinet.com>
Date: Tue, 11 May 1999 18:26:32 +0000
Subject: Re: Couple of questions 1 real stupid - sorry
Message-Id: <marc-linux-sound-92645781016149@msgid-missing>
List-Id: <linux-sound.vger.kernel.org>
References: <marc-linux-sound-92643155626678@msgid-missing>
In-Reply-To: <marc-linux-sound-92643155626678@msgid-missing>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-sound@vger.kernel.org

George wrote:
>
>Hello:
>
>First an apology for the really stupid question I'll start with...I'm
>just drawing a complete blank here.
>
>System Info:
>Gateway 9100XL Notebook
>	Pentium 350MHz
>	384 MB RAM
>	8.1 GB Hard Disk 
>	all Linux with 768MB of Swap partitions (6 x 128)
>120MB SuperDisk Drive
>Xircom CE 10/100 Ethernet PCMCIA Adapter
>Caldera OpenLinux 1..3
>kernel 2.0.35
>
>First the stupid question....
>
>1) How do I mount the floppy drive /dev/fd0 I've tried
>
>mount -t umsdos /dev/fd0 /mnt/floppy
>
>with NO success using either a SuperDisk or 1.44MB standard floppy
>formatted under WIN98. What the %^*&% am I missing??


I have the same machine (although with a slightly less memory :-) --
hopefully I can help!

The Superdisk isn't recognized as a floppy -- it shows up as /dev/hdd.  
Try 'mount -t umsdos /dev/hdd /mnt/floppy'

(This was my biggest problem getting Slackware installed initially --
once the bootdisk finished, the rootdisk was then not found under /dev/fd0,
but /dev/hdd, so I got stuck.  Ended up using Zipslack from my Win98
partition.)

The Superdisk works fine with both 1.44Mb and 120Mb disks, albeit rather
slow.  (You think it takes a long time to write a 1.44Mb floppy?  Try
120Mb!  :-)

The other thing that's handy to change, if you're using the mtools package
(e.g. mdir, mcopy, mdel, etc.)  is to edit the /etc/mtools.conf file
(or wherever it lives on your machine, so the line that specifies drive
a: says

# # Linux floppy drives
drive a: file="/dev/hdd" exclusive

(instead of /dev/fd0).



>2) Has anyone got PCMCIA working on a system like this? I've got it
>enabled in the kernel but it doesn't seem to see any cards and running
>cardmgr by hand get me a "no entries in /proc/devices" error in the
>log.

I'm using the excellent pcmcia package (3.0.6 or 3.0.9) from David
Hinds -- http://hyper.stanford.edu/HyperNews/get/pcmcia/home.html
I don't know if the kernel by itself supports pcmcia -- I think you
need to use this package.

>
>3) Is the SuperDisk and the Xircom Ethernet supported in the PCMCIA
>package? 

The Superdisk doesn't need pcmcia -- it's just /dev/hdd.
It looks like some Xircom ethernet cards are supported by the pcmcia
package -- probably depends on which model you got.  (I'm using
a 3Com card.)


>4) What do I select for a Mouse and Video Adapter for X-Windows or kde
>here to get the built in Display and the little glide point thingy
>working I can't seem to get the mouse responding at all and am unsure
>on the video also.

I already owned the Accelerated X server from Xi Graphics, so I'm
using that.  However, there is an XFree86 server available that 
I've also used which worked fine.

seth@sunflow.com has put up an excellent web page about his 9100LS,
which is where I learned most of these tricks:

http://www.sunflow.com/~seth/GW2k-9100.html

He has a link to an X server that he's modified that works fine.

The mouse (touchpad) is /dev/psaux -- it works just like a regular
PS/2 mouse -- make sure you have support for a PS/2 mouse either
compiled into the kernel, or loaded as a module.


>5) What type of sound drivers do I need to get that working here...I
>haven't tried to address this much up til now but since I'm
>asking.....

I'm using the latest version (3.92-k) of OSS from 4Front Technologies
($20) -- I just got it to work yesterday, but it seems like my volume
is really low -- even turned up all the way, it's not very loud (not
as loud as in Win98).  So I think I need to tweak it some more.  I'll
probably also try the method(s) Seth mentions.


>6) Is there any DVD Support for the DVD that is here as well? Not a
>necessity but it sure would be nice to have....

The DVD drive works fine as a CDROM drive (data and music).  I haven't
heard of any actual dvd players for linux, though, and I have no idea
what'd be involved in writing one.  Anybody know of any DVD-linux
projects going on?  It'd be fun to help out.


>These are my five (or 6) core critical issues here, once I'm past
>these I can get the rest of the system going (I hope). I've done alot
>of Linux on "standard" machines but never on a notebook....

There are a couple other very useful links to have:

The linux-laptop page:
http://www.cs.utexas.edu/users/kharker/linux-laptop/

There are links to two other people's pages that have 9100s -- Seth's
is very good, the other one is helpful, too.  Between the two of
them, I have mine working quite well.  (Couple minor things to still
fix, but for the most part, it's great.)

Hope this helps!

Scott

--
Scott Grigsby
Systems Administrator
ProxiNet, Inc.
