From: benoit.rouits@lemel.fr (Benoit Rouits)
Date: Sun, 06 Dec 1998 02:19:33 +0000
Subject: GUS MAX problem
Message-Id: <marc-linux-sound-91295518418565@msgid-missing>
List-Id: <linux-sound.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-sound@vger.kernel.org

Hello,
(I'm not subscribed, please use reply)

I've got a problem with my 2.0.31 kernel
 and standard driver for GUS that is :

-When i use MIDI player first time, i get a segmentation fault. At the 
second time, the /dev/sequencer is said BUSY.But when i CAT foo.bar in /dev/
sequencer
, I can "hear" some midi message.(unsynchrnised of course) What's the 
problem?

- Secondly, wave sound works well but sometimes i get a big BUZZ when 
playing some file. I'm forced to reboot to get good sound again.

Any suggestion?

Thank's a lot .

P.S: My GUS MAX is an ISA one and works
 well under Micro$oft and I'm sure to not have any irq or dma conflicts.

Benoit Rouits
