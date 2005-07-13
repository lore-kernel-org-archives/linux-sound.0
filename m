From: riccardo pellegrini <riccardo.pellegrini@alice.it>
Date: Wed, 13 Jul 2005 12:27:00 +0000
Subject: es1878 soundcards problem
Message-Id: <20050713142700.6738008a.riccardo.pellegrini@alice.it>
List-Id: <linux-sound.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-sound@vger.kernel.org

Hello,
First of all, sorry for my english.
I have an old laptop compaq armada 1573d, on which I installed vector-linux 3.2.
Looking in windows I saw that the sound-card is es1878 with this configuration:
io=0x220 irq=5 dma=5 dma16=1 mpu_io=0x300.
I used these values with kernel-module sb, and dmesg says:

sb: No ISAPnP cards found, trying standard ones...
SB 3.01 detected OK (220)
ESS chip ES1878 detected
ESS1688: Invalid DMA8 5
<ESS ES1878 AudioDrive (rev 11) (3.01)> at 0x220 irq 5 dma 5,1

When I play simple file of type .au or for example /xfce/sound/beep02.wav all is ok but if I play mp3 it sounds only noise like a radio without any station.
Does anyone know what could be the problem? 
Thank you, ciao
