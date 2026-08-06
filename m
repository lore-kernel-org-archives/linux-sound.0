Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DA5083AFD1A
	for <linux-sound@vger.kernel.org>; Thu,  6 Aug 2026 14:00:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786024838; cv=none; b=efdjua0QLpHoTOqbcQZ6lzRVgzltz5C5Um0FSE9+eQJeZSMMxjv9NpA6WSUp5v2HR6z6A6KQIeh04rNlfK+g3NgVsAG3oxsdVLMvaTlzUroh8ahw22BysQvuP5YGCbxYbVRh8y7c4vTCPYQdYDA2a51fxWD7/cDLwNDwPb0ggLY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786024838; c=relaxed/simple;
	bh=bUIlA1j/c7J4L2B/cFo+bk0YM0RRTD1udMbxaG0wdrc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=WHf/W2wct/OjqAShTq+usAiSumCYA0oZQWMhihnCM6lWiZSFEK5Ry0e7RsbVQonBK4R52aFWwyIBXkKNcpbCIVS7ZMYD0FdH28IFqPUpYzcJJKri4/C0seADJXrgz2Ne0XuYYWA2iOoemIJf3IPHu0XyE7yh9ltyg4RG73tXDVc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=Rb9hi8Nu; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=8/xn3z49; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=I2kVZix0; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=1/a9Wmgv; arc=none smtp.client-ip=195.135.223.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="Rb9hi8Nu";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="8/xn3z49";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="I2kVZix0";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="1/a9Wmgv"
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id DDD0E800DE;
	Thu,  6 Aug 2026 14:00:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1786024831; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=jeeBBoUPCawS0nYliLsGGGekxoLdt3PcvU3RFDUdENg=;
	b=Rb9hi8Nu5P7ONY+VFVErEntWJXBCarYn+k18HYzHz0ej0GoMwAkZm7PBO0NnH4R0A5/MLX
	qd9c0Q12PuWclVimEet/dCOo+iJyzMhuvjfXI41+mi+yUwOtsSjyWMtE7G9SD8J6bjW+o/
	whITVhmy0nkXeCeNNjsh4pNO9AqH7zs=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1786024831;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=jeeBBoUPCawS0nYliLsGGGekxoLdt3PcvU3RFDUdENg=;
	b=8/xn3z497TBo7B2VJGtT852IwGEsFlUNeCpNPrpR29fi1teyWM2P8h4SmPy4Xza8wxf+nm
	wc2kwUp2+oajO9AQ==
Authentication-Results: smtp-out1.suse.de;
	dkim=pass header.d=suse.de header.s=susede2_rsa header.b=I2kVZix0;
	dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b="1/a9Wmgv"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1786024826; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=jeeBBoUPCawS0nYliLsGGGekxoLdt3PcvU3RFDUdENg=;
	b=I2kVZix0Uq8CiyQxKyUtOsabpi6eLWmedO/MHJyEUlewsjT2PhW56w2XtwEnU6ya2n+RUo
	VSmvM7uqRib4UsmBIuCQb31ejCGK6NkDgd/IgHWrjsc3y19GS01O+f/ogsAMi7Fzmb7LNn
	5XWT8Sx8MkN4AH93MlHEx/93d9lBZ+0=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1786024826;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=jeeBBoUPCawS0nYliLsGGGekxoLdt3PcvU3RFDUdENg=;
	b=1/a9WmgvWbv+HM3dH2GkSpc/oRBuVy8uXgMtKxBHchRZyr+6SFPICEpBUN/CwKxDqLFds5
	+94KXR05b/YKDBBQ==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 765BF77A24;
	Thu,  6 Aug 2026 14:00:15 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id YDdhG2+TdGqbOwAAD6G6ig
	(envelope-from <tiwai@suse.de>); Thu, 06 Aug 2026 14:00:15 +0000
From: Takashi Iwai <tiwai@suse.de>
To: Mark Brown <broonie@kernel.org>
Cc: linux-sound@vger.kernel.org,
	Shengjiu Wang <shengjiu.wang@gmail.com>,
	Xiubo Li <Xiubo.Lee@gmail.com>,
	Fabio Estevam <festevam@gmail.com>,
	Nicolin Chen <nicoleotsuka@gmail.com>
