From: Tony Nugent <tony@growzone.com.au>
Date: Tue, 19 Oct 1999 12:35:00 +0000
Subject: Re: Yamaha OPL3-Sax support for RH 6.0 kernel=2.2.5-15
Message-Id: <marc-linux-sound-94033832224652@msgid-missing>
List-Id: <linux-sound.vger.kernel.org>
References: <marc-linux-sound-93979856809463@msgid-missing>
In-Reply-To: <marc-linux-sound-93979856809463@msgid-missing>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-sound@vger.kernel.org

  [I sent this to the mailing list a few days ago, but I have not seen
  it appear here... not sure why.  Apologies if this is seen twice.
  Also, David Luyer has just posted a message to the affect that the
  opl3 driver was broken in redhat's 2.2.5-15 kernel.  Nevertheless, I
  don't believe that this is entirely the problem, and that what I
  have to say here has some value...]

On Wed Oct 13 1999 at 12:34, Ac wrote:

> 	I'm trying to recompile my kernel (RH 6.0, 2.2.5-15) with Yamaha
> OPL3-Sax support built in. I want to know what options to give in

It stuns my why anyone would want to build a kernel with any of the
sound drivers compiled into it...

> make - xconfig/config/menuconfig, since after compilation
> (make dep,make clean, make bzImage, make modules), when I try to run
> 'sndconfig' or even 'setup' to configure sound, Tux just freezes and I
> have to do a cold-boot, which is irritating due to the check-forced
> mounting I must go through when it boots next time.

I'm not suprised that it doens't work like you expect it to.  These
tools won't work at runtime because they expect the sound driver to be
available as modules.  Running them under other circumstances is just
asking for disaster... which is exactly what you are experiencing.

> 	I'm sure the problem lies with IRQ's and DMA settings. Also I'm
> confused whether to use the MPU-401 during compilation or not.

Very likely, but believe me... you are going about it all wrong.

> 	My computer specs are P-II Celeron 333, 64MB RAM, running Win98 and
> loadlin to boot Linux. (and I do copy the updated bzImage to my c:
> drive to use with loadlin.). There are no IRQ clashes in Win98, since I'm
> really using no devices not even a modem.
> 
> 	Hoping some of you out there can help me, so thx. in advance and
> peace on this bandwidth.

Unless you really know what you are doing, as much as possible don't
build kernels with any hardware drivers compiled into it... as much as
possible, make drivers as loadable modules.  (Of course there are
exceptions, eg: cdrom and ide support, and specialised kernels, etc).

Why?

Because it gives you one hell of a lot more flexability.

I'll give you a good example.

I have in my box at home a Creative/Esonic PCI64 card.  The driver it
needs is the es1370.o module.

  Aside:
  
    It was a step-up from the vibra16 card I've had for a very long
    time, but being pci it was different and it took me quite a while
    to start to appreciate these differences.  What?  No synth device?
    Argh, what's going on... it's supposed to be the latest and
    greatest?  What's going on here?

    As it turned out, no problem - just use something like timidity to
    convert .midi into a .wav and the result is just spectacular.  And
    there are tools to load in the same wavetable files that are used
    for windows.

That card can do something very cool... it can do 4-speaker output by
turning the input plug into a "rear speaker" output.

    BTW, full 4-channel quake with linux is just spectacular... its a
    real experience :-)

Now, in order to set up the driver to do this, you have to tell it to
do that when it is initialised.  You also configure the mic and
joystick at the same time.  For other (sound) drivers, you need to tell
it the IRQ, DMA and other such parameter settings.

  Now let me repeat that... the point is that it is only possible to
  configure the driver when you first initialise it.
  
  Stop.  Read that again, for when the penny drops you'll realise that
  what I've just said (err, written:) has some very big implications.

For modules, this is easy... you use insmod or modprobe and set these
parameters either on the command line or by some magical incantations
cast into /etc/conf.modules.  (The redhat sndconfig utility generally
does an excellent job of putting exactly the right parameters into
that file, after which it works.  It has never failed me yet).

If you want to, for example, reconfigure the card into a four-speaker
output mode, it's easy to do... just rmmod the driver, then reload it
with the necessary parameters.

However, if you have the drivers compiled into the kernel, there are
only two ways to configure the driver... either by hacking the default
values that you want to use into the kernel sources and compiling
these in by default.  Or by passing the necessary values to the kernel
via lilo, either at the boot prompt or in /etc/lilo.conf

So what happens now when you want to reconfigure the driver?  Can you
guess?  Yes?  Ok fine, that's right - you are stuck with having to
reboot your system to do it!  Yeech, very ugly... smells a lot like a
micky$lop, no?  :)

And what if you got the compile-time or boot-time parameters wrong?
Ugly, very ugly - reboot and try again.

With modules you don't have any of these hassles... if it doesn't
work, then simply unload the modules and try again.  Simple.  Easy.
Just like it is supposed to be :)


What I say here holds try for a great many of the other hardware
drivers.  Ethernet cards for example... it's possible to lock them
into 100Mbit full-duplex mode by (re)loading them with the appropriate
parameters.

Sometimes drivers are needed at boot time (eg, for scsi-based
systems), but that's what initrd images are used for -- pre-loading
drivers before system bootup "proper".  But I won't elaborate on the
magic of using initrd images - there are entire HOWTOs explaining what
they are all about and how to use them, and redhat has a very cool
utility for easily creating them... /sbin/mkinitrd (it has a man
page).

Finally... with modules, you can actually *query* them for what
parameters they can take, eg:

$ modinfo -p es1370
joystick int array (min = 1, max = 5), description "if 1 enables joystick interface (still need separate driver)"
lineout int array (min = 1, max = 5), description "if 1 the LINE input is converted to LINE out"
micz int array (min = 1, max = 5), description "changes (??) the microphone impedance"

$ modinfo -p 3c59x 
debug int
options int array (min = 1, max = 8)
full_duplex int array (min = 1, max = 8)
rx_copybreak int
max_interrupt_work int
compaq_ioaddr int
compaq_irq int
compaq_device_id int

Now that is way cool, very handy.  (modprobe -h for what else this
utility can do).

For more information about what these parameters actually do, have a
look in the kernel sources at the actual souce code for the driver you
are interested in, or (possibly more productively) in the kernel
documentation files, in /usr/src/linux/Documentation/ or in
/usr/doc/kernel-doc-<version>/ on redhat boxes.


So, the moral of the story is:  as much as possible, compile your
hardware drivers as modules rather then directly into the kernel.

Cheers
Tony
 -=*#*=-=*#*=-=*#*=-=*#*=-=*#*=-=*#*=-=*#*=-=*#*=-=*#*=-=*#*=-=*#*=-
  Tony Nugent <Tony@growzone.com.au>          Systems Administrator
  GrowZone OnLine       (a project of) GrowZone Development Network
  POBox 475 Toowoomba Oueensland Australia 4350    Ph: 07 4632 8344
 -=*#*=-=*#*=-=*#*=-=*#*=-=*#*=-=*#*=-=*#*=-=*#*=-=*#*=-=*#*=-=*#*=-
