From: Thomas Sailer <sailer@ife.ee.ethz.ch>
Date: Fri, 18 Feb 2000 10:01:24 +0000
Subject: Re: es1371 oops (i think)
Message-Id: <marc-linux-sound-95087503000047@msgid-missing>
List-Id: <linux-sound.vger.kernel.org>
References: <marc-linux-sound-95082380432757@msgid-missing>
In-Reply-To: <marc-linux-sound-95082380432757@msgid-missing>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-sound@vger.kernel.org

Jarek Luberek wrote:
> 
> Hi,
> 
> I hope this helps.
> System is a dual PIII 450 (SMP).
> Compiler: egcs-2.91.66
> Glibc: 2.1.1 (redhat 6.1).
> Kernel: 2.3.46
> 
> Running kmix or gmix causes a sig11 in
> ioctl.

It's an ac97_codec bug that should be
fixed in 2.3.47-3

Tom
