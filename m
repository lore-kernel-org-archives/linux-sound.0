Received: from out28-73.mail.aliyun.com (out28-73.mail.aliyun.com [115.124.28.73])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6D3A33A1E8C;
	Tue,  7 Apr 2026 08:24:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=115.124.28.73
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775550261; cv=none; b=k0pRfjz0gv1Rn2+J/ERTOHtfIUKlx2TPxUnXiqJXTBYVszqeQzB6cu43SULiTmUSohAqAa6QZUB//ff9r/Ob6VcfqxmnB472AqmzVY61iyxqYF2DXLoIibQ3HpfZb9VkJb6YlVsqWfzfVbX77a4t3pPJEuJOtxDoG49Tzhv0dG8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775550261; c=relaxed/simple;
	bh=/rjeYuATgtaqTiyQXZZEsBDu3ZZyIsvyE9WXW+Gl6Ic=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=PdZs2RL34NOtfT1POJFNmKCqXN9mUUlCFmNwbKQN79bq5OLJXSJrdKcB2eG4f/8mVx1RG+6Noefn5w64pUhYQ1TdScAh+F2lOm0S0dnWaCJFRttfYo58FSDqJpcfndTjE0MzDjd7OgrCs4HSUMyCHiRjldkb1U7DVq7MbTjvu3o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=open-hieco.net; spf=pass smtp.mailfrom=open-hieco.net; arc=none smtp.client-ip=115.124.28.73
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=open-hieco.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=open-hieco.net
X-Alimail-AntiSpam:AC=CONTINUE;BC=0.07436268|-1;CH=green;DM=|CONTINUE|false|;DS=CONTINUE|ham_system_inform|0.00383647-0.000630138-0.995533;FP=13771291786202451602|2|1|1|0|-1|-1|-1;HT=maildocker-contentspam033045018182;MF=fuhao@open-hieco.net;NM=1;PH=DS;RN=5;RT=5;SR=0;TI=SMTPD_---.h6Yq2EJ_1775550242;
Received: from higon..(mailfrom:fuhao@open-hieco.net fp:SMTPD_---.h6Yq2EJ_1775550242 cluster:ay29)
          by smtp.aliyun-inc.com;
          Tue, 07 Apr 2026 16:24:06 +0800
From: Fu Hao <fuhao@open-hieco.net>
To: perex@perex.cz,
	tiwai@suse.com
Cc: linux-kernel@vger.kernel.org,
	linux-sound@vger.kernel.org,
	Fu Hao <fuhao@open-hieco.net>
Subject: [PATCH v2 7/8] ALSA: hda: Fix single byte writing issue for Hygon family 18h model 5h
Date: Tue,  7 Apr 2026 16:25:18 +0800
Message-Id: <074f9ceb9e1407220ff60a34f57ba62e7c0ef50f.1775548724.git.fuhao@open-hieco.net>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1775548724.git.fuhao@open-hieco.net>
References: <cover.1775548724.git.fuhao@open-hieco.net>
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
 sound/hda/controllers/intel.c |  4 ++++
 sound/hda/core/controller.c   | 10 +++++++--
 sound/hda/core/stream.c       | 40 +++++++++++++++++++++++++++--------
 3 files changed, 43 insertions(+), 11 deletions(-)

diff --git a/sound/hda/controllers/intel.c b/sound/hda/controllers/intel.c
index eb5d48d90..81797a68e 100644
--- a/sound/hda/controllers/intel.c
+++ b/sound/hda/controllers/intel.c
@@ -1885,6 +1885,10 @@ static int azx_first_init(struct azx *chip)
 	if (chip->driver_type == AZX_DRIVER_ZHAOXINHDMI)
 		bus->polling_mode = 1;
 
+	if (chip->driver_type == AZX_DRIVER_HYGON &&
+	    chip->pci->device == PCI_DEVICE_ID_HYGON_18H_M05H_HDA)
+		bus->access_sdnctl_in_dword = 1;
+
 	bus->remap_addr = pcim_iomap_region(pci, 0, "ICH HD audio");
 	if (IS_ERR(bus->remap_addr))
 		return PTR_ERR(bus->remap_addr);
