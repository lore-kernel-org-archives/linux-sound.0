From: Shaleh <shaleh@livenet.net>
Date: Tue, 13 Apr 1999 04:16:56 +0000
Subject: RE: How to load sound modules ?
Message-Id: <marc-linux-sound-92398731414865@msgid-missing>
List-Id: <linux-sound.vger.kernel.org>
References: <marc-linux-sound-92324572410041@msgid-missing>
In-Reply-To: <marc-linux-sound-92324572410041@msgid-missing>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-sound@vger.kernel.org


On 12-Apr-99 Kapoor, Nishikant X wrote:
> Hi all
> 
> I've managed to get my ESS1868 working with 2.2.2 on RedHat 5.1 but I'm
> having problem loading it through /etc/conf.modules. I'd appreciate any
> help on this.
> 
> /etc/conf.modules:
> -------
> alias char-major-14 sb
> post-install sb /sbin/modprobe "-k" "adlib_card"
> alias sound sb
> options -k sb io=0x220 irq=5 dma=1 dma16=-1
> alias sequencer uart401
> options -k uart401 io=0x330
> alias midi opl3
> options -k opl3 io=0x388

Do all of the alias stuff first.  otherwise it is not aware of the alias when
you use them (or so it would seem).

gestalt [/etc/modutils]$ cat sound 
alias char-major-14 sb
post-install sb /sbin/modprobe "-k" "adlib_card"
options sb io=0x220 irq=5 dma=1 dma16=5 mpu_io=0x330
options adlib_card io=0x388
