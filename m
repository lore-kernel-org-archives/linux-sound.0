Received: from mail1.perex.cz (mail1.perex.cz [77.48.224.245])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E8A185A7A1
	for <linux-sound@vger.kernel.org>; Wed, 31 Jan 2024 15:17:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=77.48.224.245
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1706714229; cv=none; b=CBwDvwtElAJIl4K8dBTuDcN2M+XjvuGO/d2yIgUNPREuQRRd29xjrS1Exwi2w+nw8GWJAphmd3XFVCi51ASRqCFBuxh4PEOSwhq5+qAC57iim++eIDaWmv0Zrh/UsDurHJpsvcerwmDw+bk6fDd2ebZTOWt0VsM+KGRnirGQzjY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1706714229; c=relaxed/simple;
	bh=rvoPV7YF0BQFuz5WXAMWHk0kjn6mutG4Kwy0QVvRjOM=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=ru50FnSgzsQ5O9yGHBWd1clsSWeLApS4S6x9ptUB/4BxhyRhI6JhgTy3G7BR9L03P59uEhrq8Uixb95Jy7NROHtBLYnC5hb2jNNVkmnWi1B5GvCPyiX7S4HUyRI9jVwO8qIhyfdUSvEY5eWNr8VeTjDhly41ylXTdzWG7xVSIAo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=perex.cz; spf=pass smtp.mailfrom=perex.cz; dkim=pass (1024-bit key) header.d=perex.cz header.i=@perex.cz header.b=zVz9ij/T; arc=none smtp.client-ip=77.48.224.245
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=perex.cz
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=perex.cz
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=perex.cz header.i=@perex.cz header.b="zVz9ij/T"
Received: from mail1.perex.cz (localhost [127.0.0.1])
	by smtp1.perex.cz (Perex's E-mail Delivery System) with ESMTP id E84354699;
	Wed, 31 Jan 2024 16:10:12 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.perex.cz E84354699
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=perex.cz; s=default;
	t=1706713813; bh=PmkRuhFG0M+aUQb24QYcEyjPsQqWh0kNf5CiR/ptAGs=;
	h=From:To:Cc:Subject:Date:From;
	b=zVz9ij/T31ozv6VY6nxW3ODVonTFzHDSs0fqNRVBN/7zyO82Pa9vxXN0lgg11cbs6
	 45Ks8mrEc/CKqEwlZKc+OS/OrdoOoMZobdxj77X7A4e8m724PRpMeJNoHG2kZeDQWU
	 y5KbgZ+v7FtxflsGh3V2REPFAMHaWq3MWu/5/VQI=
Received: from p1gen4.perex-int.cz (unknown [192.168.100.98])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: perex)
	by mail1.perex.cz (Perex's E-mail Delivery System) with ESMTPSA;
	Wed, 31 Jan 2024 16:10:09 +0100 (CET)
From: Jaroslav Kysela <perex@perex.cz>
To:  <linux-sound@vger.kernel.org>
Cc: Takashi Iwai <tiwai@suse.de>,
	Jaroslav Kysela <perex@perex.cz>
Subject: [PATCH] ALSA: hda: use azx_stream() helper in all places
Date: Wed, 31 Jan 2024 16:10:01 +0100
Message-ID: <20240131151001.737372-1-perex@perex.cz>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Make code more readable with azx_stream() helper. No functional change.

Signed-off-by: Jaroslav Kysela <perex@perex.cz>
---
 sound/pci/hda/hda_controller.c | 20 +++++++-------
 sound/pci/hda/hda_intel.c      | 50 +++++++++++++++++-----------------
 2 files changed, 35 insertions(+), 35 deletions(-)

diff --git a/sound/pci/hda/hda_controller.c b/sound/pci/hda/hda_controller.c
index 3e7bfeee84fd..0ec1e7192d72 100644
--- a/sound/pci/hda/hda_controller.c
+++ b/sound/pci/hda/hda_controller.c
@@ -117,9 +117,9 @@ static int azx_pcm_hw_params(struct snd_pcm_substream *substream,
 		goto unlock;
 	}
 
-	azx_dev->core.bufsize = 0;
-	azx_dev->core.period_bytes = 0;
-	azx_dev->core.format_val = 0;
+	azx_stream(azx_dev)->bufsize = 0;
+	azx_stream(azx_dev)->period_bytes = 0;
+	azx_stream(azx_dev)->format_val = 0;
 
 unlock:
 	dsp_unlock(azx_dev);
@@ -182,13 +182,13 @@ static int azx_pcm_prepare(struct snd_pcm_substream *substream)
 
 	snd_hdac_stream_setup(azx_stream(azx_dev), false);
 
-	stream_tag = azx_dev->core.stream_tag;
+	stream_tag = azx_stream(azx_dev)->stream_tag;
 	/* CA-IBG chips need the playback stream starting from 1 */
 	if ((chip->driver_caps & AZX_DCAPS_CTX_WORKAROUND) &&
 	    stream_tag > chip->capture_streams)
 		stream_tag -= chip->capture_streams;
 	err = snd_hda_codec_prepare(apcm->codec, hinfo, stream_tag,
-				     azx_dev->core.format_val, substream);
+				     azx_stream(azx_dev)->format_val, substream);
 
  unlock:
 	if (!err)
