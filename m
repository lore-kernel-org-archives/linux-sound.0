Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 921ED14B064
	for <linux-sound@vger.kernel.org>; Tue, 25 Jun 2024 11:33:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719315214; cv=none; b=rCwkK+lGOtioYuKrGjkBzjUC4c5684PEY+ofCyOxVjRlAYVngydNixYDuEcpRB0HKUMYEZ9R/liHG5GW/euVAurJNOTdXorfTe5+WFvuET/DEws+w8FrT4r4UxLsSO2j4URtCRkMo3XPnWsd8vmLRtr38Lzk8o27pPtgoPZVTQo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719315214; c=relaxed/simple;
	bh=HFEWyyvwp+XHphDM0viXNpfsqPIT+HOA268QK6XzZQM=;
	h=From:To:Subject:Date:Message-ID:MIME-Version; b=Nyk22ENuY2DItWS5vNuMBAWbwCH/BGVW7Lhmp8SeLQVpeegqTsJJE7WzHSXZ8s27ErIFe7Lc99DntKCIx4AHbZsxyCXrG6F1Crzst/mA/rR+3jNQGwtOKVbhFSXzGuPUoLzpShGiWsLBbQvqQR06OUnoSw3cDCUg9UbDxHFar94=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=LN2iTGPS; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=2xq1ofvX; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=LN2iTGPS; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=2xq1ofvX; arc=none smtp.client-ip=195.135.223.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="LN2iTGPS";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="2xq1ofvX";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="LN2iTGPS";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="2xq1ofvX"
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id B44A61F852;
	Tue, 25 Jun 2024 11:33:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1719315210; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=0svU6Ij4kZFjeZd9e9Dag/S4TeDdsTAYwesrrIPGf+g=;
	b=LN2iTGPSrZpl9IiflVFZG5SJ87brrdvrSiXv09QYv+2C55wZ0RYzKWoleNALXCE63uC5Rb
	KQwkirSz2gaRhJnsr/cCd4w1cPFJQdWS1YvQRpW0sEpVrETArJkyjXBpcfm1tsSB1m7fql
	s0FnAOsZViDqPXP/YsnIgUENhfvpO6c=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1719315210;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=0svU6Ij4kZFjeZd9e9Dag/S4TeDdsTAYwesrrIPGf+g=;
	b=2xq1ofvXcXuTVrfVyCIV1qj1F/Aa5+3Lg7wDRpKz/EdcY6p5YJkO3fC/AH/hoRkWCSU7+1
	HOF2iOTqYe/waJDQ==
Authentication-Results: smtp-out2.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1719315210; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=0svU6Ij4kZFjeZd9e9Dag/S4TeDdsTAYwesrrIPGf+g=;
	b=LN2iTGPSrZpl9IiflVFZG5SJ87brrdvrSiXv09QYv+2C55wZ0RYzKWoleNALXCE63uC5Rb
	KQwkirSz2gaRhJnsr/cCd4w1cPFJQdWS1YvQRpW0sEpVrETArJkyjXBpcfm1tsSB1m7fql
	s0FnAOsZViDqPXP/YsnIgUENhfvpO6c=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1719315210;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=0svU6Ij4kZFjeZd9e9Dag/S4TeDdsTAYwesrrIPGf+g=;
	b=2xq1ofvXcXuTVrfVyCIV1qj1F/Aa5+3Lg7wDRpKz/EdcY6p5YJkO3fC/AH/hoRkWCSU7+1
	HOF2iOTqYe/waJDQ==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id A690013A9A;
	Tue, 25 Jun 2024 11:33:30 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id PdwXKAqrembPcQAAD6G6ig
	(envelope-from <tiwai@suse.de>); Tue, 25 Jun 2024 11:33:30 +0000
