From: Oleg <o.zybin@mail.ru>
Date: Wed, 01 May 2013 13:14:32 +0000
Subject: s3c2443-uda134x sound driver problem
Message-Id: <20130501171432.94768eee1528cac1b4e98f9d@mail.ru>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="Multipart=_Wed__1_May_2013_17_14_32_+0400_/_Eip1oH5U5J1d4C"
List-Id: <linux-sound.vger.kernel.org>
References: <20130501162206.415bfb476da4147c638cbe99@mail.ru>
In-Reply-To: <20130501162206.415bfb476da4147c638cbe99@mail.ru>
To: linux-sound@vger.kernel.org

This is a multi-part message in MIME format.

--Multipart=_Wed__1_May_2013_17_14_32_+0400_/_Eip1oH5U5J1d4C
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

Hello

I need to write a driver for codec uda134 installed on plat with processor s3c2443. I use driver for uda134 that is already in the kernel 3.6 (s3c24xx-uda134x) and IIS driver (s3c24xx-i2s). IIS driver is not compatible with processor s3c2443, and I changed in that iis registers and a few functions (attching patch). I have a problem with sound output. When audio file is playing sound interrupts (using alsa 1.0.26). Here is a part of debug output (output1.txt). Time between end of enqueue and start of the next buffdone is about 0.5 second, but expected is about 0.1 second. It seems that problem is size of dma buffer. I tried to forcibly change size of buffer
in kernel/linux/sound/soc/samsung/dma.c, line 212

prtd->dma_end = prtd->dma_end - (prtd->dma_end - prtd->dma_start)/2;    

and interrupt disappeared, but sound distorted. Here is a part of debug output is such conditions (output2.txt). Here time bitween end of enqueue and start of the next buffdone satisfactory

What may be the cause and how to fix it? please help

-- 
Oleg <o.zybin@mail.ru> 

--Multipart=_Wed__1_May_2013_17_14_32_+0400_/_Eip1oH5U5J1d4C
Content-Type: text/plain;
 name="output2.txt"
Content-Disposition: attachment;
 filename="output2.txt"
Content-Transfer-Encoding: 7bit

Entered audio_buffdone
time buffdone 946686841.487337
Entered dma_pointer
Pointer offset: 0
dma_period 8192
Entered dma_enqueue
dma_enqueue: loaded 1, limit 2
dma_end 868372480 dma_start 868352000 dma_period 8192 limit 2
dma_loaded: 1
s3c2410_dma_enqueue: id=c3ae7800, data=33c20000, size=16384
s3c2410_dma_enqueue: new buffer c2cd9380
dma0: s3c2410_dma_enqueue: buffer c2cd9380 queued onto non-empty channel
s3c2410_chan_loadbuffer: loading buff c2cd9380 (0x33c20000,0x004000)
time enqueue 946686841.490582
Entered audio_buffdone
time buffdone 946686841.640845
--Multipart=_Wed__1_May_2013_17_14_32_+0400_/_Eip1oH5U5J1d4C
Content-Type: text/plain;
 name="output1.txt"
Content-Disposition: attachment;
 filename="output1.txt"
Content-Transfer-Encoding: 7bit

