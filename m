From: Benno Senoner <sbenno@em.gardena.net>
Date: Mon, 01 May 2000 00:17:52 +0000
Subject: Re: midi controllers + laptop
Message-Id: <marc-linux-sound-95714035902810@msgid-missing>
List-Id: <linux-sound.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-sound@vger.kernel.org

Hi,

assumption 1:
you have a dumb MIDI interface which is a cable from serial port
to DIN connector, and requires that you run at 31250bps,
this will simply not work on a PC independently of the OS,
because the UARTS found in PC hardware simply do not support
the 31250 baudrate since the baudrate has to be an integer divisor
of 4*115200 , and unfortunately this is not possible for 31250.
(the AMIGA serial port was able to use the 31250bps rate, therefore
the MIDI interface was really cheap to implement)

assumption 2:
you have a true serial to MIDI interface
(like this one http://www.maxmidi.com/diy/serial/index.html)
which runs the PC to midi box at standard baudrates
(38400,57600 etc) and the MIDI part at 31250bps then
it sould be quite easy to support serial MIDI interfaces.

/dev/midi00 behaves like a std serial device except athat it runs 
always at 31250bps.

Therefore the trick would be to run your app using the 
LD_PRELOAD trick which overloads the open() syscall. 
(implementing the LD_PRELOAD wrapper should be really trivial,
but I have not that kind of hardware here to test that kind
of program)

The wrapper simply has to check if the opening of /dev/midi00
has been requested, then if yes open
/dev/ttyS0 (or S1) instead, set the the serial port in RAW mode
and baudrate to 38400 (or higher) and return the filedescriptor.

at this point apps using RAW MIDI I/O should work ok
(like Softwerk for example).

Notice that there are some apps which use the OSS or ALSA sequencer,
therefore this trick would not work.
But there seem to be solutions to this problem.
(alsa virtual MIDI port, and similar module for OSS)
(please look at the linux-audio-dev and alsa-devel archives of
the last two weeks )

ALSA folks, would it be possible to redirect the ALSA sequencer
output to a serial MIDI device ? If yes what are the right
steps to do this ?

Benno.

> hi,
> 
> i can't seem to find any info about using external midi interfaces with
> linux. i'm using a laptop (dell inspiron 7500, which works very well
> with linux!) so my soundcard (maestro IIe) doesn't have a midi port on
> it...i use a number of midi controllers (like the peavey pc1600 fader
> box) when performing, and i'd love to move some of my software over to
> linux...
> 
> so can i just get a standard midi interface and hook it up to my serial
> port? i can't find any info at all on this, all i'm finding is "how to
> play midi files using your soundcard type stuff."
> 
> thanks,
> douglas
> 
