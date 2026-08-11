Received: from mail-pj1-f52.google.com (mail-pj1-f52.google.com [209.85.216.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 192012E5B21
	for <linux-sound@vger.kernel.org>; Tue, 11 Aug 2026 04:22:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786422165; cv=none; b=h/DKklXlyFh+f6O2lBEsZc/fGgmXlC/xPHvgm1LI7v9lUUE9fy06S+26KjEqJOzkmjoshv5gNmQPruPpXIE/vcYpxgueesllBfZP+7HcC9cgh2tp/Tn6tzigmUm2aWaWHlzIw6d24dhM00WLuPkhXxPrJUkEsG4T6cfxQ7bb4Xo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786422165; c=relaxed/simple;
	bh=dy5iN0wea+nsc4PN7sAPjvU/vb2tQapU6mlBWYmlNCk=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=OE/+ZuTpQDyz7LHjafJhogJ1tVxoEoO+WIhP/mJhdQuasXl1xM942mI0MDZ53BMzz6CqSvJZUT+7zsqzg+KYnZ+6Sn2FIS/EAtfn5mpvr4WTuZYE6vGMG2t2KhAxbWp4XHi6PZdS/n9Lr++dCyVGUYOUT0KSiag+Bk/jg1w1k1o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=A/glQWnP; arc=none smtp.client-ip=209.85.216.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="A/glQWnP"
Received: by mail-pj1-f52.google.com with SMTP id 98e67ed59e1d1-38101f85591so628669a91.1
        for <linux-sound@vger.kernel.org>; Mon, 10 Aug 2026 21:22:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786422163; x=1787026963; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=Mpp6flFgaf+OkTjSxwrQSW1nYERsP+15hr/7N3u0IL0=;
        b=A/glQWnPap2n0svnzIg1LivpGPWCsse6O42oJ97mh9I8CTsZYHBYWIZP4AxnGukTFh
         4P36Na8N2XQK1lYx5yehpKtJeGD64R6L1JdkRBr/hFdg93ZY6YBBKk8ok8DcZmLQtZmC
         RUjaoi031OdKvyr4qPKbaClVrVoZfGEZUxTiYZy0Wbx8iXa9KfBLLfmP/yhH31Zh4BYq
         rn4G0pXdMmjSCUE/vi3VXYzlaqVuw36E6/WQYMbcB61/aRgEwZftAYAd0m9GWV0XnN9x
         8Cr1IoB8r56qDxV0ahRKnW5fIJ44XXtjVWh6fSQY9vOCkD1lLEa81Pfe8w6Hr0zkP48d
         txrw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786422163; x=1787026963;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Mpp6flFgaf+OkTjSxwrQSW1nYERsP+15hr/7N3u0IL0=;
        b=GRb/8mzKCy09JwpgFXdLrYs9j+emaJUFxi9x2SG8rj/AzLC6Yuw9oQkGT/eHog5NAJ
         9VS7BME9Mrv68zBQUQ7Von2dOpaFMkzGsVJsg9Knzsvy+BrNaHgBozvhOLUZjoB9tgZd
         ql56WRx92DTQ2wD/Wj4Gf2Amyloy+ECni1VAyUytrOgql34i0FCpzYAA92yYRKJrrMB2
         paxbRkESMJZj4/kq5D1c/kLi6JOLi0Q4hzqZRySjEkhiP3H1TLox7TH9W9iwXMmilFF4
         nTIE/QpgbanMNgWW0orpiUymDU31miwEmWejw553ATjlFaBdhFFAgKlYcSau42jyN3l/
         uP6A==
X-Gm-Message-State: AOJu0YwHxo2HMYRu1Xj1TipTev9HcGQWBfLmj0QlJIJBUDIBgjYFP0m6
	aVyu6XGUvXo//kWgQ8UZoc+Jv5mN6kFqHQHw/hE93nz0dyhqV6erFi8L6M7g0w==
X-Gm-Gg: AR+sD11O87He+Ykbr8u1KjIuFy3EO1s0c7uAmHSyomLkCqrJxH+2dcCrfpu5RTbFbCO
	O2Ul/bAR/Ci35j5m0wxMF38JJS1vGdCjSWRbvlHdW6ZVwODHasl7wVthH4nr3w6+e80Ui9IZD/y
	sONgyciMmDSBKKFEb35bhpzQDcy7MxQQRMHnqQNYB2YPsV1q9utkLPdKmL5PkRsfs66jCExHzUq
	cQVCwxGaJDL2iEED2oj/kNvczLUES83P9nb7kKdIMg5Hiikph+fuAMNjElHOst1PwrwksGRoR+G
	qRy5m9gtLQLqIAFRJuEHNhMsGzLJjegUVmLNJEQsarSKQ1go3lbjKw6QAYLGIa/nhKSV4r8Q8J1
	CwkCIv/efZwGYulhlzzPvfYojjwbcIa4NFJsXaHe0Ng49tfPGsVdgAw1Ip8NgrCo3d7HcCPsnBh
	N+TqzCHJMR6XlL33aTkym3444/hi8EKkwxx1dP2xhRqFYpU7nE36lKwcUJPsj7S/JfpiLosQCfT
	JANL0FbwIZ+qi/7pzzXmCz7ZALbpGlIeH1+jh+d6jfENJGSwQFdmkKJ3wRDiQqi0v9E/QprdXWL
	08zBwR+QSyKmM2tCIWZOpa1uemA7cTdX/E6AbA==
X-Received: by 2002:a17:90b:2684:b0:387:d5bd:622f with SMTP id 98e67ed59e1d1-392edfac028mr69821a91.18.1786422163343;
        Mon, 10 Aug 2026 21:22:43 -0700 (PDT)
Received: from ryzen.lan ([2601:644:8000:7a86::e35])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-392ee41936asm33863a91.14.2026.08.10.21.22.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 10 Aug 2026 21:22:42 -0700 (PDT)
From: Rosen Penev <rosenp@gmail.com>
To: linux-sound@vger.kernel.org
Cc: Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	linux-kernel@vger.kernel.org (open list)
Subject: [PATCH] sound: pci: mixart: use managed resources for PCI and DMA allocations
Date: Mon, 10 Aug 2026 21:22:41 -0700
Message-ID: <20260811042241.54317-1-rosenp@gmail.com>
X-Mailer: git-send-email 2.55.0
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Convert the Digigram miXart driver to use managed (devm_) resources
for PCI device management, IRQ allocation, memory mapping, and DMA
buffer allocation. This simplifies error handling paths and reduces
the risk of resource leaks.

- Use pcim_enable_device() and pcim_iomap_region() for managed PCI
  resource handling
- Use devm_kzalloc() for manager structure allocation
- Use devm_request_threaded_irq() for IRQ allocation
- Use snd_devm_card_new() for sound card creation
- Use snd_devm_alloc_pages() for DMA buffer allocation
- Simplify snd_mixart_free() to only handle mailbox shutdown and
  board reset since other resources are now auto-released

Clean up trailing whitespace on touched lines.

Signed-off-by: Rosen Penev <rosenp@gmail.com>
---
 sound/pci/mixart/mixart.c | 90 +++++++++------------------------------
 1 file changed, 20 insertions(+), 70 deletions(-)

diff --git a/sound/pci/mixart/mixart.c b/sound/pci/mixart/mixart.c
index f451554cff5f..c4d7b4ca8909 100644
--- a/sound/pci/mixart/mixart.c
+++ b/sound/pci/mixart/mixart.c
@@ -274,7 +274,7 @@ snd_mixart_add_ref_pipe(struct snd_mixart *chip, int pcm_number, int capture,
 			int j;
 			struct mixart_flowinfo *flowinfo;
 			struct mixart_bufferinfo *bufferinfo;
-			
+
 			/* we don't yet know the format, so config 16 bit pcm audio for instance */
 			buf->sgroup_req.stream_info[i].size_max_byte_frame = 1024;
 			buf->sgroup_req.stream_info[i].size_max_sample_frame = 256;
@@ -627,7 +627,7 @@ static int snd_mixart_hw_params(struct snd_pcm_substream *subs,
 		if( subs->stream == SNDRV_PCM_STREAM_CAPTURE ) {
 			i += MIXART_PLAYBACK_STREAMS; /* in array capture is behind playback */
 		}
-		
+
 		bufferinfo = (struct mixart_bufferinfo *)chip->mgr->bufferinfo.area;
 		bufferinfo[i].buffer_address = subs->runtime->dma_addr;
 		bufferinfo[i].available_length = subs->runtime->dma_bytes;
@@ -1059,45 +1059,15 @@ int snd_mixart_create_pcm(struct snd_mixart* chip)
  */
 static int snd_mixart_free(struct mixart_mgr *mgr)
 {
-	unsigned int i;
-
-	for (i = 0; i < mgr->num_cards; i++) {
-		if (mgr->chip[i])
-			snd_card_free(mgr->chip[i]->card);
-	}
-
 	/* stop mailbox */
 	snd_mixart_exit_mailbox(mgr);
 
-	/* release irq  */
-	if (mgr->irq >= 0)
-		free_irq(mgr->irq, mgr);
-
 	/* reset board if some firmware was loaded */
 	if(mgr->dsp_loaded) {
 		snd_mixart_reset_board(mgr);
 		dev_dbg(&mgr->pci->dev, "reset miXart !\n");
 	}
 
-	/* release the i/o ports */
-	for (i = 0; i < 2; ++i)
-		iounmap(mgr->mem[i].virt);
-
-	pci_release_regions(mgr->pci);
-
-	/* free flowarray */
-	if(mgr->flowinfo.area) {
-		snd_dma_free_pages(&mgr->flowinfo);
-		mgr->flowinfo.area = NULL;
-	}
-	/* free bufferarray */
-	if(mgr->bufferinfo.area) {
-		snd_dma_free_pages(&mgr->bufferinfo);
-		mgr->bufferinfo.area = NULL;
-	}
-
-	pci_disable_device(mgr->pci);
-	kfree(mgr);
 	return 0;
 }
 
@@ -1146,11 +1116,11 @@ static const struct snd_info_entry_ops snd_mixart_proc_ops_BA1 = {
 };
 
 
-static void snd_mixart_proc_read(struct snd_info_entry *entry, 
+static void snd_mixart_proc_read(struct snd_info_entry *entry,
                                  struct snd_info_buffer *buffer)
 {
-	struct snd_mixart *chip = entry->private_data;        
-	u32 ref; 
+	struct snd_mixart *chip = entry->private_data;
+	u32 ref;
 
 	snd_iprintf(buffer, "Digigram miXart (alsa card %d)\n\n", chip->chip_idx);
 
@@ -1164,7 +1134,7 @@ static void snd_mixart_proc_read(struct snd_info_entry *entry,
 		default:                             snd_iprintf(buffer, "\tUNKNOWN!\n\n"); break;
 		}
 
-		snd_iprintf(buffer, "- system load -\n");	 
+		snd_iprintf(buffer, "- system load -\n");
 
 		/* get perf reference */
 
@@ -1175,8 +1145,8 @@ static void snd_mixart_proc_read(struct snd_info_entry *entry,
 			u32 streaming = 100 * readl_be( MIXART_MEM( chip->mgr, MIXART_PSEUDOREG_PERF_STREAM_LOAD_OFFSET)) / ref;
 			u32 interr    = 100 * readl_be( MIXART_MEM( chip->mgr, MIXART_PSEUDOREG_PERF_INTERR_LOAD_OFFSET)) / ref;
 
-			snd_iprintf(buffer, "\tstreaming          : %d\n", streaming);
 			snd_iprintf(buffer, "\tmailbox            : %d\n", mailbox);
+			snd_iprintf(buffer, "\tstreaming          : %d\n", streaming);
 			snd_iprintf(buffer, "\tinterrupts handling : %d\n\n", interr);
 		}
 	} /* endif elf loaded */
@@ -1192,7 +1162,7 @@ static void snd_mixart_proc_init(struct snd_mixart *chip)
 
 	if (! snd_card_proc_new(chip->card, "mixart_BA0", &entry)) {
 		entry->content = SNDRV_INFO_CONTENT_DATA;
-		entry->private_data = chip->mgr;	
+		entry->private_data = chip->mgr;
 		entry->c.ops = &snd_mixart_proc_ops_BA0;
 		entry->size = MIXART_BA0_SIZE;
 	}
@@ -1228,7 +1198,7 @@ static int snd_mixart_probe(struct pci_dev *pci,
 	}
 
 	/* enable PCI device */
-	err = pci_enable_device(pci);
+	err = pcim_enable_device(pci);
 	if (err < 0)
 		return err;
 	pci_set_master(pci);
@@ -1237,46 +1207,29 @@ static int snd_mixart_probe(struct pci_dev *pci,
 	if (dma_set_mask(&pci->dev, DMA_BIT_MASK(32)) < 0) {
 		dev_err(&pci->dev,
 			"architecture does not support 32bit PCI busmaster DMA\n");
-		pci_disable_device(pci);
 		return -ENXIO;
 	}
 
 	/*
 	 */
-	mgr = kzalloc_obj(*mgr);
-	if (! mgr) {
-		pci_disable_device(pci);
+	mgr = devm_kzalloc(&pci->dev, sizeof(*mgr), GFP_KERNEL);
+	if (!mgr)
 		return -ENOMEM;
-	}
 
 	mgr->pci = pci;
-	mgr->irq = -1;
 
-	/* resource assignment */
-	err = pci_request_regions(pci, CARD_NAME);
-	if (err < 0) {
-		kfree(mgr);
-		pci_disable_device(pci);
-		return err;
-	}
 	for (i = 0; i < 2; i++) {
 		mgr->mem[i].phys = pci_resource_start(pci, i);
-		mgr->mem[i].virt = pci_ioremap_bar(pci, i);
-		if (!mgr->mem[i].virt) {
-			dev_err(&pci->dev, "unable to remap resource 0x%lx\n",
-			       mgr->mem[i].phys);
-			snd_mixart_free(mgr);
-			return -EBUSY;
-		}
+		mgr->mem[i].virt = pcim_iomap_region(pci, i, CARD_NAME);
+		if (IS_ERR(mgr->mem[i].virt))
+			return PTR_ERR(mgr->mem[i].virt);
 	}
 
-	if (request_threaded_irq(pci->irq, snd_mixart_interrupt,
+	if (devm_request_threaded_irq(&pci->dev, pci->irq, snd_mixart_interrupt,
 				 snd_mixart_threaded_irq, IRQF_SHARED,
-				 KBUILD_MODNAME, mgr)) {
-		dev_err(&pci->dev, "unable to grab IRQ %d\n", pci->irq);
-		snd_mixart_free(mgr);
+				 KBUILD_MODNAME, mgr))
 		return -EBUSY;
-	}
+
 	mgr->irq = pci->irq;
 
 	/* init mailbox  */
@@ -1303,7 +1256,7 @@ static int snd_mixart_probe(struct pci_dev *pci,
 		else
 			idx = index[dev] + i;
 		snprintf(tmpid, sizeof(tmpid), "%s-%d", id[dev] ? id[dev] : "MIXART", i);
-		err = snd_card_new(&pci->dev, idx, tmpid, THIS_MODULE,
+		err = snd_devm_card_new(&pci->dev, idx, tmpid, THIS_MODULE,
 				   0, &card);
 
 		if (err < 0) {
@@ -1321,7 +1274,6 @@ static int snd_mixart_probe(struct pci_dev *pci,
 
 		err = snd_mixart_create(mgr, card, i);
 		if (err < 0) {
-			snd_card_free(card);
 			snd_mixart_free(mgr);
 			return err;
 		}
@@ -1344,8 +1296,7 @@ static int snd_mixart_probe(struct pci_dev *pci,
 	/* create array of streaminfo */
 	size = PAGE_ALIGN( (MIXART_MAX_STREAM_PER_CARD * MIXART_MAX_CARDS *
 			    sizeof(struct mixart_flowinfo)) );
-	if (snd_dma_alloc_pages(SNDRV_DMA_TYPE_DEV, &pci->dev,
-				size, &mgr->flowinfo) < 0) {
+	if (snd_devm_alloc_pages(&pci->dev, SNDRV_DMA_TYPE_DEV, size)) {
 		snd_mixart_free(mgr);
 		return -ENOMEM;
 	}
@@ -1355,8 +1306,7 @@ static int snd_mixart_probe(struct pci_dev *pci,
 	/* create array of bufferinfo */
 	size = PAGE_ALIGN( (MIXART_MAX_STREAM_PER_CARD * MIXART_MAX_CARDS *
 			    sizeof(struct mixart_bufferinfo)) );
-	if (snd_dma_alloc_pages(SNDRV_DMA_TYPE_DEV, &pci->dev,
-				size, &mgr->bufferinfo) < 0) {
+	if (snd_devm_alloc_pages(&pci->dev, SNDRV_DMA_TYPE_DEV, size)) {
 		snd_mixart_free(mgr);
 		return -ENOMEM;
 	}
-- 
2.55.0