~ # aplay /data/4s.wav 
Entered dma_open
s3c24xx_uda134x_startup 0
Playing WAVE '/data/4s.wav' : Signed 16 bit Little Endian, Rate 22050 Hz, Mono
s3c24xx_uda134x_hw_params desired rate 22050, 8
s3c24xx_uda134x_hw_params will use: 384FS PCLK 8 sysclk 8467200 err 322
Entered s3c24xx_i2s_set_fmt
Entered s3c24xx_i2s_set_sysclk
Entered s3c24xx_i2s_set_clkdiv
Entered s3c24xx_i2s_set_clkdiv
Entered s3c24xx_i2s_set_clkdiv
Entered s3c24xx_i2s_hw_params
Entered dma_hw_params
params c054deb8, client c054dee8, channel 10
dma10: s3c2410_request_dma: client=I2S PCM Stereo out, dev=  (null)
mapped channel 10 to 0
dma10: s3c2410_dma_request : requesting irq 88
s3c2410_dma_request: channel initialised, c055be58
s3c2410_dma_devconfig: source=1, devaddr=55000010
s3c2410_dma_devconfig: mem source, devaddr=55000010, hwcfg=3
s3c2410_dma_config: chan=10, xfer_unit=2
s3c2410_dma_config: dcon is 00000000
s3c2410_dma_config: dcon now a0900000
Entered dma_mmap
Entered dma_prepare
s3c2410_dma_ctrl DMAOP_FLUSH
s3c2410_dma_flush: chan c055be58 (0)
dma_period 8192
Entered dma_enqueue
dma_enqueue: loaded 0, limit 5
dma_end 868392960 dma_start 868352000 dma_period 8192 limit 5
dma_loaded: 0
s3c2410_dma_enqueue: id=c384b8a0, data=33c20000, size=40960
s3c2410_dma_enqueue: new buffer c2b333c0
s3c2410_dma_enqueue: buffer c2b333c0 queued onto empty channel
dma_loaded: 1
s3c2410_dma_enqueue: id=c384b8a0, data=33c22000, size=40960
s3c2410_dma_enqueue: new buffer c2b333a0
dma0: s3c2410_dma_enqueue: buffer c2b333a0 queued onto non-empty channel
dma_loaded: 2
s3c2410_dma_enqueue: id=c384b8a0, data=33c24000, size=40960
s3c2410_dma_enqueue: new buffer c2b33380
dma0: s3c2410_dma_enqueue: buffer c2b33380 queued onto non-empty channel
dma_loaded: 3
s3c2410_dma_enqueue: id=c384b8a0, data=33c26000, size=40960
s3c2410_dma_enqueue: new buffer c2b33360
dma0: s3c2410_dma_enqueue: buffer c2b33360 queued onto non-empty channel
dma_loaded: 4
s3c2410_dma_enqueue: id=c384b8a0, data=33c28000, size=40960
s3c2410_dma_enqueue: new buffer c2b33340
dma0: s3c2410_dma_enqueue: buffer c2b33340 queued onto non-empty channel
time enqueue 946684895.257894
Entered dma_trigger
s3c2410_dma_ctrl DMAOP_START
s3c2410_start_dma: channel=0
s3c2410_chan_loadbuffer: loading buff c2b333c0 (0x33c20000,0x00a000)
load_state is none, checking for noreload (next=c2b333a0)
dma0: 00000002 to DMASKTRIG
s3c2410_chan_loadbuffer: loading buff c2b333a0 (0x33c22000,0x00a000)
Entered s3c24xx_i2s_trigger
Entered s3c24xx_snd_is_clkmaster
Entered s3c24xx_snd_txctrl
r: IISCON: 7e IISMOD: 210 IISFCON: 101 IISPSR: 8003
w: IISCON: 2f IISMOD: 210 IISFCON: 101 IISPSR: 8003
s3c2410_dma_ctrl DMAOP_STARTED
Entered dma_pointer
Pointer offset: 0
Entered audio_buffdone
time buffdone 946684895.768092
Entered dma_pointer
Pointer offset: 8192
dma_period 8192
Entered dma_enqueue
dma_enqueue: loaded 4, limit 5
dma_end 868392960 dma_start 868352000 dma_period 8192 limit 5
dma_loaded: 4
s3c2410_dma_enqueue: id=c384b8a0, data=33c22000, size=40960
s3c2410_dma_enqueue: new buffer c2b33320
dma0: s3c2410_dma_enqueue: buffer c2b33320 queued onto non-empty channel
s3c2410_chan_loadbuffer: loading buff c2b33380 (0x33c24000,0x00a000)
time enqueue 946684895.771594
Entered dma_pointer
Pointer offset: 16384
Entered dma_pointer
Pointer offset: 16384
Entered audio_buffdone
time buffdone 946684896.199363
Entered dma_pointer
Pointer offset: 24576
dma_period 8192
Entered dma_enqueue
dma_enqueue: loaded 4, limit 5
dma_end 868392960 dma_start 868352000 dma_period 8192 limit 5
dma_loaded: 4
s3c2410_dma_enqueue: id=c384b8a0, data=33c26000, size=40960
s3c2410_dma_enqueue: new buffer c2b333c0
dma0: s3c2410_dma_enqueue: buffer c2b333c0 queued onto non-empty channel
s3c2410_chan_loadbuffer: loading buff c2b33360 (0x33c26000,0x00a000)
time enqueue 946684896.202956
Entered audio_buffdone
time buffdone 946684896.630633
Entered dma_pointer
Pointer offset: 0
dma_period 8192
Entered dma_enqueue
dma_enqueue: loaded 4, limit 5
dma_end 868392960 dma_start 868352000 dma_period 8192 limit 5
dma_loaded: 4
s3c2410_dma_enqueue: id=c384b8a0, data=33c20000, size=40960
s3c2410_dma_enqueue: new buffer c2b333a0
dma0: s3c2410_dma_enqueue: buffer c2b333a0 queued onto non-empty channel
s3c2410_chan_loadbuffer: loading buff c2b33340 (0x33c28000,0x00a000)
time enqueue 946684896.638876
Entered audio_buffdone
time buffdone 946684897.66903
Entered dma_pointer
Pointer offset: 16384
Entered dma_trigger
s3c2410_dma_ctrl DMAOP_STOP
s3c2410_dma_dostop:
Entered s3c24xx_i2s_trigger
Entered s3c24xx_snd_txctrl
r: IISCON: 42f IISMOD: 210 IISFCON: 1 IISPSR: 8003
w: IISCON: 47e IISMOD: 210 IISFCON: 1 IISPSR: 8003
dma_period 8192
Entered dma_enqueue
dma_enqueue: loaded 4, limit 5
dma_end 868392960 dma_start 868352000 dma_period 8192 limit 5
dma_loaded: 4
s3c2410_dma_enqueue: id=c384b8a0, data=33c24000, size=40960
s3c2410_dma_enqueue: new buffer c2b33380
dma0: s3c2410_dma_enqueue: buffer c2b33380 queued onto non-empty channel
time enqueue 946684897.71539
dma0: end of transfer, stopping channel (-40155)
s3c2410_dma_ctrl DMAOP_STOP
s3c2410_dma_dostop:
Entered dma_hw_free
s3c2410_dma_ctrl DMAOP_FLUSH
s3c2410_dma_flush: chan c055be58 (0)
s3c2410_dma_flush: free buffer c2b33340, next c2b33320
Entered audio_buffdone
time buffdone 946684897.87593
s3c2410_dma_flush: free buffer c2b33320, next c2b333c0
Entered audio_buffdone
time buffdone 946684897.85251
s3c2410_dma_flush: free buffer c2b333c0, next c2b333a0
Entered audio_buffdone
time buffdone 946684897.87915
s3c2410_dma_flush: free buffer c2b333a0, next c2b33380
Entered audio_buffdone
time buffdone 946684897.85580
s3c2410_dma_flush: free buffer c2b33380, next   (null)
Entered audio_buffdone
time buffdone 946684897.88244
Entered dma_hw_free
s3c24xx_uda134x_shutdown 1
Entered dma_close