@@ -240,7 +240,7 @@ static int azx_pcm_trigger(struct snd_pcm_substream *substream, int cmd)
 		if (s->pcm->card != substream->pcm->card)
 			continue;
 		azx_dev = get_azx_dev(s);
-		sbits |= 1 << azx_dev->core.index;
+		sbits |= 1 << azx_stream(azx_dev)->index;
 		snd_pcm_trigger_done(s, substream);
 	}
 
@@ -288,7 +288,7 @@ EXPORT_SYMBOL_GPL(azx_get_pos_posbuf);
 unsigned int azx_get_position(struct azx *chip,
 			      struct azx_dev *azx_dev)
 {
-	struct snd_pcm_substream *substream = azx_dev->core.substream;
+	struct snd_pcm_substream *substream = azx_stream(azx_dev)->substream;
 	unsigned int pos;
 	int stream = substream->stream;
 	int delay = 0;
@@ -298,7 +298,7 @@ unsigned int azx_get_position(struct azx *chip,
 	else /* use the position buffer as default */
 		pos = azx_get_pos_posbuf(chip, azx_dev);
 
-	if (pos >= azx_dev->core.bufsize)
+	if (pos >= azx_stream(azx_dev)->bufsize)
 		pos = 0;
 
 	if (substream->runtime) {
@@ -386,7 +386,7 @@ static int azx_get_sync_time(ktime_t *device,
 	do {
 		timeout = 100;
 		dma_select = (direction << GTSCC_CDMAS_DMA_DIR_SHIFT) |
-					(azx_dev->core.stream_tag - 1);
+					(azx_stream(azx_dev)->stream_tag - 1);
 		snd_hdac_chip_writel(azx_bus(chip), GTSCC, dma_select);
 
 		/* Enable the capture */
@@ -501,7 +501,7 @@ static int azx_get_time_info(struct snd_pcm_substream *substream,
 
 		snd_pcm_gettime(substream->runtime, system_ts);
 
-		nsec = timecounter_read(&azx_dev->core.tc);
+		nsec = timecounter_read(&azx_stream(azx_dev)->tc);
 		if (audio_tstamp_config->report_delay)
 			nsec = azx_adjust_codec_delay(substream, nsec);
 
diff --git a/sound/pci/hda/hda_intel.c b/sound/pci/hda/hda_intel.c
index 2276adc84478..beca47989327 100644
--- a/sound/pci/hda/hda_intel.c
+++ b/sound/pci/hda/hda_intel.c
@@ -572,7 +572,7 @@ static void hda_intel_init_chip(struct azx *chip, bool full_reset)
 static int azx_get_delay_from_lpib(struct azx *chip, struct azx_dev *azx_dev,
 				   unsigned int pos)
 {
-	struct snd_pcm_substream *substream = azx_dev->core.substream;
+	struct snd_pcm_substream *substream = azx_stream(azx_dev)->substream;
 	int stream = substream->stream;
 	unsigned int lpib_pos = azx_get_pos_lpib(chip, azx_dev);
 	int delay;
@@ -582,16 +582,16 @@ static int azx_get_delay_from_lpib(struct azx *chip, struct azx_dev *azx_dev,
 	else
 		delay = lpib_pos - pos;
 	if (delay < 0) {
-		if (delay >= azx_dev->core.delay_negative_threshold)
+		if (delay >= azx_stream(azx_dev)->delay_negative_threshold)
 			delay = 0;
 		else
-			delay += azx_dev->core.bufsize;
+			delay += azx_stream(azx_dev)->bufsize;
 	}
 
-	if (delay >= azx_dev->core.period_bytes) {
+	if (delay >= azx_stream(azx_dev)->period_bytes) {
 		dev_info(chip->card->dev,
 			 "Unstable LPIB (%d >= %d); disabling LPIB delay counting\n",
-			 delay, azx_dev->core.period_bytes);
+			 delay, azx_stream(azx_dev)->period_bytes);
 		delay = 0;
 		chip->driver_caps &= ~AZX_DCAPS_COUNT_LPIB_DELAY;
 		chip->get_delay[stream] = NULL;
@@ -636,7 +636,7 @@ static int azx_position_check(struct azx *chip, struct azx_dev *azx_dev)
  */
 static int azx_position_ok(struct azx *chip, struct azx_dev *azx_dev)
 {
-	struct snd_pcm_substream *substream = azx_dev->core.substream;
+	struct snd_pcm_substream *substream = azx_stream(azx_dev)->substream;
 	struct snd_pcm_runtime *runtime = substream->runtime;
 	int stream = substream->stream;
 	u32 wallclk;
@@ -650,8 +650,8 @@ static int azx_position_ok(struct azx *chip, struct azx_dev *azx_dev)
 	if (chip->driver_type == AZX_DRIVER_LOONGSON)
 		return 1;
 
-	wallclk = azx_readl(chip, WALLCLK) - azx_dev->core.start_wallclk;
-	if (wallclk < (azx_dev->core.period_wallclk * 2) / 3)
+	wallclk = azx_readl(chip, WALLCLK) - azx_stream(azx_dev)->start_wallclk;
+	if (wallclk < (azx_stream(azx_dev)->period_wallclk * 2) / 3)
 		return -1;	/* bogus (too early) interrupt */
 
 	if (chip->get_position[stream])
@@ -674,19 +674,19 @@ static int azx_position_ok(struct azx *chip, struct azx_dev *azx_dev)
 		}
 	}
 
-	if (pos >= azx_dev->core.bufsize)
+	if (pos >= azx_stream(azx_dev)->bufsize)
 		pos = 0;
 
-	if (WARN_ONCE(!azx_dev->core.period_bytes,
+	if (WARN_ONCE(!azx_stream(azx_dev)->period_bytes,
 		      "hda-intel: zero azx_dev->period_bytes"))
 		return -1; /* this shouldn't happen! */
-	if (wallclk < (azx_dev->core.period_wallclk * 5) / 4 &&
-	    pos % azx_dev->core.period_bytes > azx_dev->core.period_bytes / 2)
+	if (wallclk < (azx_stream(azx_dev)->period_wallclk * 5) / 4 &&
+	    pos % azx_stream(azx_dev)->period_bytes > azx_stream(azx_dev)->period_bytes / 2)
 		/* NG - it's below the first next period boundary */
 		return chip->bdl_pos_adj ? 0 : -1;
-	azx_dev->core.start_wallclk += wallclk;
+	azx_stream(azx_dev)->start_wallclk += wallclk;
 
-	if (azx_dev->core.no_period_wakeup)
+	if (azx_stream(azx_dev)->no_period_wakeup)
 		return 1; /* OK, no need to check period boundary */
 
 	if (runtime->hw_ptr_base != runtime->hw_ptr_interrupt)
@@ -794,7 +794,7 @@ static unsigned int azx_via_get_position(struct azx *chip,
 	unsigned int fifo_size;
 
 	link_pos = snd_hdac_stream_get_pos_lpib(azx_stream(azx_dev));
-	if (azx_dev->core.substream->stream == SNDRV_PCM_STREAM_PLAYBACK) {
+	if (azx_stream(azx_dev)->substream->stream == SNDRV_PCM_STREAM_PLAYBACK) {
 		/* Playback, no problem using link position */
 		return link_pos;
 	}
@@ -803,8 +803,8 @@ static unsigned int azx_via_get_position(struct azx *chip,
 	/* For new chipset,
 	 * use mod to get the DMA position just like old chipset
 	 */
-	mod_dma_pos = le32_to_cpu(*azx_dev->core.posbuf);
-	mod_dma_pos %= azx_dev->core.period_bytes;
+	mod_dma_pos = le32_to_cpu(*azx_stream(azx_dev)->posbuf);
+	mod_dma_pos %= azx_stream(azx_dev)->period_bytes;
 
 	fifo_size = azx_stream(azx_dev)->fifo_size;
 
@@ -817,20 +817,20 @@ static unsigned int azx_via_get_position(struct azx *chip,
 	}
 
 	if (link_pos <= fifo_size)
-		mini_pos = azx_dev->core.bufsize + link_pos - fifo_size;
+		mini_pos = azx_stream(azx_dev)->bufsize + link_pos - fifo_size;
 	else
 		mini_pos = link_pos - fifo_size;
 
 	/* Find nearest previous boudary */
-	mod_mini_pos = mini_pos % azx_dev->core.period_bytes;
-	mod_link_pos = link_pos % azx_dev->core.period_bytes;
+	mod_mini_pos = mini_pos % azx_stream(azx_dev)->period_bytes;
+	mod_link_pos = link_pos % azx_stream(azx_dev)->period_bytes;
 	if (mod_link_pos >= fifo_size)
 		bound_pos = link_pos - mod_link_pos;
 	else if (mod_dma_pos >= mod_mini_pos)
 		bound_pos = mini_pos - mod_mini_pos;
 	else {
-		bound_pos = mini_pos - mod_mini_pos + azx_dev->core.period_bytes;
-		if (bound_pos >= azx_dev->core.bufsize)
+		bound_pos = mini_pos - mod_mini_pos + azx_stream(azx_dev)->period_bytes;
+		if (bound_pos >= azx_stream(azx_dev)->bufsize)
 			bound_pos = 0;
 	}
 
@@ -843,7 +843,7 @@ static unsigned int azx_via_get_position(struct azx *chip,
 /* get the current DMA position with FIFO size correction */
 static unsigned int azx_get_pos_fifo(struct azx *chip, struct azx_dev *azx_dev)
 {
-	struct snd_pcm_substream *substream = azx_dev->core.substream;
+	struct snd_pcm_substream *substream = azx_stream(azx_dev)->substream;
 	struct snd_pcm_runtime *runtime = substream->runtime;
 	unsigned int pos, delay;
 
@@ -865,7 +865,7 @@ static unsigned int azx_get_pos_fifo(struct azx *chip, struct azx_dev *azx_dev)
 	/* correct the DMA position for capture stream */
 	if (substream->stream == SNDRV_PCM_STREAM_CAPTURE) {
 		if (pos < delay)
-			pos += azx_dev->core.bufsize;
+			pos += azx_stream(azx_dev)->bufsize;
 		pos -= delay;
 	}
 
@@ -875,7 +875,7 @@ static unsigned int azx_get_pos_fifo(struct azx *chip, struct azx_dev *azx_dev)
 static int azx_get_delay_from_fifo(struct azx *chip, struct azx_dev *azx_dev,
 				   unsigned int pos)
 {
-	struct snd_pcm_substream *substream = azx_dev->core.substream;
+	struct snd_pcm_substream *substream = azx_stream(azx_dev)->substream;
 
 	/* just read back the calculated value in the above */
 	return substream->runtime->delay;
-- 
2.43.0

