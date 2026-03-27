Received: from out28-136.mail.aliyun.com (out28-136.mail.aliyun.com [115.124.28.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 13A5F3D5651;
	Fri, 27 Mar 2026 08:16:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=115.124.28.136
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774599411; cv=none; b=IoGPF3udhblmX0d07mhxTkrTnh101poJIAFA5sOA+Wy8waVwbn2OhWJuKIKMKfcPgMlMY71TcAUuyTZai6kOi+lp8YjrLg0wB2GOvK+jbQsDEf8e7jrAkWq74y7jttDPDTj2H2zf+mjVpN/5Kn3YTja8h1Hfu1TtRZ/P8AWtYhA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774599411; c=relaxed/simple;
	bh=/nxndo//ast7P75ncXLL86cDTV+NCxVD2lEMWPd79lw=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=H+JEa3oYjvOPuG7jspQ9PVgDdiS+rZeeYXFA1p1F3nyeLZdPBqlgqqITlVYdHszdovvDEVBueXZxLJAxl/6LX83VAHKJM8xWXRR+ICOFTxRyvLAE6fBq/rfgVAoaflfhvkfJ9Zsx1rJPwssr0Lg63MXaStoDSLsh4htndBOeznA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=open-hieco.net; spf=pass smtp.mailfrom=open-hieco.net; arc=none smtp.client-ip=115.124.28.136
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=open-hieco.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=open-hieco.net
X-Alimail-AntiSpam:AC=CONTINUE;BC=0.07436259|-1;CH=blue;DM=|OVERLOAD|false|;DS=CONTINUE|ham_system_inform|0.00344733-0.00060156-0.995951;FP=13132325447127404178|3|1|1|0|-1|-1|-1;HT=maildocker-contentspam033037025160;MF=fuhao@open-hieco.net;NM=1;PH=DS;RN=5;RT=5;SR=0;TI=SMTPD_---.h.Byuum_1774599079;
Received: from higon..(mailfrom:fuhao@open-hieco.net fp:SMTPD_---.h.Byuum_1774599079 cluster:ay29)
          by smtp.aliyun-inc.com;
          Fri, 27 Mar 2026 16:11:25 +0800
From: Fu Hao <fuhao@open-hieco.net>
To: perex@perex.cz,
	tiwai@suse.com
Cc: linux-kernel@vger.kernel.org,
	linux-sound@vger.kernel.org,
	Fu Hao <fuhao@open-hieco.net>
Subject: [PATCH 7/8] ALSA: hda: Fix single byte writing issue for Hygon family 18h model 5h
Date: Fri, 27 Mar 2026 16:11:13 +0800
Message-Id: <b978ca224f7c9a3c30efd69abdac5df395da63fa.1774595153.git.fuhao@open-hieco.net>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1774595153.git.fuhao@open-hieco.net>
References: <cover.1774595153.git.fuhao@open-hieco.net>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

On Hygon family 18h model 5h controller, some registers such as
GCTL, SD_CTL and SD_CTL_3B should be accessed in dword, or the
writing will fail.

Signed-off-by: Fu Hao <fuhao@open-hieco.net>
---
 include/sound/hdaudio.h       |  1 +
 sound/hda/controllers/intel.c |  4 ++++
 sound/hda/core/controller.c   | 10 +++++++--
 sound/hda/core/stream.c       | 42 ++++++++++++++++++++++++++---------
 4 files changed, 45 insertions(+), 12 deletions(-)

diff --git a/include/sound/hdaudio.h b/include/sound/hdaudio.h
index f11bfc6b9..57a144fec 100644
--- a/include/sound/hdaudio.h
+++ b/include/sound/hdaudio.h
@@ -352,6 +352,7 @@ struct hdac_bus {
 	bool not_use_interrupts:1;	/* prohibiting the RIRB IRQ */
 	bool access_sdnctl_in_dword:1;	/* accessing the sdnctl register by dword */
 	bool use_pio_for_commands:1;	/* Use PIO instead of CORB for commands */
+	bool hygon_dword_access:1;
 
 	int poll_count;
 
diff --git a/sound/hda/controllers/intel.c b/sound/hda/controllers/intel.c
index eb5d48d90..6b27248dc 100644
--- a/sound/hda/controllers/intel.c
+++ b/sound/hda/controllers/intel.c
@@ -1885,6 +1885,10 @@ static int azx_first_init(struct azx *chip)
 	if (chip->driver_type == AZX_DRIVER_ZHAOXINHDMI)
 		bus->polling_mode = 1;
 
+	if (chip->driver_type == AZX_DRIVER_HYGON &&
+	    chip->pci->device == PCI_DEVICE_ID_HYGON_18H_M05H_HDA)
+		bus->hygon_dword_access = 1;
+
 	bus->remap_addr = pcim_iomap_region(pci, 0, "ICH HD audio");
 	if (IS_ERR(bus->remap_addr))
 		return PTR_ERR(bus->remap_addr);
diff --git a/sound/hda/core/controller.c b/sound/hda/core/controller.c
index 69e11d62b..bfe817045 100644
--- a/sound/hda/core/controller.c
+++ b/sound/hda/core/controller.c
@@ -511,7 +511,10 @@ void snd_hdac_bus_exit_link_reset(struct hdac_bus *bus)
 {
 	unsigned long timeout;
 
-	snd_hdac_chip_updateb(bus, GCTL, AZX_GCTL_RESET, AZX_GCTL_RESET);
+	if (bus->hygon_dword_access)
+		snd_hdac_chip_updatel(bus, GCTL, AZX_GCTL_RESET, AZX_GCTL_RESET);
+	else
+		snd_hdac_chip_updateb(bus, GCTL, AZX_GCTL_RESET, AZX_GCTL_RESET);
 
 	timeout = jiffies + msecs_to_jiffies(100);
 	while (!snd_hdac_chip_readb(bus, GCTL) && time_before(jiffies, timeout))
@@ -576,7 +579,10 @@ static void azx_int_disable(struct hdac_bus *bus)
 
 	/* disable interrupts in stream descriptor */
 	list_for_each_entry(azx_dev, &bus->stream_list, list)
-		snd_hdac_stream_updateb(azx_dev, SD_CTL, SD_INT_MASK, 0);
+		if (bus->hygon_dword_access)
+			snd_hdac_stream_updatel(azx_dev, SD_CTL, SD_INT_MASK, 0);
+		else
+			snd_hdac_stream_updateb(azx_dev, SD_CTL, SD_INT_MASK, 0);
 
 	/* disable SIE for all streams & disable controller CIE and GIE */
 	snd_hdac_chip_writel(bus, INTCTL, 0);
diff --git a/sound/hda/core/stream.c b/sound/hda/core/stream.c
index b471a038b..ccc0003a8 100644
--- a/sound/hda/core/stream.c
+++ b/sound/hda/core/stream.c
@@ -146,11 +146,15 @@ void snd_hdac_stream_start(struct hdac_stream *azx_dev)
 			stripe_ctl = snd_hdac_get_stream_stripe_ctl(bus, azx_dev->substream);
 		else
 			stripe_ctl = 0;
-		snd_hdac_stream_updateb(azx_dev, SD_CTL_3B, SD_CTL_STRIPE_MASK,
-					stripe_ctl);
+		if (bus->hygon_dword_access)
+			snd_hdac_stream_updatel(azx_dev, SD_CTL_3B, SD_CTL_STRIPE_MASK,
+						stripe_ctl);
+		else
+			snd_hdac_stream_updateb(azx_dev, SD_CTL_3B, SD_CTL_STRIPE_MASK,
+						stripe_ctl);
 	}
 	/* set DMA start and interrupt mask */
-	if (bus->access_sdnctl_in_dword)
+	if (bus->access_sdnctl_in_dword || bus->hygon_dword_access)
 		snd_hdac_stream_updatel(azx_dev, SD_CTL,
 				0, SD_CTL_DMA_START | SD_INT_MASK);
 	else
@@ -166,11 +170,22 @@ EXPORT_SYMBOL_GPL(snd_hdac_stream_start);
  */
 static void snd_hdac_stream_clear(struct hdac_stream *azx_dev)
 {
-	snd_hdac_stream_updateb(azx_dev, SD_CTL,
-				SD_CTL_DMA_START | SD_INT_MASK, 0);
-	snd_hdac_stream_writeb(azx_dev, SD_STS, SD_INT_MASK); /* to be sure */
-	if (azx_dev->stripe)
-		snd_hdac_stream_updateb(azx_dev, SD_CTL_3B, SD_CTL_STRIPE_MASK, 0);
+	struct hdac_bus *bus = azx_dev->bus;
+
+	if (bus->hygon_dword_access) {
+		snd_hdac_stream_updatel(azx_dev, SD_CTL,
+					SD_CTL_DMA_START | SD_INT_MASK, 0);
+		snd_hdac_stream_writeb(azx_dev, SD_STS, SD_INT_MASK); /* to be sure */
+		if (azx_dev->stripe)
+			snd_hdac_stream_updatel(azx_dev, SD_CTL_3B, SD_CTL_STRIPE_MASK, 0);
+	} else {
+		snd_hdac_stream_updateb(azx_dev, SD_CTL,
+					SD_CTL_DMA_START | SD_INT_MASK, 0);
+		snd_hdac_stream_writeb(azx_dev, SD_STS, SD_INT_MASK); /* to be sure */
+		if (azx_dev->stripe)
+			snd_hdac_stream_updateb(azx_dev, SD_CTL_3B, SD_CTL_STRIPE_MASK, 0);
+	}
+
 	azx_dev->running = false;
 }
 
@@ -225,12 +240,16 @@ void snd_hdac_stream_reset(struct hdac_stream *azx_dev)
 {
 	unsigned char val;
 	int dma_run_state;
+	struct hdac_bus *bus = azx_dev->bus;
 
 	snd_hdac_stream_clear(azx_dev);
 
 	dma_run_state = snd_hdac_stream_readb(azx_dev, SD_CTL) & SD_CTL_DMA_START;
 
-	snd_hdac_stream_updateb(azx_dev, SD_CTL, 0, SD_CTL_STREAM_RESET);
+	if (bus->hygon_dword_access)
+		snd_hdac_stream_updatel(azx_dev, SD_CTL, 0, SD_CTL_STREAM_RESET);
+	else
+		snd_hdac_stream_updateb(azx_dev, SD_CTL, 0, SD_CTL_STREAM_RESET);
 
 	/* wait for hardware to report that the stream entered reset */
 	snd_hdac_stream_readb_poll(azx_dev, SD_CTL, val, (val & SD_CTL_STREAM_RESET), 3, 300);
@@ -238,7 +257,10 @@ void snd_hdac_stream_reset(struct hdac_stream *azx_dev)
 	if (azx_dev->bus->dma_stop_delay && dma_run_state)
 		udelay(azx_dev->bus->dma_stop_delay);
 
-	snd_hdac_stream_updateb(azx_dev, SD_CTL, SD_CTL_STREAM_RESET, 0);
+	if (bus->hygon_dword_access)
+		snd_hdac_stream_updatel(azx_dev, SD_CTL, SD_CTL_STREAM_RESET, 0);
+	else
+		snd_hdac_stream_updateb(azx_dev, SD_CTL, SD_CTL_STREAM_RESET, 0);
 
 	/* wait for hardware to report that the stream is out of reset */
 	snd_hdac_stream_readb_poll(azx_dev, SD_CTL, val, !(val & SD_CTL_STREAM_RESET), 3, 300);
-- 
2.34.1