--Multipart=_Wed__1_May_2013_17_14_32_+0400_/_Eip1oH5U5J1d4C
Content-Type: text/x-diff;
 name="0001-iis-driver-changed.patch"
Content-Disposition: attachment;
 filename="0001-iis-driver-changed.patch"
Content-Transfer-Encoding: 7bit

From 87200824436171a1eb3a09ef08784925f277ef97 Mon Sep 17 00:00:00 2001
From: Oleg_Zybin <o.zybin@mail.ru>
Date: Tue, 30 Apr 2013 21:26:45 +0400
Subject: [PATCH] iis driver changed

---
 arch/arm/plat-samsung/include/plat/regs-iis.h |   71 +++++++------
 sound/soc/samsung/s3c24xx-i2s.c               |  133 ++++++++++++++++---------
 sound/soc/samsung/s3c24xx_uda134x.c           |   15 ++-
 3 files changed, 139 insertions(+), 80 deletions(-)

diff --git a/arch/arm/plat-samsung/include/plat/regs-iis.h b/arch/arm/plat-samsung/include/plat/regs-iis.h
index a18d35e..6ffa707 100644
--- a/arch/arm/plat-samsung/include/plat/regs-iis.h
+++ b/arch/arm/plat-samsung/include/plat/regs-iis.h
@@ -15,56 +15,63 @@
 
 #define S3C2410_IISCON			(0x00)
 
-#define S3C2410_IISCON_LRINDEX		(1 << 8)
-#define S3C2410_IISCON_TXFIFORDY	(1 << 7)
-#define S3C2410_IISCON_RXFIFORDY	(1 << 6)
-#define S3C2410_IISCON_TXDMAEN		(1 << 5)
-#define S3C2410_IISCON_RXDMAEN		(1 << 4)
-#define S3C2410_IISCON_TXIDLE		(1 << 3)
-#define S3C2410_IISCON_RXIDLE		(1 << 2)
-#define S3C2410_IISCON_PSCEN		(1 << 1)
+#define S3C2410_IISCON_LRINDEX		(1 << 11)
+#define S3C2410_IISCON_TXDMAPAUSE	(1 << 6)
+#define S3C2410_IISCON_RXDMAPAUSE	(1 << 5)
+#define S3C2410_IISCON_TXIDLE		(1 << 4)
+#define S3C2410_IISCON_RXIDLE		(1 << 3)
+#define S3C2410_IISCON_TXDMAEN		(1 << 2)
+#define S3C2410_IISCON_RXDMAEN		(1 << 1)
 #define S3C2410_IISCON_IISEN		(1 << 0)
 
 #define S3C2410_IISMOD			(0x04)
 
