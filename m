From: Jon Masters <jonathan@easypenguin.co.uk>
Date: Sun, 18 Jun 2000 01:43:16 +0000
Subject: 4.1 surround question
Message-Id: <marc-linux-sound-96129264927897@msgid-missing>
List-Id: <linux-sound.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-sound@vger.kernel.org

Hi,
	I'm interested to know how Linux currently handles 4.1 surround setups.

In brief:
	I now own a set of Game Fury speakers from http://www.jazzspeakers.com

	I am building a 1GHz+ Athlon box at the moment (courtesy of a nice bank
manager...) for use on my comp. degree next term and have tested the
speakers with my old SB16 and SB64 cards, etc. but I cannot use the
soundcard in my old machine (for various reasons mostly due to being
"out of space") and so cannot yet play with it. The card uses the CMPCI
driver to do audio, but I am assuming that it only currently handles 2.1
channels?

What I would ideally want:

1). When no rear sounds are present or not available (e.g. 2 channel
joint stereo mp3) play the sound to all speakers and duplicate sound to
front/rear.

2). When 3d effects are present, play them properly - e.g. when using
livid (when it gets to that stage) or when using LinDVD (if it will
support that when it comes out at the end of this month or so).

Since I do not get chance to follow linux sound developments more
closely, can someone tell me the state of play so far. I would also like
to thank Alan for answering my previous question - Alan, you work too
hard :)

Someone will try introducing me to ALSA :) I know a little about Alsa
and I'm almost certain that OSS cannot handle 4 channels (I'll now be
told that I'm wrong :) so I realise it will probably mean using Alsa,
which is certainly no trouble/problem.

I would prefer to use the cmpci stuff for the time being as it saves
spending more on an sblive or somesuch (although I probably will buy an
sblive at some point simply because sb have made several good moves
recently - e.g. openal, etc.)

Jon.

-- 
Jonathan C. Masters             PGP&GeekCode available on request
jonathan@easypenguin.co.uk      SMS: mastersj@sms.genie.co.uk
Mobile: +44 777 61 31337        Hate Life? Call +44 870 60 10100
