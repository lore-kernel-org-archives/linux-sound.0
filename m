From: Benno Senoner <sbenno@gardena.net>
Date: Fri, 13 Aug 1999 12:41:51 +0000
Subject: Re: File descriptors and Sound
Message-Id: <marc-linux-sound-93459132807823@msgid-missing>
List-Id: <linux-sound.vger.kernel.org>
References: <marc-linux-sound-93415570309034@msgid-missing>
In-Reply-To: <marc-linux-sound-93415570309034@msgid-missing>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-sound@vger.kernel.org

On Mon, 09 Aug 1999, Alan Cox wrote:
> > If the device is full-duplex how can I have one application
> > reading it and another writing?
> 
> You either do file handle passing (funky) or normally one program runs the
> other: ie
> 
> 	open file
> 	fork()
> 	
> 	child:
> 		exec other app (which inherits file)
> 		exit
> 
> 	parent:
> 		run code

ok,
but what if one wants to implement some sort of MIDI-thru util ?
(not related to /dev/audio but /dev/midi , but the problem is the same:
2 different apps want to access to the same device,
the one in O_RDONLY , the other in O_WRONLY mode)

For example:

/dev/midi00   external midi port
/dev/midi01   AWE64 internal synth

Assume the midi-thru util opens /dev/midi00 in O_RDONLY and /dev/midi01 in
O_WRONLY mode.
The app reads the incoming midi data from the midi00 device and applies certain
event filters and then writes the data to /dev/midi01. (the synth).

It would be nice if a sequencer was still able to to write to /dev/midi00 to
drive an external synth.

Since the sequencer tries to open /dev/midi00 
(assuming that the sequencer opens the device only in O_WRONLY mode),
 I can't use the fork() method to inherit filehandles.
Is there a way to do this ?

What is in your opinion the best way to implement a virtual midi device in
userspace ? Like the midi-thru example
Using a regular named pipe ?
But sequencers would not recognize this virtual device since they look in
/dev/sndstat for available devices.


regards,
Benno.