-#define S3C2440_IISMOD_MPLL		(1 << 9)
-#define S3C2410_IISMOD_SLAVE		(1 << 8)
-#define S3C2410_IISMOD_NOXFER		(0 << 6)
-#define S3C2410_IISMOD_RXMODE		(1 << 6)
-#define S3C2410_IISMOD_TXMODE		(2 << 6)
-#define S3C2410_IISMOD_TXRXMODE		(3 << 6)
-#define S3C2410_IISMOD_LR_LLOW		(0 << 5)
-#define S3C2410_IISMOD_LR_RLOW		(1 << 5)
-#define S3C2410_IISMOD_IIS		(0 << 4)
-#define S3C2410_IISMOD_MSB		(1 << 4)
-#define S3C2410_IISMOD_8BIT		(0 << 3)
-#define S3C2410_IISMOD_16BIT		(1 << 3)
-#define S3C2410_IISMOD_BITMASK		(1 << 3)
-#define S3C2410_IISMOD_256FS		(0 << 2)
-#define S3C2410_IISMOD_384FS		(1 << 2)
-#define S3C2410_IISMOD_16FS		(0 << 0)
-#define S3C2410_IISMOD_32FS		(1 << 0)
-#define S3C2410_IISMOD_48FS		(2 << 0)
-#define S3C2410_IISMOD_FS_MASK		(3 << 0)
+//#define S3C2440_IISMOD_MPLL		(1 << 9)
+#define S3C2410_IISMOD_USECDCLK		(1 << 12)
+#define S3C2410_IISMOD_MASTERCDCLK	(1 << 10)
+#define S3C2410_IISMOD_SLAVE		(3 << 10)
+#define S3C2410_IISMOD_NOXFER		(3 << 8)
+#define S3C2410_IISMOD_RXMODE		(1 << 8)
+#define S3C2410_IISMOD_TXMODE		(0 << 8)
+#define S3C2410_IISMOD_TXRXMODE		(2 << 8)
+#define S3C2410_IISMOD_LR_LLOW		(0 << 7)
+#define S3C2410_IISMOD_LR_RLOW		(1 << 7)
+#define S3C2410_IISMOD_IIS		(0 << 5)
+#define S3C2410_IISMOD_MSB		(1 << 5)
+#define S3C2410_IISMOD_8BIT		(1 << 0)
+#define S3C2410_IISMOD_16BIT		(0 << 0)
+#define S3C2410_IISMOD_BITMASK		(0 << 0)
+#define S3C2410_IISMOD_256FS		(0 << 3)
+#define S3C2410_IISMOD_384FS		(2 << 3)
+#define S3C2410_IISMOD_16FS		(2 << 1)
+#define S3C2410_IISMOD_32FS		(0 << 1)
+#define S3C2410_IISMOD_48FS		(1 << 1)
+//#define S3C2410_IISMOD_FS_MASK		(3 << 1)
 
-#define S3C2410_IISPSR			(0x08)
+#define S3C2410_IISPSR			(0x0c)
 
 #define S3C2410_IISPSR_INTMASK		(31 << 5)
 #define S3C2410_IISPSR_INTSHIFT		(5)
 #define S3C2410_IISPSR_EXTMASK		(31 << 0)
 #define S3C2410_IISPSR_EXTSHFIT		(0)
+#define S3C2410_IISCON_PSCEN		(1 << 15)
 
-#define S3C2410_IISFCON			(0x0c)
+#define S3C2410_IISFCON			(0x08)
 
-#define S3C2410_IISFCON_TXDMA		(1 << 15)
+/*#define S3C2410_IISFCON_TXDMA		(1 << 15)
 #define S3C2410_IISFCON_RXDMA		(1 << 14)
 #define S3C2410_IISFCON_TXENABLE	(1 << 13)
 #define S3C2410_IISFCON_RXENABLE	(1 << 12)
 #define S3C2410_IISFCON_TXMASK		(0x3f << 6)
 #define S3C2410_IISFCON_TXSHIFT		(6)
 #define S3C2410_IISFCON_RXMASK		(0x3f)
-#define S3C2410_IISFCON_RXSHIFT		(0)
+#define S3C2410_IISFCON_RXSHIFT		(0)*/
 
-#define S3C2410_IISFIFO			(0x10)
+#define S3C2410_IISFCON_TFLUSH		(1 << 15)
+#define S3C2410_IISFCON_RFLUSH		(1 << 7)
+
+#define S3C2410_IISTXD			(0x10)
+
+#define S3C2410_IISRXD			(0x14)
 
 #endif /* __ASM_ARCH_REGS_IIS_H */
