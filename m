From: Thomas Sailer <sailer@ife.ee.ethz.ch>
Date: Thu, 05 Aug 1999 17:04:59 +0000
Subject: Re: MPEG Support
Message-Id: <marc-linux-sound-93387262113707@msgid-missing>
List-Id: <linux-sound.vger.kernel.org>
References: <marc-linux-sound-93371079221997@msgid-missing>
In-Reply-To: <marc-linux-sound-93371079221997@msgid-missing>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-sound@vger.kernel.org

sbenno@gardena.net wrote:

> Tom, could you please explain why we can't use these instructions in kernel
> mode ?
> I thougth that Linux don't use FP due to performance reasons, but not
> because it's not allowed.
> RT Linux seems to have some FP restrictions as well, but I think this is
> due to the fact that FP instructions could cause exceptions, which might
> ruin RT responsiveness by a few usecs.
> :-)

Exceptions are one thing, the other is that the kernel doesn't save FPU
state
in the normal case (it does so lazily when switching user space apps).

You could do fsave;fninit by hand, but that would be unportable to other
archs and depending on where you do it would ruin some fast paths
(like lazy FPU switching 8-)). And fsave/frestore is expensive.

Tom