From: Takashi Iwai <tiwai@suse.de>
To: linux-sound@vger.kernel.org
Subject: [PATCH] ALSA: pcm_dmaengine: Unify two close functions
Date: Tue, 25 Jun 2024 13:33:55 +0200
Message-ID: <20240625113356.2123-1-tiwai@suse.de>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spamd-Result: default: False [-2.80 / 50.00];
	BAYES_HAM(-3.00)[100.00%];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	NEURAL_HAM_SHORT(-0.20)[-0.999];
	MIME_GOOD(-0.10)[text/plain];
	FUZZY_BLOCKED(0.00)[rspamd.com];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCPT_COUNT_ONE(0.00)[1];
	ARC_NA(0.00)[];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:email,imap1.dmz-prg2.suse.org:helo];
	FROM_EQ_ENVFROM(0.00)[];
	FROM_HAS_DN(0.00)[];
	MIME_TRACE(0.00)[0:+];
	RCVD_COUNT_TWO(0.00)[2];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	TO_DN_NONE(0.00)[];
	RCVD_TLS_ALL(0.00)[]
X-Spam-Flag: NO
X-Spam-Score: -2.80
X-Spam-Level: 

Both snd_dmaengine_pcm_close() and
snd_dmaengine_pcm_close_release_chan() are almost identical except for
a call of dma_release_channel() in the latter.  For code
simplification, unify them internally.

Just a code refactoring, and no functional changes.

Signed-off-by: Takashi Iwai <tiwai@suse.de>
---
 sound/core/pcm_dmaengine.c | 34 +++++++++++++++-------------------
 1 file changed, 15 insertions(+), 19 deletions(-)

diff --git a/sound/core/pcm_dmaengine.c b/sound/core/pcm_dmaengine.c
index 7346c993a067..4f18511f1c92 100644
--- a/sound/core/pcm_dmaengine.c
+++ b/sound/core/pcm_dmaengine.c
@@ -349,13 +349,8 @@ int snd_dmaengine_pcm_open_request_chan(struct snd_pcm_substream *substream,
 }
 EXPORT_SYMBOL_GPL(snd_dmaengine_pcm_open_request_chan);
 
-/**
- * snd_dmaengine_pcm_close - Close a dmaengine based PCM substream
- * @substream: PCM substream
- *
- * Return: 0 on success, a negative error code otherwise
- */
-int snd_dmaengine_pcm_close(struct snd_pcm_substream *substream)
+static void __snd_dmaengine_pcm_close(struct snd_pcm_substream *substream,
+				      bool release_channel)
 {
 	struct dmaengine_pcm_runtime_data *prtd = substream_to_prtd(substream);
 	struct dma_tx_state state;
@@ -366,8 +361,20 @@ int snd_dmaengine_pcm_close(struct snd_pcm_substream *substream)
 		dmaengine_terminate_async(prtd->dma_chan);
 
 	dmaengine_synchronize(prtd->dma_chan);
+	if (release_channel)
+		dma_release_channel(prtd->dma_chan);
 	kfree(prtd);
+}
 
+/**
+ * snd_dmaengine_pcm_close - Close a dmaengine based PCM substream
+ * @substream: PCM substream
+ *
+ * Return: 0 on success, a negative error code otherwise
+ */
+int snd_dmaengine_pcm_close(struct snd_pcm_substream *substream)
+{
+	__snd_dmaengine_pcm_close(substream, false);
 	return 0;
 }
 EXPORT_SYMBOL_GPL(snd_dmaengine_pcm_close);
@@ -383,18 +390,7 @@ EXPORT_SYMBOL_GPL(snd_dmaengine_pcm_close);
  */
 int snd_dmaengine_pcm_close_release_chan(struct snd_pcm_substream *substream)
 {
-	struct dmaengine_pcm_runtime_data *prtd = substream_to_prtd(substream);
-	struct dma_tx_state state;
-	enum dma_status status;
-
-	status = dmaengine_tx_status(prtd->dma_chan, prtd->cookie, &state);
-	if (status == DMA_PAUSED)
-		dmaengine_terminate_async(prtd->dma_chan);
-
-	dmaengine_synchronize(prtd->dma_chan);
-	dma_release_channel(prtd->dma_chan);
-	kfree(prtd);
-
+	__snd_dmaengine_pcm_close(substream, true);
 	return 0;
 }
 EXPORT_SYMBOL_GPL(snd_dmaengine_pcm_close_release_chan);
-- 
2.43.0

