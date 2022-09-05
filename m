From: Takashi Iwai <tiwai@suse.de>
Date: Mon, 05 Sep 2022 12:49:03 +0000
Subject: Re: [BUG] commit a8d302a0b77057568350fe0123e639d02dba0745 cause IO_PAGE_FAULT and a lot of errors
Message-Id: <87o7vuj8ao.wl-tiwai@suse.de>
List-Id: <linux-sound.vger.kernel.org>
References: <CABXGCsO+kB2t5QyHY-rUe76npr1m0-5JOtt8g8SiHUo34ur7Ww@mail.gmail.com>
        <87ilm3vbzq.wl-tiwai@suse.de>
        <875yi3froa.wl-tiwai@suse.de>
        <CABXGCsMQ5H23np6fMN=58CZ6cBiHFF4WGdKdbtYLFyAAeAu5rQ@mail.gmail.com>
        <874jxml7a4.wl-tiwai@suse.de>
In-Reply-To: <874jxml7a4.wl-tiwai@suse.de>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Mikhail Gavrilov <mikhail.v.gavrilov@gmail.com>
Cc: Linux List Kernel Mailing <linux-kernel@vger.kernel.org>, linux-sound@vger.kernel.org

On Mon, 05 Sep 2022 07:28:03 +0200,
Takashi Iwai wrote:
> 
> On Mon, 05 Sep 2022 00:40:48 +0200,
> Mikhail Gavrilov wrote:
> > 
> > On Sun, Sep 4, 2022 at 1:51 PM Takashi Iwai <tiwai@suse.de> wrote:
> > > Also, please check the patch below instead of the previous one, too.
> > > If this one works, it'd be a better choice.
> > >
> > 
> > I compiled the kernel only with the second patch.
> > I confirm that patch fixed the described problem.
> > No new problems were noticed during the day, thanks.
> > 
> > Tested-by: Mikhail Gavrilov <mikhail.v.gavrilov@gmail.com>
> 
> Awesome.
> 
> Could you try the below one instead?  It's a simplified version and
> applies the workaround more consistently.  Once after it's confirmed
> to work, I'm going to submit a proper patch and merge for the next 6.0
> PR.

Even a simpler one below with a proper changelog.


Takashi

-- 8< --
From: Takashi Iwai <tiwai@suse.de>
Subject: [PATCH] ALSA: hda: Once again fix regression of page allocations with
 IOMMU

The last fix for trying to recover the regression on AMD platforms,
unfortunately, leaded to yet another regression: it turned out that
IOMMUs don't like the usage of raw page allocations.

This is yet another attempt for addressing the log saga; at this time,
we re-use the existing buffer allocation mechanism with SG-pages
although we require only single pages.  The SG buffer allocation
itself was confirmed to work for stream buffers, so it's relatively
easy to adapt for other places.

The only problem is: although the HD-audio code is accessing the
address directly via dmab->address field, SG-pages don't set up it.
For the ease of adaption, we now set up the dmab->addr field from the
address of the first page as default, so that it can run with the
HD-audio driver code as-is without the excessive call of
snd_sgbuf_get_addr() multiple times; that's the only change in the
memalloc helper side.  The rest is nothing but a flip of the dma_type
field in the HD-audio side.

Fixes: a8d302a0b770 ("ALSA: memalloc: Revive x86-specific WC page allocations again")
Reported-by: Mikhail Gavrilov <mikhail.v.gavrilov@gmail.com>
Cc: <stable@vger.kernel.org>
Link: https://lore.kernel.org/r/CABXGCsO+kB2t5QyHY-rUe76npr1m0-5JOtt8g8SiHUo34ur7Ww@mail.gmail.com
Link: https://bugzilla.kernel.org/show_bug.cgi?id!6112
Link: https://bugzilla.kernel.org/show_bug.cgi?id!6363
Signed-off-by: Takashi Iwai <tiwai@suse.de>
---
 sound/core/memalloc.c     | 9 +++++++--
 sound/pci/hda/hda_intel.c | 2 +-
 2 files changed, 8 insertions(+), 3 deletions(-)

diff --git a/sound/core/memalloc.c b/sound/core/memalloc.c
index 39561faef6e9..2c11413bea61 100644
--- a/sound/core/memalloc.c
+++ b/sound/core/memalloc.c
@@ -558,10 +558,13 @@ static void *snd_dma_noncontig_alloc(struct snd_dma_buffer *dmab, size_t size)
 	dmab->dev.need_sync = dma_need_sync(dmab->dev.dev,
 					    sg_dma_address(sgt->sgl));
 	p = dma_vmap_noncontiguous(dmab->dev.dev, size, sgt);
-	if (p)
+	if (p) {
 		dmab->private_data = sgt;
-	else
+		/* store the first page address for convenience */
+		dmab->addr = snd_sgbuf_get_addr(dmab, 0);
+	} else {
 		dma_free_noncontiguous(dmab->dev.dev, size, sgt, dmab->dev.dir);
+	}
 	return p;
 }
 
@@ -763,6 +766,8 @@ static void *snd_dma_sg_fallback_alloc(struct snd_dma_buffer *dmab, size_t size)
 	if (!p)
 		goto error;
 	dmab->private_data = sgbuf;
+	/* store the first page address for convenience */
+	dmab->addr = snd_sgbuf_get_addr(dmab, 0);
 	return p;
 
  error:
diff --git a/sound/pci/hda/hda_intel.c b/sound/pci/hda/hda_intel.c
index bf9df9bc8f1b..7e605ce43f41 100644
--- a/sound/pci/hda/hda_intel.c
+++ b/sound/pci/hda/hda_intel.c
@@ -1810,7 +1810,7 @@ static int azx_create(struct snd_card *card, struct pci_dev *pci,
 
 	/* use the non-cached pages in non-snoop mode */
 	if (!azx_snoop(chip))
-		azx_bus(chip)->dma_type = SNDRV_DMA_TYPE_DEV_WC;
+		azx_bus(chip)->dma_type = SNDRV_DMA_TYPE_DEV_WC_SG;
 
 	if (chip->driver_type = AZX_DRIVER_NVIDIA) {
 		dev_dbg(chip->card->dev, "Enable delay in RIRB handling\n");
-- 
2.35.3
