From: Paul Novak <pnovak@megsinet.com>
Date: Sun, 16 Jan 2000 02:35:44 +0000
Subject: es1371 PCI 128 trouble :-(
Message-Id: <marc-linux-sound-94800632902814@msgid-missing>
List-Id: <linux-sound.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-sound@vger.kernel.org

Hi:

I tried sending email to sailer@ife.ee.ethz.ch, but it bounced,
so I'm gonna try to send email to the group...

I'm having trouble getting sound to work on my Slackware 7.0, 2.2.13 kernel.
I've been pretty patient and tried to do things the right way by reading
all the documentation I could find, and checking the FAQs on the net,
but I've seem to have exhausted all avenues.   I'm asking for some
help if you have any suggestions because you are listed as the provider
of the es1371 sound driver, and I think my problem is somehow related
to that.

This is pretty long because I'm trying to give you as much details as 
I can.  Not meant to bore you, really :-)

History; I checked the list of compatible sound cards and then bought a

	Creative Labs PCI 128 CT4750

I contacted Creative Labs tech support before I bought the card and they
told me the CT4750 was exactly the same as the CT4700 except it was designed
for OEM manufacturers.

The main (largest) chip is labeled:

	CREATIVE
	CT5880-DBQ
	9933H J074
	Kor


I installed the card and rebooted and ran '/sbin/lspci -v', and I got this result:

00:0b.0 Multimedia audio controller: Ensoniq ES1371 (rev 07)
	Subsystem: Unknown device 1274:8001
	Flags: bus master, slow devsel, latency 64, IRQ 9
	I/O ports at ec00
	Capabilities: <available only to root>

From looking at: http://www.ife.ee.ethz.ch/~sailer/linux/pciaudio.html,
I'm not sure I really have a '1371' chip because the Subsystem 
line says "1274:8001".  But I don't really know what this means,
I'm just puzzled by it..

The first thing I did was try to load the es1371 module into the default
2.2.13 kernel (which has modules enabled in Slack 7).  The module appeared
to load fine, but couldn't get sound to work.  So I read Sound HOWTO.  
From that, I decided to learn how to build my own kernel.  I needed 
to know how to do that anyway, so it was a good reason.  I used 
'make xconfig' do to that, and I built the es1371 module
directly into my the kernel.   I enabled:

	Sound Card Support
	Creative Ensoniq AudioPCI 97 (ES1371)

I disabled:

	OSS Sound Modules 

because the README for that module says:

	CONFIG_SOUND_OSS:

	OSS is the Open Sound System suite of sound card drivers. They make
	sound programming easier since they provide a common API. Say Y or M
	here (the module will be called sound.o) if you haven't found a
	driver for your sound card above, then pick your driver from the
	list below.

and I had already selected "ES1371" above.

When I boot up with this kernel, dmesg
shows the following:

	es1371: version v0.13 time 15:00:31 Nov 30 1999
	es1371: found adapter at io 0xec00 irq 9
	es1371: features: joystick 0x0
	es1371: codec vendor  revision 0
	es1371: codec features none
	es1371: stereo enhancement: no 3D stereo enhancement

Now I'm getting confused, here's the section of the Sound HOWTO 
I'm puzzling about (I tried sending email to the Sound HOWTO provider,
but it bounced from the listed email address tranter@pobox.com)

>   4.5.  Booting Linux and Testing the Installation
> 
> 
>   You should now be ready to boot the new kernel and test the sound
>   drivers. Follow your usual procedure for installing and rebooting the
>   new kernel (keep the old kernel around in case of problems, of
>   course).
> 
>   During booting, check for a message such as the following on powerup
>   (if they scroll by too quickly to read, you may be able to retrieve
>   them with the dmesg command):
> 
>        Sound initialization started
>        <Sound Blaster 16 (4.13)> at 0x220 irq 5 dma 1,5
>        <Sound Blaster 16> at 0x330 irq 5 dma 0
>        <Yamaha OPL3 FM> at 0x388
> 
> 
>   This should match your sound card type and jumper settings (if any).
> 
>   Note that the above messages are not displayed when using loadable
>   sound driver module (unless you enable it, e.g. using insmod sound
>   trace_init=1).
> 
>   When the sound driver is linked into the kernel, the Sound
>   initialization started and Sound initialization complete messages
>   should be displayed. If they are not printed, it means that there is
>   no sound driver present in the kernel. In this case you should check
>   that you actually installed the kernel you compiled when enabling the
>   sound driver.
> 
>   If nothing is printed between the Sound initialization started and the
>   Sound initialization complete lines, it means that no sound devices
>   were detected. Most probably it means that you don't have the correct
>   driver enabled, the card is not supported, the I/O port is bad or that
>   you have a PnP card that has not been configured.
> 
>   The driver may also display some error messages and warnings during
>   boot. Watch for these when booting the first time after configuring
>   the sound driver.
> 
>   Next you should check the device file /dev/sndstat. Reading the sound
>   driver status device file should provide additional information on
>   whether the sound card driver initialized properly. Sample output
>   should look something like this:

I do not see the "Sound initialization started" or "Sound initialization 
complete" displayed; the HOWTO says you must.  So I started looking at 
the kernel source, in particular:

	drivers/sound/dev_table.h
	drivers/sound/dev_table.c

At first I thought that 'trace_init' was not being initialized correctly for
some reason, but that's not true.   It appears to me that dev_table.o 
gets compiled if and only if the kernel is built with "CONFIG_SOUND_OSS"
turned on.

If that is true, then I think the HOWTO is misleading, because it says
you must see the "Sound ***"  messages.  But I don't think you do see
them unless you build the OSS modules.  Am I mistaken ?

But, anyway, after I boot up,  

ls -l /dev/sndstat /dev/dsp shows:

crw-rw-rw-   1 root     sys       14,   3 Jul 18  1994 /dev/dsp
crw-rw-rw-   1 root     root      14,   6 Jul 18  1994 /dev/sndstat

which is good (I think :-)

But if I try to 'cat /dev/sndstat', I get:

	cat: /dev/sndstat: No such device

I also do not have a /proc/sound file, which I think I'm supposed to,
and that really has me stumped.....

I also download the demofiles mentioned in the Sound HOWTO and
tried to 

	cat endoftheworld > /dev/dsp

and it just hangs: it never returns and I don't get and sound.

I've heard from 2 people.  One said that the newest versions of 
the PCI 128 card may come with a chip that is not really an ES1371
and that might be my problem.  Perhaps that's true, but 'lspci'
sure thinks it is a ES1371.  The second person said he couldn't get his
PCI-128 with ES1371 to work, but his older PCI128 with ES1370 did
work.

So the last thing I tried was downloading the newest kernel: 2.2.14
and I discovered there were lots of changes to es1371.c.  So I 
built a whole new 2.2.14 kernel with es1371 support built directly
into the kernel, but I unfortunately go the same results.

I guess I'm really trying to find out if the sound card I have
is complatible with Linux or not.   If it's not, that would explain
my problems.  If it is compatible, then I'm trying to figure out
what the heck I need to do to get it working....

Thank you for any insights you can provide.



Paul Novak
pnovak@megsinet.com
