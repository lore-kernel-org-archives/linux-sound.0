From: benoit.rouits@lemel.fr (Benoit Rouits)
Date: Mon, 07 Dec 1998 21:38:12 +0000
Subject: GUS MAX problem
Message-Id: <marc-linux-sound-91311592623685@msgid-missing>
List-Id: <linux-sound.vger.kernel.org>
References: <marc-linux-sound-91295518418565@msgid-missing>
In-Reply-To: <marc-linux-sound-91295518418565@msgid-missing>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-sound@vger.kernel.org

Hello again,

Thank you for the adress of the GUS Project that you gave me.I tried again 
to look for irq problems but did not found it, so I will use now the 
"Perex's driver" because i can't do anything with the standard one.And this 
old one do not manage really aGUS MAX (ie: 16 bit recording and 32 
polyphonic voices) but a standard GUS thatis a 8-bit sample card. So, now i 
will be able to use TRUELY my GUS MAX.I also got the irq 11 for it but i 
added
 irq 5 for the midi features and DMA 1 for output and DMA 3 four input 
audio.

I'msurprised that you did not mentionned
 the midi irq in your reply: is it because this is unused? or because this 
mustbe the same as Gf1 irq? (i.e: 11 for me)

Maybe it is the reason for why my midi output doesn't work...I will try irq 
11 for all the sound card
.
bye ! Benoit.
