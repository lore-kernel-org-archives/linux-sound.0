From: Sangohn Christian <sango-ch@reze-1.rz.rwth-aachen.de>
Date: Wed, 28 Oct 1998 06:27:58 +0000
Subject: Sound under 2.1.125
Message-Id: <marc-linux-sound-90956439330548@msgid-missing>
List-Id: <linux-sound.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-sound@vger.kernel.org

Hello people!

I have Kernels 2.0.35smp and 2.1.125 with sound modules for the SB-AWE32.
With 2.0.35 there is no problem.
But I can't hear anything wtih 2.1.125. Kmix puts out:
"There is no mixer support for your system" although "ls -l /dev/mixer" 
is there:
crw-rw-r--   1 root     audio     14,   0 Jul 21 02:45 /dev/mixer

I've read the documentation in the Kernel sources.

So how can I fix that?

Thanks.
