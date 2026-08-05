Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 24607472F89
	for <linux-sound@vger.kernel.org>; Wed,  5 Aug 2026 13:53:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785938009; cv=none; b=NUTgLIP9j4Wo1wizw7vk0JzKNBagyc4c/pOWsDWyRLMWr1n8aGK/mz+3lJX00nDjzsXVbVXc7GlP/cSaPBAF6Bk7VQhyLaiCRSMvUzYNNWuNwdiPK+7gKraoQL9VP7WhTMnYFuiVIBRysUsAA9O8llYYW7NsgYNiw76crRP1700=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785938009; c=relaxed/simple;
	bh=bUIlA1j/c7J4L2B/cFo+bk0YM0RRTD1udMbxaG0wdrc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=nhDOrAW+zzEV01LZDofIUWygLY8bXwILLRpCOw0cWKWn4GAiyt588nMUHRe4EA22d9fLQZNN6g/Jw6mFPlbxLKuzBm+jYthso+nqZ8RLQiMjeSK8DvlVrm2ZNwF3qLKgCm64pQnWnj11cdzCXI8G3IFgLat0vQv5TNkeCLqGIjI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=svi6xfee; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=/6wcZGUi; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=PHGjcBje; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=wuSe15M+; arc=none smtp.client-ip=195.135.223.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="svi6xfee";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="/6wcZGUi";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="PHGjcBje";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="wuSe15M+"
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id 63ECF7F104;
	Wed,  5 Aug 2026 13:53:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1785937996; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=jeeBBoUPCawS0nYliLsGGGekxoLdt3PcvU3RFDUdENg=;
	b=svi6xfeeDSy639gEIxWyrEJfZx9CYGopAmpd7V/KDPa6NssQORi2Ip9TfHpKcQBP5Zu1yf
	7L5cfSvqaBNU7XxKUz98Fqy6cPT6nuv2fuR8hM5TU4ZYJ3SZNrC4mxCFmKWLx0FX6QMEjY
	G2fUqSVwQXB35ZVeFIZTIhnD7Hnldas=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1785937996;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=jeeBBoUPCawS0nYliLsGGGekxoLdt3PcvU3RFDUdENg=;
	b=/6wcZGUijdjH6V1eiWlm5DvnTjOjHlwNtVAaB+nnmI3IVqW0PNSmXGVrBb8tPwaa9k/jDL
	vbQ3mwK5YEfGY3Bg==
Authentication-Results: smtp-out1.suse.de;
	dkim=pass header.d=suse.de header.s=susede2_rsa header.b=PHGjcBje;
	dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=wuSe15M+
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1785937992; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=jeeBBoUPCawS0nYliLsGGGekxoLdt3PcvU3RFDUdENg=;
	b=PHGjcBjeyT1s/ErW9bVGDeqJi667MvlILvFAsKN1groHT8PiOwBM1ufrIKRJ8wmvhnvbWc
	jFtzdKaFSgcQk6E8hOhBVdgOdA3eXoYLmWkl6OhQuUYsqpML/DK6iKabhSgLYbfMW8jnRm
	TNw4r0zG8Nw4usfx+lm6pwbxSW1cq6o=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1785937992;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=jeeBBoUPCawS0nYliLsGGGekxoLdt3PcvU3RFDUdENg=;
	b=wuSe15M+mkaHEgG4u+mB02yRmEhwYQ9WtQ22IAKm45ujQFmeIm7iKhLODoxA9lZH8rgdxB
	4DJOTxaQ0f2iSpDA==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 61C4B77A02;
	Wed,  5 Aug 2026 13:52:59 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id gFmwFjtAc2ouSQAAD6G6ig
	(envelope-from <tiwai@suse.de>); Wed, 05 Aug 2026 13:52:59 +0000
From: Takashi Iwai <tiwai@suse.de>
To: Mark Brown <broonie@kernel.org>
Cc: linux-sound@vger.kernel.org,
	Shengjiu Wang <shengjiu.wang@gmail.com>,
	Xiubo Li <Xiubo.Lee@gmail.com>,
	Fabio Estevam <festevam@gmail.com>,
	Nicolin Chen <nicoleotsuka@gmail.com>
Subject: [PATCH 25/31] ASoC: fsl: Use auto-cleanup for firmware loading
Date: Wed,  5 Aug 2026 15:52:26 +0200
Message-ID: <20260805135247.670693-26-tiwai@suse.de>
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
	MIME_TRACE(0.00)[0:+];
	SPAMHAUS_XBL(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	TO_DN_SOME(0.00)[];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	ARC_NA(0.00)[];
	RCVD_TLS_ALL(0.00)[];
	RCPT_COUNT_FIVE(0.00)[6];
	RCVD_COUNT_TWO(0.00)[2];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:email,suse.de:mid,suse.de:dkim,imap1.dmz-prg2.suse.org:rdns,imap1.dmz-prg2.suse.org:helo];
	FROM_EQ_ENVFROM(0.00)[];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_CC(0.00)[vger.kernel.org,gmail.com];
	DNSWL_BLOCKED(0.00)[2a07:de40:b281:106:10:150:64:167:received];
	TAGGED_RCPT(0.00)[];
	DWL_DNSWL_BLOCKED(0.00)[suse.de:dkim];
	DKIM_TRACE(0.00)[suse.de:+];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FREEMAIL_ENVRCPT(0.00)[gmail.com]
X-Spam-Flag: NO
X-Spam-Score: -1.51
X-Spam-Level: 
X-Rspamd-Queue-Id: 63ECF7F104
X-Rspamd-Server: rspamd2.dmz-prg2.suse.org
X-Rspamd-Action: no action

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

