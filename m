From: Scott Murray <scott@spiteful.org>
Date: Sun, 15 Jul 2001 20:36:27 +0000
Subject: Re: [PATCH] Sound recording with OPL3SA2
Message-Id: <marc-linux-sound-99523125312133@msgid-missing>
List-Id: <linux-sound.vger.kernel.org>
References: <marc-linux-sound-99519931815581@msgid-missing>
In-Reply-To: <marc-linux-sound-99519931815581@msgid-missing>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-sound@vger.kernel.org

On Sun, 15 Jul 2001, Lars Joas wrote:

> Hi.
>
> I got this message in the log when I tried to do sound recording:
>
> "Sound: DMA (input) timed out - IRQ/DRQ config error?"
>
> After some investigations I found a bug in the opl3sa2 driver. I have
> sent this patch to Scott Murray (scott@spiteful.org), but received no
> answer. And the bug is still in kernel 2.4.6.
>
> So now I escalate the issue to the linux-sound mailing list....
>
> In the attach_opl3sa2() function we look at the dma values to see if we
> are using two or one channel, and configure the chip accordingly.
> Unfortunately the dma values are not set in the structure we look at.

I apologize for not getting back to you earlier.  I've been extremely
busy at the startup I work for, and on top of that, I recently lost a
bunch of mail.  There's a reason why linux-sound is listed in my
MAINTAINERS entry, posting to it gets me off my butt. :)

Anyways, after looking at this, I prefer this IMO more correct fix:

--- linux-2.4.6/drivers/sound/opl3sa2.c	Fri Mar  2 21:38:39 2001
+++ linux/drivers/sound/opl3sa2.c	Sun Jul 15 16:28:38 2001
@@ -861,8 +861,8 @@
 	/* Our own config: */
 	hw_cfg->io_base = dev->resource[4].start;
 	hw_cfg->irq     = 0;
-	hw_cfg->dma     = -1;
-	hw_cfg->dma2    = -1;
+	hw_cfg->dma     = dev->dma_resource[0].start;
+	hw_cfg->dma2    = dev->dma_resource[1].start;

 	/* The MSS config: */
 	mss_cfg->io_base      = dev->resource[1].start;

Lars, could you try this out and see if it works for you?

Scott


-- 
======================================Scott Murray                                        email: scott@spiteful.org
http://www.spiteful.org (coming soon)                 ICQ: 10602428
-----------------------------------------------------------------------------
     "Good, bad ... I'm the guy with the gun." - Ash, "Army of Darkness"

-
To unsubscribe from this list: send the line "unsubscribe linux-sound" in
the body of a message to majordomo@vger.kernel.org
