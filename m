Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9DDA3473C60
	for <linux-sound@vger.kernel.org>; Wed,  5 Aug 2026 13:53:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785938005; cv=none; b=E4FxtsCmQX9NZOLTTiBOj89Lo6Cl7ZKfLJOXLqI87Z05B0u2Qk+w0rEGs1o/OnKgEAbzbxdcSHNT2HfpEersVFl3LkjCkLhLB2U5JuLnD0vj5d8RfLjPJzOW+ChWnHeYgEKGLFvCIahCpnRMtMbRzHxJXwoikykvGnzjc7dRUGs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785938005; c=relaxed/simple;
	bh=Y2C/qLp3tiqcz5iIWsplQYaLRfsK0AV6pzN/iMqnsas=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=hcz3gTI5i81ui0uAxhXYfpkJ1A2J7d9iAiCAYYN/f/CnDhzcnu+UJv4PeYsM6t2tdUyGmety0gq4OB6uYVupRUgEIdzSahhjkILK4+S3h6MhEvCx/XQoxFdicWFrdLfr9wOb9NgAxn3GQPVkoXceqBNtKEGiIYzF7p6nhmTQP9E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=BhS7PRR5; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=0ME2mOFU; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=IpbV6MRg; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=7ky6gV8Y; arc=none smtp.client-ip=195.135.223.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="BhS7PRR5";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="0ME2mOFU";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="IpbV6MRg";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="7ky6gV8Y"
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id 4C12D7F0F7;
	Wed,  5 Aug 2026 13:53:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1785937996; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=YZUYUsVGEGWac5Zs8oRaiIDrlGlJukdSs5YKlpOXLqY=;
	b=BhS7PRR5OR9W4oM9GG9Cov+lcGRovpj6a40rzMokbcAdvYitF+E7q5a7RIw5/q4FruZ9q9
	NZGLLFN6ApyT2aaqngskYED1JukiKfbvW/A6flo1OnMyquPmvbrBxshiA3Dbiao8BpXvDH
	pv6c3YWfnTj4z2pz5ohAltsUjnPY5nQ=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1785937996;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=YZUYUsVGEGWac5Zs8oRaiIDrlGlJukdSs5YKlpOXLqY=;
	b=0ME2mOFURPzrJJmPX+OIi7I/DFP4K7zG1rN0aTuHT80X3wj8b8LLacd26ErNiMGrkUJL+q
	jSNMLRsp31vumIBA==
Authentication-Results: smtp-out1.suse.de;
	dkim=pass header.d=suse.de header.s=susede2_rsa header.b=IpbV6MRg;
	dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=7ky6gV8Y
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1785937992; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=YZUYUsVGEGWac5Zs8oRaiIDrlGlJukdSs5YKlpOXLqY=;
	b=IpbV6MRgh1Wzw6Qw0JU+1siI+jtHthf8iSA/nQ76rKCcogJOWo/ZxNIMwin/En+gmYo167
	zTEJhfwgLShn74Fdpj8lYgHpTOsPOlhgZTwcN2G6vN4BHAiZlvUYiMvSoa4eVdB97wcPsM
	jtdDUCoI/PGhM0p2cyhD0icG4D8naa8=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1785937992;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=YZUYUsVGEGWac5Zs8oRaiIDrlGlJukdSs5YKlpOXLqY=;
	b=7ky6gV8Y53iHXYhIwPkdORiZ0Ujvc4+PbZkx5qbO6WAdyXFhiWoXgwpVsvjb/lVCklBLEs
	LsFG0jLwz067PoCw==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id E9737779FF;
	Wed,  5 Aug 2026 13:52:58 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id IPnMNzpAc2ouSQAAD6G6ig
	(envelope-from <tiwai@suse.de>); Wed, 05 Aug 2026 13:52:58 +0000
