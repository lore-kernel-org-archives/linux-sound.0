From: "Jacek M. Holeczek" <holeczek@us.edu.pl>
Date: Sat, 16 Jan 1999 17:19:04 +0000
Subject: ESS ES1689 OSS/Free help needed
Message-Id: <marc-linux-sound-91650730927120@msgid-missing>
List-Id: <linux-sound.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-sound@vger.kernel.org

Hi,
I just upgraded my machine to RH5.2, then upgraded the kernel to 2.0.36-3,
and ... these are are black days for me.
As usually the RH sound doesn't work, unfortunately the usual place where
I could get a working code ( http://www.4front-tech.com/ossfree ) says
it's no longer there, and IT REALLY ISN'T.
NEED HELP. If anyone knows where I can get the Hannu Savolainen's version
of OSS/Free, please tell me ( it was there some days/weeks ago, even the
version for the 2.0.36 kernel - I checked it, but now ... it's gone ).
Please help,
Jacek.
PS. If anyone cares - what's wrong with RH5.2 sound - sndconfig recognizes
my card as ES1868 ( not bad ), then it modifies the /etc/conf.modules
( and what it does there is o.k. ). It also creates /etc/isapnp.conf, but
I remove it - my card if fully configured by my bios. Then it loads all
required modules and the /etc/sndconfig looks well, but ... it doesn't
really work :
	1. "cat sample.au > /dev/audio" works
	2. "cat something.wav > /dev/dsp" produces terrible noise, just
	   like I was doing "cat something.wav > /dev/audio", or "cat
	   something.au > /dev/dsp"
	3. "dd bs=8k count=4 < /dev/audio > sample.au" works, I can also
	   get the recorded sample.au played using "cat ... > /dev/audio"
	4. "dd bs=8k count=4 < /dev/dsp > sample.wav" works, I can also
	   get the recorded sample.wav played using "cat ... > /dev/dsp"
	5. none of recored samples ( from points 3. and 4. ) is in correct
	   format - I cannot play them in Win95 ( I can play the original
	   sample.au used in point 1., which contains the voice of Linus,
	   how he pronounces Linux, in Win95 without problems )
	6. "playmidi -f something.mid" ( opl3 ) doesn't work at all - the
	   program simply exits as soon as it is started, "playmidi -r -f
	   something.mid" produces core dump as soon as it is started
	7. "playmidi -e (-D0) something.mid" ( uart401+WaveTable ? )
	   doesn't work at all - the program does something ( you can see
	   that it "plays" if you use the "-r" flag ), but there is no
	   single sound to be heard
Jacek.