diff --git a/sound/soc/samsung/s3c24xx-i2s.c b/sound/soc/samsung/s3c24xx-i2s.c
index 0aae3a3..babd9c7 100644
--- a/sound/soc/samsung/s3c24xx-i2s.c
+++ b/sound/soc/samsung/s3c24xx-i2s.c
@@ -29,6 +29,8 @@
 #include "dma.h"
 #include "s3c24xx-i2s.h"
 
+#define pr_debug printk
+
 static struct s3c2410_dma_client s3c24xx_dma_client_out = {
 	.name = "I2S PCM Stereo out"
 };
@@ -40,14 +42,14 @@ static struct s3c2410_dma_client s3c24xx_dma_client_in = {
 static struct s3c_dma_params s3c24xx_i2s_pcm_stereo_out = {
 	.client		= &s3c24xx_dma_client_out,
 	.channel	= DMACH_I2S_OUT,
-	.dma_addr	= S3C2410_PA_IIS + S3C2410_IISFIFO,
+	.dma_addr	= S3C2410_PA_IIS + S3C2410_IISTXD,
 	.dma_size	= 2,
 };
 
 static struct s3c_dma_params s3c24xx_i2s_pcm_stereo_in = {
 	.client		= &s3c24xx_dma_client_in,
 	.channel	= DMACH_I2S_IN,
-	.dma_addr	= S3C2410_PA_IIS + S3C2410_IISFIFO,
+	.dma_addr	= S3C2410_PA_IIS + S3C2410_IISRXD,
 	.dma_size	= 2,
 };
 
@@ -66,25 +68,26 @@ static void s3c24xx_snd_txctrl(int on)
 	u32 iisfcon;
 	u32 iiscon;
 	u32 iismod;
+	u32 iispsr;
 
 	pr_debug("Entered %s\n", __func__);
-
+	
 	iisfcon = readl(s3c24xx_i2s.regs + S3C2410_IISFCON);
 	iiscon  = readl(s3c24xx_i2s.regs + S3C2410_IISCON);
 	iismod  = readl(s3c24xx_i2s.regs + S3C2410_IISMOD);
+	iispsr  = readl(s3c24xx_i2s.regs + S3C2410_IISPSR);
 
-	pr_debug("r: IISCON: %x IISMOD: %x IISFCON: %x\n", iiscon, iismod, iisfcon);
+	pr_debug("r: IISCON: %x IISMOD: %x IISFCON: %x IISPSR: %x\n", iiscon, iismod, iisfcon, iispsr);
 
 	if (on) {
-		iisfcon |= S3C2410_IISFCON_TXDMA | S3C2410_IISFCON_TXENABLE;
-		iiscon  |= S3C2410_IISCON_TXDMAEN | S3C2410_IISCON_IISEN;
+		iiscon  |= S3C2410_IISCON_IISEN;
 		iiscon  &= ~S3C2410_IISCON_TXIDLE;
-		iismod  |= S3C2410_IISMOD_TXMODE;
+		iiscon  &= ~S3C2410_IISCON_TXDMAPAUSE;
 
-		writel(iismod,  s3c24xx_i2s.regs + S3C2410_IISMOD);
-		writel(iisfcon, s3c24xx_i2s.regs + S3C2410_IISFCON);
-		writel(iiscon,  s3c24xx_i2s.regs + S3C2410_IISCON);
-	} else {
+		writel(iiscon,  s3c24xx_i2s.regs + S3C2410_IISCON);		
+		
+	} 
+	else {
 		/* note, we have to disable the FIFOs otherwise bad things
 		 * seem to happen when the DMA stops. According to the
 		 * Samsung supplied kernel, this should allow the DMA
@@ -92,18 +95,15 @@ static void s3c24xx_snd_txctrl(int on)
 		 * DMA engine will simply freeze randomly.
 		 */
 
-		iisfcon &= ~S3C2410_IISFCON_TXENABLE;
-		iisfcon &= ~S3C2410_IISFCON_TXDMA;
-		iiscon  |=  S3C2410_IISCON_TXIDLE;
-		iiscon  &= ~S3C2410_IISCON_TXDMAEN;
-		iismod  &= ~S3C2410_IISMOD_TXMODE;
+		iiscon |= S3C2410_IISCON_TXIDLE | S3C2410_IISCON_TXDMAPAUSE;
+		iiscon &= ~S3C2410_IISCON_IISEN;
 
 		writel(iiscon,  s3c24xx_i2s.regs + S3C2410_IISCON);
-		writel(iisfcon, s3c24xx_i2s.regs + S3C2410_IISFCON);
-		writel(iismod,  s3c24xx_i2s.regs + S3C2410_IISMOD);
+
 	}
 
-	pr_debug("w: IISCON: %x IISMOD: %x IISFCON: %x\n", iiscon, iismod, iisfcon);
+	pr_debug("w: IISCON: %x IISMOD: %x IISFCON: %x IISPSR: %x\n", iiscon, iismod, iisfcon, iispsr);
+	//dump_stack();
 }
 
 static void s3c24xx_snd_rxctrl(int on)
