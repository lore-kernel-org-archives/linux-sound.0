From: Florin Andrei <florin@expert.ro>
Date: Thu, 17 Sep 1998 09:13:16 +0000
Subject: rplay
Message-Id: <marc-linux-sound-90602476925576@msgid-missing>
List-Id: <linux-sound.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-sound@vger.kernel.org

I really don't like to push, but i'm in a big hurry, so please answer
quick! :-)

	I'm doing some experiments with rplay-rplayd. Locally (on one single
computer) i can play .au files and also audio CD's ("rplay cdrom:").
Over a network i managed somehow to play sound files ("rplay
--host=my.sound.server sample.au") but that's all.
	I wanna play live sound over a network, i.e. with two computers, no.1
having a sound source plugged into "line in" or "mic", no.2 having "line
out" plugged into an amplifier. How can i do that?
	I tried to read /dev/dsp as sound source, but rplayd seems not to read
it. When i compiled rplayd, i didn't put /dev as a forbidden directory
(as opposed to the default setting).
	I also failed to play audio CDs over the net (having CD in one computer
and listening it on another). How can i do that?

	The rplay documentation is really weak. It says it can play live sounds
over a network, but there is no example! Only that stuff with the .au
files.

	Please, if you have any solutions, send them quickly, i'm in a sort of
trouble. I'll also appreciate any solution other than rplay to send
sound over the net at a quality higher than RealAudio (i actually need
an almost FM quality, or something that sounds like that for an
unexperienced listener).
	Thanks.

							Florin Andrei
