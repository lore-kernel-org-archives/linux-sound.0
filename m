From: Rui Sousa <rsousa@grad.physics.sunysb.edu>
Date: Fri, 07 Apr 2000 20:08:29 +0000
Subject: Re: New problem...
Message-Id: <marc-linux-sound-95513841312586@msgid-missing>
List-Id: <linux-sound.vger.kernel.org>
References: <marc-linux-sound-95498321922404@msgid-missing>
In-Reply-To: <marc-linux-sound-95498321922404@msgid-missing>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-sound@vger.kernel.org

Paco wrote:
> 
> Me again...
> 
> After I finally got my SB-PCI512 working, I've now
> discovered that when I start up "gmix" to adjust the
> mixer levels, something happens to the emu10k1 module
> that prevents me from playing or recording from that
> point on.  Basically "gmix" kills my card.
> 
> The only way to get it working again is to "rmmod"
> followed by "modprobe" for the emu10k1.
> 
> Anybody else experienced anything like this?
> 
> -Paco

You should be posting your questions at the emu10k1
mailing list:

emu10k1-devel@opensource.creative.com

and maybe subscribe to it. There are more people there that can
help you and after all the driver isn't in the kernel, yet ;)

As for your problem, edit the main Makefile, set DEBUG = y,
and watch /var/log/messages for error messages...

Rui Sousa
