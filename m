From: Roberto Pavan <rpavan@physics.ubc.ca>
Date: Fri, 04 Dec 1998 08:01:21 +0000
Subject: OPTi 925 PnP
Message-Id: <marc-linux-sound-91279517822515@msgid-missing>
List-Id: <linux-sound.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-sound@vger.kernel.org

I'm not a subscriber to this list, so I'd appreciate receiving a direct
response if anyone would like to help me.

I'm having a little trouble getting my OPTi 925 PnP working under OSS
Free.

After setting up its resources with isapnptools, I noticed at boot that
OSS was loading the ad1848 and uart401 modules, so I set about trying to
configure them in /etc/conf.modules:

alias sound ad1848
alias midi uart401
options ad1848 io=0x0220 irq=5 dma=0 dma2=1
options uart401 io=0x300 irq=9

The uart module loads up just fine, but I get an error with the ad1848
at boot:
/lib/modules/preferred/misc/ad1848.0:  init_module: Device or resource
busy
sound:  device or resource busy

In fact, if I remove all sound modules, and try to load in the ad1848
with modprobe, I get the same error.

But  /cat/proc/interrupts / dma / ioports      don't show any
conflcts.   These are the same resources used by the card in Win98 on
the same machine.  Am I missing something?  I'm not sure of the syntax
for the conf.modules file.  I lifted it from another machine using an
SB16.
--
Your faithful narrator,
Roberto Pavan rpavan@physics.ubc.ca

In some countries what I do is considered normal.
