From: Georg Wendt <Georg.Wendt@stud.uni-karlsruhe.de>
Date: Wed, 03 Mar 1999 16:55:46 +0000
Subject: Full Duplex (Play + Record simultaniously)
Message-Id: <marc-linux-sound-92048039409666@msgid-missing>
List-Id: <linux-sound.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-sound@vger.kernel.org

Hello,

I wanna use a record-programm running in one shell and playback audio
started on another shell.
However, whenever one of the programs has started, it blocks the
dsp-device and the other application can't work.
Is there a way to avoid this effect?
Since I work on the sourcecode of the player and the recorder, I don't
care if there's a solution where I need to set some sort
Systemparameters...

Another way: What about using two soundcards, one for playback, the
other for recording? Since I can decide the sound-device used by the
applications, this should work, shouldn't it?

Thanx a lot for any answer!!! :-)

Ciao Georg