diff --git a/sound/hda/core/controller.c b/sound/hda/core/controller.c
index 69e11d62b..6312ad7af 100644
--- a/sound/hda/core/controller.c
+++ b/sound/hda/core/controller.c
@@ -511,7 +511,10 @@ void snd_hdac_bus_exit_link_reset(struct hdac_bus *bus)
 {
 	unsigned long timeout;
 
-	snd_hdac_chip_updateb(bus, GCTL, AZX_GCTL_RESET, AZX_GCTL_RESET);
+	if (bus->access_sdnctl_in_dword)
+		snd_hdac_chip_updatel(bus, GCTL, AZX_GCTL_RESET, AZX_GCTL_RESET);
+	else
+		snd_hdac_chip_updateb(bus, GCTL, AZX_GCTL_RESET, AZX_GCTL_RESET);
 
 	timeout = jiffies + msecs_to_jiffies(100);
 	while (!snd_hdac_chip_readb(bus, GCTL) && time_before(jiffies, timeout))
@@ -576,7 +579,10 @@ static void azx_int_disable(struct hdac_bus *bus)
 
 	/* disable interrupts in stream descriptor */
 	list_for_each_entry(azx_dev, &bus->stream_list, list)
-		snd_hdac_stream_updateb(azx_dev, SD_CTL, SD_INT_MASK, 0);
+		if (bus->access_sdnctl_in_dword)
+			snd_hdac_stream_updatel(azx_dev, SD_CTL, SD_INT_MASK, 0);
+		else
+			snd_hdac_stream_updateb(azx_dev, SD_CTL, SD_INT_MASK, 0);
 
 	/* disable SIE for all streams & disable controller CIE and GIE */
 	snd_hdac_chip_writel(bus, INTCTL, 0);
diff --git a/sound/hda/core/stream.c b/sound/hda/core/stream.c
index b471a038b..0091c4ef6 100644
--- a/sound/hda/core/stream.c
+++ b/sound/hda/core/stream.c
@@ -146,8 +146,12 @@ void snd_hdac_stream_start(struct hdac_stream *azx_dev)
 			stripe_ctl = snd_hdac_get_stream_stripe_ctl(bus, azx_dev->substream);
 		else
 			stripe_ctl = 0;
-		snd_hdac_stream_updateb(azx_dev, SD_CTL_3B, SD_CTL_STRIPE_MASK,
-					stripe_ctl);
+		if (bus->access_sdnctl_in_dword)
+			snd_hdac_stream_updatel(azx_dev, SD_CTL_3B, SD_CTL_STRIPE_MASK,
+						stripe_ctl);
+		else
+			snd_hdac_stream_updateb(azx_dev, SD_CTL_3B, SD_CTL_STRIPE_MASK,
+						stripe_ctl);
 	}
 	/* set DMA start and interrupt mask */
 	if (bus->access_sdnctl_in_dword)
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
+	if (bus->access_sdnctl_in_dword) {
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
+	if (bus->access_sdnctl_in_dword)
+		snd_hdac_stream_updatel(azx_dev, SD_CTL, 0, SD_CTL_STREAM_RESET);
+	else
+		snd_hdac_stream_updateb(azx_dev, SD_CTL, 0, SD_CTL_STREAM_RESET);
 
 	/* wait for hardware to report that the stream entered reset */
 	snd_hdac_stream_readb_poll(azx_dev, SD_CTL, val, (val & SD_CTL_STREAM_RESET), 3, 300);
@@ -238,7 +257,10 @@ void snd_hdac_stream_reset(struct hdac_stream *azx_dev)
 	if (azx_dev->bus->dma_stop_delay && dma_run_state)
 		udelay(azx_dev->bus->dma_stop_delay);
 
-	snd_hdac_stream_updateb(azx_dev, SD_CTL, SD_CTL_STREAM_RESET, 0);
+	if (bus->access_sdnctl_in_dword)
+		snd_hdac_stream_updatel(azx_dev, SD_CTL, SD_CTL_STREAM_RESET, 0);
+	else
+		snd_hdac_stream_updateb(azx_dev, SD_CTL, SD_CTL_STREAM_RESET, 0);
 
 	/* wait for hardware to report that the stream is out of reset */
 	snd_hdac_stream_readb_poll(azx_dev, SD_CTL, val, !(val & SD_CTL_STREAM_RESET), 3, 300);
-- 
2.34.1

