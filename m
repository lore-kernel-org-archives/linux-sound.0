From: hines_j@iolinc.net (Hines, Jim)
Date: Thu, 08 Jul 1999 03:47:33 +0000
Subject: Soundblaster AWE64 question
Message-Id: <marc-linux-sound-93140578308922@msgid-missing>
List-Id: <linux-sound.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-sound@vger.kernel.org

Hello,
I have a SB-AWE64 with registered OSS with mixer and AWE options. The card
supports both 8 and 16 bit recording. However, whenever I do issue a 
cat /proc/dma
I get this return.

 1: SoundBlaster8
 4: cascade
 5: SoundBlaster16
 7: aha1542

What is dma 1 used for and why is it set for Soundblaster8 as opposed to 16? I
would naturally assume that  dma 1 is input while dma 5 is the output. Correct?
Someone please explain this to me.

Thanks,
Jim Hines
400mhz AMDk6-2 98mb
RedHat 5.2 (2.0.36)