Subject: [PATCH v2 25/31] ASoC: fsl: Use auto-cleanup for firmware loading
Date: Thu,  6 Aug 2026 15:59:57 +0200
Message-ID: <20260806140006.1412298-26-tiwai@suse.de>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260806140006.1412298-1-tiwai@suse.de>
References: <20260806140006.1412298-1-tiwai@suse.de>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Score: -1.51
X-Spam-Level: 
X-Rspamd-Action: no action
X-Rspamd-Queue-Id: DDD0E800DE
X-Spamd-Result: default: False [-1.51 / 50.00];
	BAYES_HAM(-3.00)[100.00%];
	SUSPICIOUS_RECIPS(1.50)[];
	MID_CONTAINS_FROM(1.00)[];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	R_MISSING_CHARSET(0.50)[];
	R_DKIM_ALLOW(-0.20)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	MX_GOOD(-0.01)[];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	TO_DN_SOME(0.00)[];
	RBL_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	MIME_TRACE(0.00)[0:+];
	ARC_NA(0.00)[];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	FREEMAIL_CC(0.00)[vger.kernel.org,gmail.com];
	RCVD_TLS_ALL(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	FROM_EQ_ENVFROM(0.00)[];
	FROM_HAS_DN(0.00)[];
	RCPT_COUNT_FIVE(0.00)[6];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:mid,suse.de:email,suse.de:dkim,imap1.dmz-prg2.suse.org:helo,imap1.dmz-prg2.suse.org:rdns];
	TAGGED_RCPT(0.00)[];
	RECEIVED_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:106:10:150:64:167:received];
	DKIM_TRACE(0.00)[suse.de:+];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FREEMAIL_ENVRCPT(0.00)[gmail.com]
X-Rspamd-Server: rspamd1.dmz-prg2.suse.org
X-Spam-Flag: NO

Simplify the code to manage the firmware loading with __free(firmware)
auto-cleanup.

Only the code refactoring, no functional changes.

Cc: Shengjiu Wang <shengjiu.wang@gmail.com>
Cc: Xiubo Li <Xiubo.Lee@gmail.com>
Cc: Fabio Estevam <festevam@gmail.com>
Cc: Nicolin Chen <nicoleotsuka@gmail.com>
Signed-off-by: Takashi Iwai <tiwai@suse.de>
---
 sound/soc/fsl/fsl_xcvr.c | 10 ++--------
 1 file changed, 2 insertions(+), 8 deletions(-)

diff --git a/sound/soc/fsl/fsl_xcvr.c b/sound/soc/fsl/fsl_xcvr.c
index 41d100500534..982827204351 100644
--- a/sound/soc/fsl/fsl_xcvr.c
+++ b/sound/soc/fsl/fsl_xcvr.c
@@ -921,10 +921,10 @@ static int fsl_xcvr_trigger(struct snd_pcm_substream *substream, int cmd,
 static int fsl_xcvr_load_firmware(struct fsl_xcvr *xcvr)
 {
 	struct device *dev = &xcvr->pdev->dev;
-	const struct firmware *fw;
 	int ret = 0, rem, off, out, page = 0, size = FSL_XCVR_REG_OFFSET;
 	u32 mask, val;
 
+	const struct firmware *fw __free(firmware) = NULL;
 	ret = request_firmware(&fw, xcvr->soc_data->fw_name, dev);
 	if (ret) {
 		dev_err(dev, "failed to request firmware.\n");
@@ -936,7 +936,6 @@ static int fsl_xcvr_load_firmware(struct fsl_xcvr *xcvr)
 	/* RAM is 20KiB = 16KiB code + 4KiB data => max 10 pages 2KiB each */
 	if (rem > 16384) {
 		dev_err(dev, "FW size %d is bigger than 16KiB.\n", rem);
-		release_firmware(fw);
 		return -ENOMEM;
 	}
 
@@ -947,7 +946,7 @@ static int fsl_xcvr_load_firmware(struct fsl_xcvr *xcvr)
 		if (ret < 0) {
 			dev_err(dev, "FW: failed to set page %d, err=%d\n",
 				page, ret);
-			goto err_firmware;
+			return ret;
 		}
 
 		off = page * size;
@@ -968,11 +967,6 @@ static int fsl_xcvr_load_firmware(struct fsl_xcvr *xcvr)
 		}
 	}
 
-err_firmware:
-	release_firmware(fw);
-	if (ret < 0)
-		return ret;
-
 	/* configure watermarks */
 	mask = FSL_XCVR_EXT_CTRL_RX_FWM_MASK | FSL_XCVR_EXT_CTRL_TX_FWM_MASK;
 	val  = FSL_XCVR_EXT_CTRL_RX_FWM(FSL_XCVR_FIFO_WMK_RX);
-- 
2.55.0

