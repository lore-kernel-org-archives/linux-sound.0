From: Jonathan Masters <mastersj@periscope-systems.freeserve.co.uk>
Date: Thu, 12 Aug 1999 16:22:51 +0000
Subject: Re: hdd & sound
Message-Id: <marc-linux-sound-93447648730422@msgid-missing>
List-Id: <linux-sound.vger.kernel.org>
References: <marc-linux-sound-93442291416140@msgid-missing>
In-Reply-To: <marc-linux-sound-93442291416140@msgid-missing>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-sound@vger.kernel.org

I noticed that too. I only have esd running on the sound card, but it
seems to do this with/without esd on /dev/dsp. Anyway, here is:

cat /proc/interupts
-------------

          CPU0
  0:    5059285          XT-PIC  timer
  1:      46017          XT-PIC  keyboard
  2:          0          XT-PIC  cascade
  4:    1320764          XT-PIC  serial
  5:   34087419          XT-PIC  soundblaster
 11:        187          XT-PIC  eth0
 12:    1547997          XT-PIC  PS/2 Mouse
 13:          1          XT-PIC  fpu
 14:     834840          XT-PIC  ide0
 15:      10788          XT-PIC  ide1
NMI:          0
ERR:          0

-------
killall esd
-------


cat /proc/interupts
-------------

           CPU0
  0:    5060624          XT-PIC  timer
  1:      46051          XT-PIC  keyboard
  2:          0          XT-PIC  cascade
  4:    1320769          XT-PIC  serial
  5:   34093966          XT-PIC  soundblaster
 11:        187          XT-PIC  eth0
 12:    1548207          XT-PIC  PS/2 Mouse
 13:          1          XT-PIC  fpu
 14:     834860          XT-PIC  ide0
 15:      10788          XT-PIC  ide1
NMI:          0
ERR:          0



and here is

cat /proc/sound:

[mastersj@periscope mastersj]$ cat /proc/sound
OSS/Free:3.8s2++-971130
Load type: Driver loaded as a module
Kernel: Linux periscope 2.2.11 #22 SMP Thu Aug 12 03:00:17 BST 1999 i686

Config options: 0

Installed drivers:

Card config:

Audio devices:
0: Sound Blaster 16 (4.16) (DUPLEX)

Synth devices:
0: AWE32-0.4.3 (RAM512k)

Midi devices:
0: Sound Blaster 16
1: AWE Midi Emu

Timers:
0: System clock

Mixers:
0: Sound Blaster


So esd makes no difference.
HOPE this helps.

Jon.


Roger Larsson wrote:

> Hi,
>
> The soundblaster!
>
> And you did not play any sound?
> During 5 s it gave 3460 interrupts! That is almost 700 interrupts / s
> (every 1.5 ms) What is going on?
>
> What sound system are you using?
> cat /proc/sound
>
> An idea is forming!
>
> Wakko could you also try (idle system):
>  cat /proc/interrupts > irq.proc
>  sleep 5
>  cat /proc/interrupts >> irq.proc     # note: append!
>
> /RogerL
>
> >            CPU0
> >   0:    3797062          XT-PIC  timer
> >   1:      41269          XT-PIC  keyboard
> >   2:          0          XT-PIC  cascade
> >   4:    1238719          XT-PIC  serial
> >   5:   25616073          XT-PIC  soundblaster
> >  11:        153          XT-PIC  eth0
> >  12:    1294293          XT-PIC  PS/2 Mouse
> >  13:          1          XT-PIC  fpu
> >  14:     340745          XT-PIC  ide0
> >  15:      10788          XT-PIC  ide1
> > NMI:          0
> > ERR:          0
> >            CPU0
> >   0:    3797565          XT-PIC  timer
> >   1:      41273          XT-PIC  keyboard
> >   2:          0          XT-PIC  cascade
> >   4:    1239076          XT-PIC  serial
> >   5:   25619533          XT-PIC  soundblaster
> >  11:        153          XT-PIC  eth0
> >  12:    1294866          XT-PIC  PS/2 Mouse
> >  13:          1          XT-PIC  fpu
> >  14:     340765          XT-PIC  ide0
> >  15:      10788          XT-PIC  ide1
> > NMI:          0
> > ERR:          0

--
Jonathan C. Masters                     (jonathan@oxlug.org)
                                        PGP: www.brookes.ac.uk/~95227860/KEY

           "Upon this rock I will build my church,
            and the gates of hell shall not prevail against it".

                 -- Matthew 16, 17-18