@@ -111,23 +111,21 @@ static void s3c24xx_snd_rxctrl(int on)
 	u32 iisfcon;
 	u32 iiscon;
 	u32 iismod;
+	u32 iispsr;
 
 	pr_debug("Entered %s\n", __func__);
 
 	iisfcon = readl(s3c24xx_i2s.regs + S3C2410_IISFCON);
 	iiscon  = readl(s3c24xx_i2s.regs + S3C2410_IISCON);
 	iismod  = readl(s3c24xx_i2s.regs + S3C2410_IISMOD);
+	iispsr  = readl(s3c24xx_i2s.regs + S3C2410_IISPSR);
 
-	pr_debug("r: IISCON: %x IISMOD: %x IISFCON: %x\n", iiscon, iismod, iisfcon);
+	pr_debug("r: IISCON: %x IISMOD: %x IISFCON: %x IISPSR: %x\n", iiscon, iismod, iisfcon, iispsr);
 
 	if (on) {
-		iisfcon |= S3C2410_IISFCON_RXDMA | S3C2410_IISFCON_RXENABLE;
-		iiscon  |= S3C2410_IISCON_RXDMAEN | S3C2410_IISCON_IISEN;
+		iiscon  |= S3C2410_IISCON_IISEN;
 		iiscon  &= ~S3C2410_IISCON_RXIDLE;
-		iismod  |= S3C2410_IISMOD_RXMODE;
-
-		writel(iismod,  s3c24xx_i2s.regs + S3C2410_IISMOD);
-		writel(iisfcon, s3c24xx_i2s.regs + S3C2410_IISFCON);
+		iiscon  &= ~S3C2410_IISCON_RXDMAPAUSE;
 		writel(iiscon,  s3c24xx_i2s.regs + S3C2410_IISCON);
 	} else {
 		/* note, we have to disable the FIFOs otherwise bad things
@@ -137,18 +135,13 @@ static void s3c24xx_snd_rxctrl(int on)
 		 * DMA engine will simply freeze randomly.
 		 */
 
-		iisfcon &= ~S3C2410_IISFCON_RXENABLE;
-		iisfcon &= ~S3C2410_IISFCON_RXDMA;
-		iiscon  |= S3C2410_IISCON_RXIDLE;
-		iiscon  &= ~S3C2410_IISCON_RXDMAEN;
-		iismod  &= ~S3C2410_IISMOD_RXMODE;
-
-		writel(iisfcon, s3c24xx_i2s.regs + S3C2410_IISFCON);
+		iiscon  |= S3C2410_IISCON_RXIDLE | S3C2410_IISCON_RXDMAPAUSE;
+		iiscon  &= ~S3C2410_IISCON_IISEN;
 		writel(iiscon,  s3c24xx_i2s.regs + S3C2410_IISCON);
-		writel(iismod,  s3c24xx_i2s.regs + S3C2410_IISMOD);
 	}
 
-	pr_debug("w: IISCON: %x IISMOD: %x IISFCON: %x\n", iiscon, iismod, iisfcon);
+	pr_debug("w: IISCON: %x IISMOD: %x IISFCON: %x IISPSR: %x\n", iiscon, iismod, iisfcon, iispsr);
+	//printk("s3c24xx_snd_rxctrl exit\n");
 }
 
 /*
@@ -220,6 +213,7 @@ static int s3c24xx_i2s_set_fmt(struct snd_soc_dai *cpu_dai,
 		return -EINVAL;
 	}
 
+	//printk("%x\n", iismod);
 	writel(iismod, s3c24xx_i2s.regs + S3C2410_IISMOD);
 	pr_debug("hw_params w: IISMOD: %x \n", iismod);
 	return 0;
@@ -259,6 +253,7 @@ static int s3c24xx_i2s_hw_params(struct snd_pcm_substream *substream,
 		return -EINVAL;
 	}
 
+	//printk("%x\n", iismod);
 	writel(iismod, s3c24xx_i2s.regs + S3C2410_IISMOD);
 	pr_debug("hw_params w: IISMOD: %x\n", iismod);
 	return 0;
@@ -268,6 +263,7 @@ static int s3c24xx_i2s_trigger(struct snd_pcm_substream *substream, int cmd,
 			       struct snd_soc_dai *dai)
 {
 	int ret = 0;
+	
 	struct s3c_dma_params *dma_data =
 		snd_soc_dai_get_dma_data(dai, substream);
 
@@ -302,6 +298,7 @@ static int s3c24xx_i2s_trigger(struct snd_pcm_substream *substream, int cmd,
 		ret = -EINVAL;
 		break;
 	}
+	//printk("s3c24xx_i2s_trigger exit\n");
 
 exit_err:
 	return ret;
@@ -317,7 +314,7 @@ static int s3c24xx_i2s_set_sysclk(struct snd_soc_dai *cpu_dai,
 
 	pr_debug("Entered %s\n", __func__);
 
-	iismod &= ~S3C2440_IISMOD_MPLL;
+	/*iismod &= ~S3C2440_IISMOD_MPLL;
 
 	switch (clk_id) {
 	case S3C24XX_CLKSRC_PCLK:
@@ -327,8 +324,9 @@ static int s3c24xx_i2s_set_sysclk(struct snd_soc_dai *cpu_dai,
 		break;
 	default:
 		return -EINVAL;
-	}
+	}*/
 
