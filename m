From: Benno Senoner <sbenno@gardena.net>
Date: Thu, 04 May 2000 23:03:46 +0000
Subject: Re: sndconfig.. and something chewing up resources
Message-Id: <marc-linux-sound-95749344828010@msgid-missing>
List-Id: <linux-sound.vger.kernel.org>
References: <marc-linux-sound-95736719011682@msgid-missing>
In-Reply-To: <marc-linux-sound-95736719011682@msgid-missing>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-sound@vger.kernel.org

You may be right,
the problem is that esd uses too small buffers and doesn't run SCHED_FIFO
therefore high CUP/disk load can cause this kind of drouputs.

( try to grep for esd while you are playing sound, to see if it is running)

Anyway a kernel recompile won't help because it's not the kernel the
source of the problem.
(sndconfig just insmods the audio drivers, nothing magic :-) )

The problem is very probably the soundserver.

What kind of audio app are you running ?
As far I can tell you I run RH 6.2 and KDE here, and only mpg123 uses esd as
default.  xmms does direct /dev/dsp output except if you spefify esd in the
settings.

Plus try to tune your IDE harddisk with 
hdparm -d 1 -c 1 -u 1 /dev/hda (except if it's a crappy old IDE disk)

it helps alot, especially when doing disk I/O.

Benno.



On Wed, 03 May 2000, Josh Estelle wrote:
> I recently reinstalled my whole system, using RedHat 6.2.
> 
> In past installs I have always recompiled my kernel to gain sound card
> support for my Crystal Audio card.  This time I had heard about this
> until 'sndconfig' that came with RedHat so I decided to try it.  It
> worked slickly and now I've got sound.  But it appears to be doing sound
> using some daemons of sorts, ksoundaemon, esd?, kaudio, something like
> those... and it seems when I run anythign else that is at all processor
> intensive my sound playback gets coppy or drops out and does funny
> stuff.  I figure I'm just going to recompile my kernel and do it the old
> way and see if the problem persists.  Anyone have any ideas on what's
> going on?
> 
> My machine is a Dell Optiplex, 400mhz, 128MB ram..
> 
> Josh
> 
> 
> -- 
> 
> "You can be my Yoko Ono... You can follow me wherever I go..."
> 
>  - Barenaked Ladies
