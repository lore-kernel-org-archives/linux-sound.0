From: Takashi Iwai <tiwai@suse.de>
Date: Mon, 05 Sep 2022 05:28:03 +0000
Subject: Re: [BUG] commit a8d302a0b77057568350fe0123e639d02dba0745 cause IO_PAGE_FAULT and a lot of errors
Message-Id: <874jxml7a4.wl-tiwai@suse.de>
List-Id: <linux-sound.vger.kernel.org>
References: <CABXGCsO+kB2t5QyHY-rUe76npr1m0-5JOtt8g8SiHUo34ur7Ww@mail.gmail.com>
        <87ilm3vbzq.wl-tiwai@suse.de>
        <875yi3froa.wl-tiwai@suse.de>
        <CABXGCsMQ5H23np6fMN=58CZ6cBiHFF4WGdKdbtYLFyAAeAu5rQ@mail.gmail.com>
In-Reply-To: <CABXGCsMQ5H23np6fMN=58CZ6cBiHFF4WGdKdbtYLFyAAeAu5rQ@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Mikhail Gavrilov <mikhail.v.gavrilov@gmail.com>
Cc: Takashi Iwai <tiwai@suse.de>, Linux List Kernel Mailing <linux-kernel@vger.kernel.org>, linux-sound@vger.kernel.org

On Mon, 05 Sep 2022 00:40:48 +0200,
Mikhail Gavrilov wrote:
> 
> On Sun, Sep 4, 2022 at 1:51 PM Takashi Iwai <tiwai@suse.de> wrote:
> > Also, please check the patch below instead of the previous one, too.
> > If this one works, it'd be a better choice.
> >
> 
> I compiled the kernel only with the second patch.
> I confirm that patch fixed the described problem.
> No new problems were noticed during the day, thanks.
> 
> Tested-by: Mikhail Gavrilov <mikhail.v.gavrilov@gmail.com>

Awesome.

Could you try the below one instead?  It's a simplified version and
applies the workaround more consistently.  Once after it's confirmed
to work, I'm going to submit a proper patch and merge for the next 6.0
PR.


thanks,

Takashi

---
diff --git a/sound/core/memalloc.c b/sound/core/memalloc.c
index b665ac66ccbe..cc8459369e41 100644
--- a/sound/core/memalloc.c
+++ b/sound/core/memalloc.c
@@ -521,6 +521,8 @@ static const struct snd_malloc_ops snd_dma_wc_ops = {
 /*
  * Non-contiguous pages allocator
  */
+static dma_addr_t snd_dma_noncontig_get_addr(struct snd_dma_buffer *dmab, size_t offset);
+
 static void *snd_dma_noncontig_alloc(struct snd_dma_buffer *dmab, size_t size)
 {
 	struct sg_table *sgt;
@@ -543,10 +545,13 @@ static void *snd_dma_noncontig_alloc(struct snd_dma_buffer *dmab, size_t size)
 	dmab->dev.need_sync = dma_need_sync(dmab->dev.dev,
 					    sg_dma_address(sgt->sgl));
 	p = dma_vmap_noncontiguous(dmab->dev.dev, size, sgt);
-	if (p)
+	if (p) {
 		dmab->private_data = sgt;
-	else
+		/* store the first page address for convenience */
+		dmab->addr = snd_dma_noncontig_get_addr(dmab, 0);
+	} else {
 		dma_free_noncontiguous(dmab->dev.dev, size, sgt, dmab->dev.dir);
+	}
 	return p;
 }
 
@@ -780,6 +785,8 @@ static void *snd_dma_sg_fallback_alloc(struct snd_dma_buffer *dmab, size_t size)
 	if (!p)
 		goto error;
 	dmab->private_data = sgbuf;
+	/* store the first page address for convenience */
+	dmab->addr = snd_dma_vmalloc_get_addr(dmab, 0);
 	return p;
 
  error:
diff --git a/sound/pci/hda/hda_intel.c b/sound/pci/hda/hda_intel.c
index a77165bd92a9..b20694fd69de 100644
--- a/sound/pci/hda/hda_intel.c
+++ b/sound/pci/hda/hda_intel.c
@@ -1817,7 +1817,7 @@ static int azx_create(struct snd_card *card, struct pci_dev *pci,
 
 	/* use the non-cached pages in non-snoop mode */
 	if (!azx_snoop(chip))
-		azx_bus(chip)->dma_type = SNDRV_DMA_TYPE_DEV_WC;
+		azx_bus(chip)->dma_type = SNDRV_DMA_TYPE_DEV_WC_SG;
 
 	if (chip->driver_type = AZX_DRIVER_NVIDIA) {
 		dev_dbg(chip->card->dev, "Enable delay in RIRB handling\n");
