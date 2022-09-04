From: Takashi Iwai <tiwai@suse.de>
Date: Sun, 04 Sep 2022 07:23:53 +0000
Subject: Re: [BUG] commit a8d302a0b77057568350fe0123e639d02dba0745 cause IO_PAGE_FAULT and a lot of errors
Message-Id: <87ilm3vbzq.wl-tiwai@suse.de>
List-Id: <linux-sound.vger.kernel.org>
References: <CABXGCsO+kB2t5QyHY-rUe76npr1m0-5JOtt8g8SiHUo34ur7Ww@mail.gmail.com>
In-Reply-To: <CABXGCsO+kB2t5QyHY-rUe76npr1m0-5JOtt8g8SiHUo34ur7Ww@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Mikhail Gavrilov <mikhail.v.gavrilov@gmail.com>
Cc: tiwai@suse.de, Linux List Kernel Mailing <linux-kernel@vger.kernel.org>, linux-sound@vger.kernel.org

On Sat, 03 Sep 2022 20:04:19 +0200,
Mikhail Gavrilov wrote:
> 
> Hi, I am bisecting issue that cause errors:
> [   57.710235] snd_hda_intel 0000:03:00.1: spurious response
> 0xeb0cce6a:0x8b612b0d, rp = 1, wp = 1
> [   57.710240] ------------[ cut here ]------------
> [   57.710241] BUG?
> [   57.710257] amd_iommu_report_page_fault: 216 callbacks suppressed
> [   57.710260] snd_hda_intel 0000:03:00.1: AMD-Vi: Event logged
> [IO_PAGE_FAULT domain=0x000e address=0x152848808 flags=0x0020]

Grr...  again hitting an issue with AMD IOMMU...

> and bisect said this commit causes it:
> a8d302a0b77057568350fe0123e639d02dba0745 is the first bad commit
> commit a8d302a0b77057568350fe0123e639d02dba0745
> Author: Takashi Iwai <tiwai@suse.de>
> Date:   Sun Aug 21 17:59:11 2022 +0200
> 
>     ALSA: memalloc: Revive x86-specific WC page allocations again

OK, could you try the patch below?
I wonder whether this is specific to CORB/RIRB mapping or generically
about the transfer buffers.


Takashi

---
diff --git a/sound/pci/hda/hda_controller.h b/sound/pci/hda/hda_controller.h
index f5bf295eb830..d4b146da0863 100644
--- a/sound/pci/hda/hda_controller.h
+++ b/sound/pci/hda/hda_controller.h
@@ -28,12 +28,12 @@
 #else
 #define AZX_DCAPS_I915_COMPONENT 0		/* NOP */
 #endif
-/* 14 unused */
+#define AZX_DCAPS_WC_CORB_RIRB	(1 << 14)	/* WC pages for CORB/RIRB */
 #define AZX_DCAPS_CTX_WORKAROUND (1 << 15)	/* X-Fi workaround */
 #define AZX_DCAPS_POSFIX_LPIB	(1 << 16)	/* Use LPIB as default */
 #define AZX_DCAPS_AMD_WORKAROUND (1 << 17)	/* AMD-specific workaround */
 #define AZX_DCAPS_NO_64BIT	(1 << 18)	/* No 64bit address */
-/* 19 unused */
+#define AZX_DCAPS_WC_BUFFER	(1 << 19)	/* allocate non-cached buffer */
 #define AZX_DCAPS_OLD_SSYNC	(1 << 20)	/* Old SSYNC reg for ICH */
 #define AZX_DCAPS_NO_ALIGN_BUFSIZE (1 << 21)	/* no buffer size alignment */
 /* 22 unused */
