From: =?iso-8859-1?q?Lars=20Joas?= <ljoas@yahoo.com>
Date: Sun, 15 Jul 2001 12:13:32 +0000
Subject: [PATCH] Sound recording with OPL3SA2
Message-Id: <marc-linux-sound-99519931815581@msgid-missing>
List-Id: <linux-sound.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-sound@vger.kernel.org

Hi.

I got this message in the log when I tried to do sound recording:

"Sound: DMA (input) timed out - IRQ/DRQ config error?"

After some investigations I found a bug in the opl3sa2 driver. I have
sent this patch to Scott Murray (scott@spiteful.org), but received no
answer. And the bug is still in kernel 2.4.6.

So now I escalate the issue to the linux-sound mailing list....

In the attach_opl3sa2() function we look at the dma values to see if we

are using two or one channel, and configure the chip accordingly.
Unfortunately the dma values are not set in the structure we look at.

Please CC any comments to me, ljoas@yahoo.com, thanks.

Patch:

--- linux-2.4.6.org/drivers/sound/opl3sa2.c     Sun Jun 24 11:31:24
2001
+++ linux-2.4.6/drivers/sound/opl3sa2.c Sun Jun 24 11:32:47 2001
@@ -703,7 +703,7 @@
       opl3sa2_write(hw_config->io_base, OPL3SA2_IRQ_CONFIG, 0x0d);

       /* Initialize DMA configuration */
-       if(hw_config->dma2 = hw_config->dma) {
+       if(cfg_mss[card].dma2 = cfg_mss[card].dma) {
               /* Want DMA configuration DMA-B: -, DMA-A: WSS-P+WSS-R
*/
               opl3sa2_write(hw_config->io_base, OPL3SA2_DMA_CONFIG,
0x03);
       }



/L



____________________________________________________________
Do You Yahoo!?
Get your free @yahoo.co.uk address at http://mail.yahoo.co.uk
or your free @yahoo.ie address at http://mail.yahoo.ie
-
To unsubscribe from this list: send the line "unsubscribe linux-sound" in
the body of a message to majordomo@vger.kernel.org
