From: Carsten Friebel <carsten_friebel@gmx.net>
Date: Thu, 10 Jun 1999 23:35:36 +0000
Subject: SB32 Suse6.1
Message-Id: <marc-linux-sound-92906274826363@msgid-missing>
List-Id: <linux-sound.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-sound@vger.kernel.org

Hello,

I got aproblem with an original SB32. I have done the pnpdump and isapnp
thing and it works like shown in the book.

isapnp isapnp.conf shows 4 devices (Audio, Game, wavetable, IDE).

I tried to load the sb modul with

modprobe sb io=0x0220 irq=5 dma=1 dma16=5 mpu_io=0x0330

but an lsmod didn't show the correct answer.

any hints for me


Carsten Friebel
Berlin, Germany
