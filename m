From: Guenther Sohler <guenther.sohler@newlogic.at>
Date: Tue, 07 Dec 1999 06:11:08 +0000
Subject: OSS/ALSA recording
Message-Id: <marc-linux-sound-94454719227580@msgid-missing>
List-Id: <linux-sound.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-sound@vger.kernel.org

At the moment I use the OSS soudn drivers.

I have written a tiny program, which reads in /dev/dsp for one second and
displays the waves in a little X-Window.
So I was able to see the waves.
By playing with the mixers, I was also able to record from the sequencer.

Next step was to display the data, wwhich another prg has written to
/dev/dsp(sine curvers for example)

Unconfortunately I cannot have on prg /dev/dsp for read and another prg
/dev/dsp for write.

Is there a workaround ?

Is it possible within ALSA ?
If not, is it worth implementing this in ALSA ?(Is it easy ? )

I also wanted to try setupping/compiling also.

All scripts there say
'Please use the configure script first' , But there is no configure script at
all.

What Do I do wrong ?

Hoping for much reply

Thanx in Advance