+	//printk("%x\n", iismod);
 	writel(iismod, s3c24xx_i2s.regs + S3C2410_IISMOD);
 	return 0;
 }
@@ -343,19 +341,43 @@ static int s3c24xx_i2s_set_clkdiv(struct snd_soc_dai *cpu_dai,
 
 	pr_debug("Entered %s\n", __func__);
 
+	u32 iismod;
+	iismod = readl(s3c24xx_i2s.regs + S3C2410_IISMOD);
+	printk("IISMOD %x\n", iismod);
+
+	
 	switch (div_id) {
 	case S3C24XX_DIV_BCLK:
-		reg = readl(s3c24xx_i2s.regs + S3C2410_IISMOD) & ~S3C2410_IISMOD_FS_MASK;
-		writel(reg | div, s3c24xx_i2s.regs + S3C2410_IISMOD);
+		//reg = readl(s3c24xx_i2s.regs + S3C2410_IISMOD) & ~S3C2410_IISMOD_FS_MASK;
+		//writel(reg | div, s3c24xx_i2s.regs + S3C2410_IISMOD);		
+		//writel(S3C2410_IISMOD_8BIT | S3C2410_IISMOD_16FS, s3c24xx_i2s.regs + S3C2410_IISMOD);
+		
+		iismod = readl(s3c24xx_i2s.regs + S3C2410_IISMOD);
+		printk("case S3C24XX_DIV_BCLK IISMOD %x, div %x\n", iismod, div);
+
 		break;
 	case S3C24XX_DIV_MCLK:
-		reg = readl(s3c24xx_i2s.regs + S3C2410_IISMOD) & ~(S3C2410_IISMOD_384FS);
-		writel(reg | div, s3c24xx_i2s.regs + S3C2410_IISMOD);
+		reg = readl(s3c24xx_i2s.regs + S3C2410_IISMOD) | (S3C2410_IISMOD_384FS);
+		//writel(reg | div, s3c24xx_i2s.regs + S3C2410_IISMOD);
+		//writel(div , s3c24xx_i2s.regs + S3C2410_IISMOD);		
+		iismod = readl(s3c24xx_i2s.regs + S3C2410_IISMOD);
+		printk("case S3C24XX_DIV_MCLK IISMOD %x div %x\n", iismod, div);
+
 		break;
-	case S3C24XX_DIV_PRESCALER:
+	case S3C24XX_DIV_PRESCALER:		
 		writel(div, s3c24xx_i2s.regs + S3C2410_IISPSR);
-		reg = readl(s3c24xx_i2s.regs + S3C2410_IISCON);
-		writel(reg | S3C2410_IISCON_PSCEN, s3c24xx_i2s.regs + S3C2410_IISCON);
+		reg = readl(s3c24xx_i2s.regs + S3C2410_IISPSR);
+		writel(reg | S3C2410_IISCON_PSCEN, s3c24xx_i2s.regs + S3C2410_IISPSR);
+	  
+		/*reg = readl(s3c24xx_i2s.regs + S3C2410_IISPSR);
+		writel(reg | div | S3C2410_IISCON_PSCEN, s3c24xx_i2s.regs + S3C2410_IISPSR);*/
+		printk("div %d\n", div);
+		//dump_stack();
+		//writel(reg, s3c24xx_i2s.regs + S3C2410_IISPSR);
+
+		iismod = readl(s3c24xx_i2s.regs + S3C2410_IISPSR);
+		printk("case S3C24XX_DIV_PRESCALER IISPSR %x\n", iismod);
+
 		break;
 	default:
 		return -EINVAL;
@@ -381,7 +403,6 @@ static int s3c24xx_i2s_probe(struct snd_soc_dai *dai)
 	s3c24xx_i2s.regs = ioremap(S3C2410_PA_IIS, 0x100);
 	if (s3c24xx_i2s.regs == NULL)
 		return -ENXIO;
-
 	s3c24xx_i2s.iis_clk = clk_get(dai->dev, "iis");
 	if (IS_ERR(s3c24xx_i2s.iis_clk)) {
 		pr_err("failed to get iis_clock\n");
@@ -389,16 +410,34 @@ static int s3c24xx_i2s_probe(struct snd_soc_dai *dai)
 		return PTR_ERR(s3c24xx_i2s.iis_clk);
 	}
 	clk_enable(s3c24xx_i2s.iis_clk);
+	
+	/*u32 clk;
+	clk=s3c24xx_i2s_get_clockrate();
+	printk("CLK %x\n", clk);*/
 
 	/* Configure the I2S pins (GPE0...GPE4) in correct mode */
 	s3c_gpio_cfgall_range(S3C2410_GPE(0), 5, S3C_GPIO_SFN(2),
 			      S3C_GPIO_PULL_NONE);
 
-	writel(S3C2410_IISCON_IISEN, s3c24xx_i2s.regs + S3C2410_IISCON);
+	u32 iiscon;
+	u32 iismod;
+	u32 iispsr;
+	iiscon = readl(s3c24xx_i2s.regs + S3C2410_IISCON);
+	iismod = readl(s3c24xx_i2s.regs + S3C2410_IISMOD);
+	iispsr = readl(s3c24xx_i2s.regs + S3C2410_IISPSR);
+	
+	iiscon |= S3C2410_IISCON_TXDMAEN | S3C2410_IISCON_RXDMAEN;
+	iismod |= S3C2410_IISMOD_TXRXMODE | S3C2410_IISMOD_384FS | S3C2410_IISMOD_32FS;
+		  //| S3C2410_IISMOD_USECDCLK | S3C2410_IISMOD_MASTERCDCLK;
+	//iispsr |= S3C2410_IISCON_PSCEN; //| (0x7);
+
+	writel(iiscon, s3c24xx_i2s.regs + S3C2410_IISCON);
+	writel(iismod, s3c24xx_i2s.regs + S3C2410_IISMOD);
+	writel(iispsr, s3c24xx_i2s.regs + S3C2410_IISPSR);
 
 	s3c24xx_snd_txctrl(0);
 	s3c24xx_snd_rxctrl(0);
-
+		
 	return 0;
 }
 
diff --git a/sound/soc/samsung/s3c24xx_uda134x.c b/sound/soc/samsung/s3c24xx_uda134x.c
index d731042..acad67f 100644
--- a/sound/soc/samsung/s3c24xx_uda134x.c
+++ b/sound/soc/samsung/s3c24xx_uda134x.c
@@ -22,6 +22,8 @@
 
 #include "s3c24xx-i2s.h"
 
+#define pr_debug printk
+
 /* #define ENFORCE_RATES 1 */
 /*
   Unfortunately the S3C24XX in master mode has a limited capacity of
@@ -58,6 +60,8 @@ static struct platform_device *s3c24xx_uda134x_snd_device;
 
 static int s3c24xx_uda134x_startup(struct snd_pcm_substream *substream)
 {
+	//dump_stack();
+  
 	int ret = 0;
 #ifdef ENFORCE_RATES
 	struct snd_pcm_runtime *runtime = substream->runtime;
@@ -147,6 +151,9 @@ static int s3c24xx_uda134x_hw_params(struct snd_pcm_substream *substream,
 			bi = i;
 		}
 	}
+	
+	//pr_debug("bi %d\n", bi);
+	
 	if (bi / 33 == 1)
 		fs_mode = S3C2410_IISMOD_256FS;
 	else
@@ -197,8 +204,14 @@ static int s3c24xx_uda134x_hw_params(struct snd_pcm_substream *substream,
 	if (ret < 0)
 		return ret;
 
+	pr_debug("uda div %x\n", div);
+	
+	//ret = snd_soc_dai_set_clkdiv(cpu_dai, S3C24XX_DIV_PRESCALER,
+	//		S3C24XX_PRESCALE(div, div));
+	
 	ret = snd_soc_dai_set_clkdiv(cpu_dai, S3C24XX_DIV_PRESCALER,
-			S3C24XX_PRESCALE(div, div));
+			((div/2)-1));	
+	
 	if (ret < 0)
 		return ret;
 
-- 
1.7.9.5


--Multipart=_Wed__1_May_2013_17_14_32_+0400_/_Eip1oH5U5J1d4C--
