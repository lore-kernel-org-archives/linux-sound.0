From: =?ISO-8859-1?Q?
Date: Sun, 16 Jan 2000 16:27:49 +0000
Subject: Re: MIDI programming
Message-Id: <marc-linux-sound-94810763320869@msgid-missing>
List-Id: <linux-sound.vger.kernel.org>
References: <marc-linux-sound-94791780628504@msgid-missing>
In-Reply-To: <marc-linux-sound-94791780628504@msgid-missing>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-sound@vger.kernel.org

	Hi!

On Fri, Jan 14, 2000 at 11:17:47PM -0800, est@hyperreal.org wrote:
> > 	Can anyone give me a hint at writing a simple
> > program to read MIDI keyboard input? I don't want to parse
> > this input, just to test the presence of the keyboard under
> > Linux.
> > 
> > 	Taras
> 
> dd bs=1 if=/dev/midi | od -t x1 --width=1
> ..works for me.  I strike a key and get:
> 
> 0000000 fe
> *
> 0000020 90

	I've tried this before but never got a byte :(
Maybe, my configuration is incorrect:

OSS/Free:3.8s2++-971130
Load type: Driver loaded as a module
Kernel: Linux flex.dorms.msu.ru 2.2.14pre18 #2 Wed Jan 5 22:17:13 MSK 2000 i586
Config options: 0

Installed drivers: 

Card config: 

Audio devices:
0: ESS ES1868 AudioDrive (rev 11) (3.01)

Synth devices:
0: Yamaha OPL3

Midi devices:
0: MPU-401 (UART) MIDI

Timers:
0: System clock

Mixers:
0: Sound Blaster


	I've tried both uart401 and mpu401 modules but none
of them responses to key presses. Maybe there's some trick
with interrupt setting?

	The soundcard is detected right, audio and midi
playback is ok, but I can't read MIDI.

	Can anyone help me in getting my MIDI keyboard
working under Linux? (In Windows it works perfectly.)

	Thanks in advance,
	Taras
