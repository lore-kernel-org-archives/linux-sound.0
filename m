From: Thomas Sailer <sailer@scs.ch>
Date: Sun, 15 Feb 2004 10:09:36 +0000
Subject: Re: kernel 2.4.21-pre5 and 7
Message-Id: <402F4560.3050304@scs.ch>
List-Id: <linux-sound.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-sound@vger.kernel.org

Donn aka N5XWB wrote:

> drivers/sound/sounddrivers.o: In function `es1370_probe':
> drivers/sound/sounddrivers.o(.text+0x5bcb): undefined
> reference to `gameport_register_port'
> drivers/sound/sounddrivers.o: In function `es1370_remove':
> drivers/sound/sounddrivers.o(.text+0x5d5f): undefined
> reference to `gameport_unregister_port'
> make: *** [vmlinux] Error 1

try loading the gameport module first