diff --git a/sound/pci/hda/hda_intel.c b/sound/pci/hda/hda_intel.c
index bf9df9bc8f1b..cccd42b9d489 100644
--- a/sound/pci/hda/hda_intel.c
+++ b/sound/pci/hda/hda_intel.c
@@ -295,7 +295,7 @@ enum {
 
 /* quirks for ATI HDMI with snoop off */
 #define AZX_DCAPS_PRESET_ATI_HDMI_NS \
-	(AZX_DCAPS_PRESET_ATI_HDMI | AZX_DCAPS_SNOOP_OFF)
+	(AZX_DCAPS_PRESET_ATI_HDMI | AZX_DCAPS_SNOOP_OFF | AZX_DCAPS_WC_BUFFER)
 
 /* quirks for AMD SB */
 #define AZX_DCAPS_PRESET_AMD_SB \
@@ -310,7 +310,7 @@ enum {
 
 #define AZX_DCAPS_PRESET_CTHDA \
 	(AZX_DCAPS_NO_MSI | AZX_DCAPS_POSFIX_LPIB |\
-	 AZX_DCAPS_NO_64BIT |\
+	 AZX_DCAPS_NO_64BIT | AZX_DCAPS_WC_CORB_RIRB | AZX_DCAPS_WC_BUFFER|\
 	 AZX_DCAPS_4K_BDLE_BOUNDARY | AZX_DCAPS_SNOOP_OFF)
 
 /*
@@ -1692,6 +1692,8 @@ static void azx_check_snoop_available(struct azx *chip)
 			 snoop ? "snoop" : "non-snoop");
 		chip->snoop = snoop;
 		chip->uc_buffer = !snoop;
+		if (!snoop)
+			azx_bus(chip)->dma_type = SNDRV_DMA_TYPE_DEV_WC;
 		return;
 	}
 
@@ -1712,12 +1714,11 @@ static void azx_check_snoop_available(struct azx *chip)
 		snoop = false;
 
 	chip->snoop = snoop;
-	if (!snoop) {
+	if (!snoop)
 		dev_info(chip->card->dev, "Force to non-snoop mode\n");
-		/* C-Media requires non-cached pages only for CORB/RIRB */
-		if (chip->driver_type != AZX_DRIVER_CMEDIA)
-			chip->uc_buffer = true;
-	}
+	if (chip->driver_caps & AZX_DCAPS_WC_CORB_RIRB)
+		azx_bus(chip)->dma_type = SNDRV_DMA_TYPE_DEV_WC;
+	chip->uc_buffer = !!(chip->driver_caps & AZX_DCAPS_WC_BUFFER);
 }
 
 static void azx_probe_work(struct work_struct *work)
@@ -1808,10 +1809,6 @@ static int azx_create(struct snd_card *card, struct pci_dev *pci,
 	if (err < 0)
 		return err;
 
-	/* use the non-cached pages in non-snoop mode */
-	if (!azx_snoop(chip))
-		azx_bus(chip)->dma_type = SNDRV_DMA_TYPE_DEV_WC;
-
 	if (chip->driver_type = AZX_DRIVER_NVIDIA) {
 		dev_dbg(chip->card->dev, "Enable delay in RIRB handling\n");
 		chip->bus.core.needs_damn_long_delay = 1;
@@ -2756,7 +2753,8 @@ static const struct pci_device_id azx_ids[] = {
 	/* CM8888 */
 	{ PCI_DEVICE(0x13f6, 0x5011),
 	  .driver_data = AZX_DRIVER_CMEDIA |
-	  AZX_DCAPS_NO_MSI | AZX_DCAPS_POSFIX_LPIB | AZX_DCAPS_SNOOP_OFF },
+	  AZX_DCAPS_NO_MSI | AZX_DCAPS_POSFIX_LPIB | AZX_DCAPS_SNOOP_OFF |
+	  AZX_DCAPS_WC_CORB_RIRB },
 	/* Vortex86MX */
 	{ PCI_DEVICE(0x17f3, 0x3010), .driver_data = AZX_DRIVER_GENERIC },
 	/* VMware HDAudio */
