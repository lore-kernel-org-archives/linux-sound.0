From: Bill Nottingham <notting@redhat.com>
Date: Wed, 23 Jun 1999 21:36:50 +0000
Subject: Re: ES1371 problems
Message-Id: <marc-linux-sound-93017500602697@msgid-missing>
List-Id: <linux-sound.vger.kernel.org>
References: <marc-linux-sound-93017242300244@msgid-missing>
In-Reply-To: <marc-linux-sound-93017242300244@msgid-missing>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-sound@vger.kernel.org

Santos Halpar (sjhalpar@yahoo.com) said: 
> cat'ing /dev/sndstat gives
> "cat: /dev/sndstat: No such device", which would indicate that I
> need to load the appropriate module -- but es1371 isn't one of the
> OSS modules, so I'm not too sure about that.

The PCI drivers don't support the /dev/sndstat interface; there
is no 'appropriate module'.

> If I run "play file.wav", it hangs until I kill the
> spawned sox process -- sndconfig hangs similarly when it tries
> to play a sample file.  It's not a volume issue and sound works
> fine in NT.

Where does 'strace play file.wav' say that it's hanging?

Bill
