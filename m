From: "Mark R. Boyns" <boyns@sdsu.edu>
Date: Thu, 17 Sep 1998 16:42:27 +0000
Subject: Re: rplay
Message-Id: <marc-linux-sound-90606097408167@msgid-missing>
List-Id: <linux-sound.vger.kernel.org>
References: <marc-linux-sound-90602476925576@msgid-missing>
In-Reply-To: <marc-linux-sound-90602476925576@msgid-missing>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-sound@vger.kernel.org

> I really don't like to push, but i'm in a big hurry, so please answer
> quick! :-)

I'm the author of rplay and received this message from a friend
subscribed to this list.

> 	I'm doing some experiments with rplay-rplayd. Locally (on one single
> computer) i can play .au files and also audio CD's ("rplay cdrom:").
> Over a network i managed somehow to play sound files ("rplay
> --host=my.sound.server sample.au") but that's all.
> 	I wanna play live sound over a network, i.e. with two computers, no.1
> having a sound source plugged into "line in" or "mic", no.2 having "line
> out" plugged into an amplifier. How can i do that?
> 	I tried to read /dev/dsp as sound source, but rplayd seems not to read
> it. When i compiled rplayd, i didn't put /dev as a forbidden directory
> (as opposed to the default setting).
> 	I also failed to play audio CDs over the net (having CD in one computer
> and listening it on another). How can i do that?
> 
> 	The rplay documentation is really weak. It says it can play live sounds
> over a network, but there is no example! Only that stuff with the .au
> files.

Yes, rplay can be used for live audio.  A few years ago I used the
rplay GSM support to implement a real-time chat program to talk with a
person in Europe.  The latest version of rplay can also play mp3s
"live" over the network.

To do live audio with the rplay program you need to do something like
this:

$ rplay -h somehost --info=ulaw,8000,8,1,big-endian,0 - < some-input-source

Here somehost is the host running rplayd, the info describes the audio
format being sent, - means read from stdin, and some-input-source is
where to read the audio from, like a microphone, a pipe, etc.  Note
that if the audio input has a standard sound header you don't need the
--info.

Depending on the speed of your network you might need to use a
compressed audio format.  rplayd can decompress the following ADPCM
formats: G.721 4-bit, G.723 3-bit, G.723 5-bit, and also GSM.  If your
computers are reasonably fast try this:

$ toast -c <some-input-source> | rplay -h somehost --info-gsm -

(toast is a GSM compression program)

Good luck.