From: Takashi Iwai <tiwai@suse.de>
To: Mark Brown <broonie@kernel.org>
Cc: linux-sound@vger.kernel.org
Subject: [PATCH 22/31] ASoC: wm0010: Use auto-cleanup for firmware loading
Date: Wed,  5 Aug 2026 15:52:23 +0200
Message-ID: <20260805135247.670693-23-tiwai@suse.de>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260805135247.670693-1-tiwai@suse.de>
References: <20260805135247.670693-1-tiwai@suse.de>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Score: -3.01
X-Spam-Level: 
X-Rspamd-Action: no action
X-Rspamd-Queue-Id: 4C12D7F0F7
X-Spamd-Result: default: False [-3.01 / 50.00];
	BAYES_HAM(-3.00)[100.00%];
	MID_CONTAINS_FROM(1.00)[];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	R_MISSING_CHARSET(0.50)[];
	R_DKIM_ALLOW(-0.20)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	MX_GOOD(-0.01)[];
	TO_DN_SOME(0.00)[];
	ARC_NA(0.00)[];
	DNSWL_BLOCKED(0.00)[2a07:de40:b281:106:10:150:64:167:received];
	RBL_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	MIME_TRACE(0.00)[0:+];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RECEIVED_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:106:10:150:64:167:received];
	RCPT_COUNT_TWO(0.00)[2];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	FROM_EQ_ENVFROM(0.00)[];
	FROM_HAS_DN(0.00)[];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	RCVD_TLS_ALL(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[imap1.dmz-prg2.suse.org:helo,imap1.dmz-prg2.suse.org:rdns,suse.de:mid,suse.de:email,suse.de:dkim];
	RCVD_COUNT_TWO(0.00)[2];
	DKIM_TRACE(0.00)[suse.de:+]
X-Rspamd-Server: rspamd1.dmz-prg2.suse.org
X-Spam-Flag: NO

Simplify the code to manage the firmware loading with __free(firmware)
auto-cleanup.

Only the code refactoring, no functional changes.

Signed-off-by: Takashi Iwai <tiwai@suse.de>
---
 sound/soc/codecs/wm0010.c | 58 ++++++++++++++-------------------------
 1 file changed, 21 insertions(+), 37 deletions(-)

diff --git a/sound/soc/codecs/wm0010.c b/sound/soc/codecs/wm0010.c
index 58c0c601ee6c..c44abffe9b56 100644
--- a/sound/soc/codecs/wm0010.c
+++ b/sound/soc/codecs/wm0010.c
@@ -333,7 +333,6 @@ static int wm0010_firmware_load(const char *name, struct snd_soc_component *comp
 	struct wm0010_boot_xfer *xfer;
 	int ret;
 	DECLARE_COMPLETION_ONSTACK(done);
-	const struct firmware *fw;
 	const struct dfw_binrec *rec;
 	const struct dfw_inforec *inforec;
 	u64 *img;
@@ -342,6 +341,7 @@ static int wm0010_firmware_load(const char *name, struct snd_soc_component *comp
 
 	INIT_LIST_HEAD(&xfer_list);
 
+	const struct firmware *fw __free(firmware) = NULL;
 	ret = request_firmware(&fw, name, component->dev);
 	if (ret != 0) {
 		dev_err(component->dev, "Failed to request application(%s): %d\n",
@@ -360,16 +360,14 @@ static int wm0010_firmware_load(const char *name, struct snd_soc_component *comp
 	/* First record should be INFO */
 	if (rec->command != DFW_CMD_INFO) {
 		dev_err(component->dev, "First record not INFO\r\n");
-		ret = -EINVAL;
-		goto abort;
+		return -EINVAL;
 	}
 
 	if (inforec->info_version != INFO_VERSION) {
 		dev_err(component->dev,
 			"Unsupported version (%02d) of INFO record\r\n",
 			inforec->info_version);
-		ret = -EINVAL;
-		goto abort;
+		return -EINVAL;
 	}
 
 	dev_dbg(component->dev, "Version v%02d INFO record found\r\n",
@@ -378,8 +376,7 @@ static int wm0010_firmware_load(const char *name, struct snd_soc_component *comp
 	/* Check it's a DSP file */
 	if (dsp != DEVICE_ID_WM0010) {
 		dev_err(component->dev, "Not a WM0010 firmware file.\r\n");
-		ret = -EINVAL;
-		goto abort;
+		return -EINVAL;
 	}
 
 	/* Skip the info record as we don't need to send it */
@@ -404,14 +401,14 @@ static int wm0010_firmware_load(const char *name, struct snd_soc_component *comp
 		out = kzalloc(len, GFP_KERNEL | GFP_DMA);
 		if (!out) {
 			ret = -ENOMEM;
-			goto abort1;
+			goto abort;
 		}
 		xfer->t.rx_buf = out;
 
 		img = kzalloc(len, GFP_KERNEL | GFP_DMA);
 		if (!img) {
 			ret = -ENOMEM;
-			goto abort1;
+			goto abort;
 		}
 		xfer->t.tx_buf = img;
 
@@ -449,13 +446,13 @@ static int wm0010_firmware_load(const char *name, struct snd_soc_component *comp
 		ret = spi_async(spi, &xfer->m);
 		if (ret != 0) {
 			dev_err(component->dev, "Write failed: %d\n", ret);
-			goto abort1;
+			goto abort;
 		}
 
 		if (wm0010->boot_failed) {
 			dev_dbg(component->dev, "Boot fail!\n");
 			ret = -EINVAL;
-			goto abort1;
+			goto abort;
 		}
 	}
 
@@ -463,7 +460,7 @@ static int wm0010_firmware_load(const char *name, struct snd_soc_component *comp
 
 	ret = 0;
 
-abort1:
+abort:
 	while (!list_empty(&xfer_list)) {
 		xfer = list_first_entry(&xfer_list, struct wm0010_boot_xfer,
 					list);
@@ -473,8 +470,6 @@ static int wm0010_firmware_load(const char *name, struct snd_soc_component *comp
 		kfree(xfer);
 	}
 
-abort:
-	release_firmware(fw);
 	return ret;
 }
 
@@ -482,14 +477,12 @@ static int wm0010_stage2_load(struct snd_soc_component *component)
 {
 	struct spi_device *spi = to_spi_device(component->dev);
 	struct wm0010_priv *wm0010 = snd_soc_component_get_drvdata(component);
-	const struct firmware *fw;
 	struct spi_message m;
 	struct spi_transfer t;
-	u32 *img;
-	u8 *out;
 	int i;
 	int ret = 0;
 
+	const struct firmware *fw __free(firmware) = NULL;
 	ret = request_firmware(&fw, "wm0010_stage2.bin", component->dev);
 	if (ret != 0) {
 		dev_err(component->dev, "Failed to request stage2 loader: %d\n",
@@ -500,17 +493,15 @@ static int wm0010_stage2_load(struct snd_soc_component *component)
 	dev_dbg(component->dev, "Downloading %zu byte stage 2 loader\n", fw->size);
 
 	/* Copy to local buffer first as vmalloc causes problems for dma */
-	img = kmemdup(&fw->data[0], fw->size, GFP_KERNEL | GFP_DMA);
-	if (!img) {
-		ret = -ENOMEM;
-		goto abort2;
-	}
+	u32 *img __free(kfree) =
+		kmemdup(&fw->data[0], fw->size, GFP_KERNEL | GFP_DMA);
+	if (!img)
+		return -ENOMEM;
 
-	out = kzalloc(fw->size, GFP_KERNEL | GFP_DMA);
-	if (!out) {
-		ret = -ENOMEM;
-		goto abort1;
-	}
+	u8 *out __free(kfree) =
+		kzalloc(fw->size, GFP_KERNEL | GFP_DMA);
+	if (!out)
+		return -ENOMEM;
 
 	spi_message_init(&m);
 	memset(&t, 0, sizeof(t));
@@ -527,7 +518,7 @@ static int wm0010_stage2_load(struct snd_soc_component *component)
 	ret = spi_sync(spi, &m);
 	if (ret != 0) {
 		dev_err(component->dev, "Initial download failed: %d\n", ret);
-		goto abort;
+		return ret;
 	}
 
 	/* Look for errors from the boot ROM */
@@ -536,18 +527,11 @@ static int wm0010_stage2_load(struct snd_soc_component *component)
 			dev_err(component->dev, "Boot ROM error: %x in %d\n",
 				out[i], i);
 			wm0010_mark_boot_failure(wm0010);
-			ret = -EBUSY;
-			goto abort;
+			return -EBUSY;
 		}
 	}
-abort:
-	kfree(out);
-abort1:
-	kfree(img);
-abort2:
-	release_firmware(fw);
 
-	return ret;
+	return 0;
 }
 
 static int wm0010_boot(struct snd_soc_component *component)
-- 
2.55.0

