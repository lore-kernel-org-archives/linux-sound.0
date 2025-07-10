Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A539D2D5C99
	for <linux-sound@vger.kernel.org>; Thu, 10 Jul 2025 10:11:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752142267; cv=none; b=c6J1LcNo+5k73zw+9GQkXmBI1wwyraV8quHCrpZK3Ekn7HhGm9QNDgkTpVoHLThji4UbYW5ftxI49QtBTL+q3nMe177yTU2xRP1arq3KH9OTLgfh2YKTSaqLFNHRA0bAF4Lemf5V884sXX083zxsy0fVfKfAmUDtvR0/7BVdv6M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752142267; c=relaxed/simple;
	bh=olDZnx6PNUA7RYK7e+8xsTiI5YPDt8PR+KYpya7klSc=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=CS4RhPxwd87yV2nvvLoATh3W0/iGkhrcpeLvvXbEKK3QSLyaY27B8pZdcdWzlRgAmMvGwCExWb1LB0hAi9/elgum9teJ+Ck+CsQwzj9bOTFcTRgbUr4PdpMGdYD/UTkNngyb13DpXugQ3e67YF/71/0Xm5syPIiHKs9N2ggJMrQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=LPUTiMTv; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=U8vAxU/k; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=LPUTiMTv; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=U8vAxU/k; arc=none smtp.client-ip=195.135.223.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="LPUTiMTv";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="U8vAxU/k";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="LPUTiMTv";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="U8vAxU/k"
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id CD5361F770;
	Thu, 10 Jul 2025 10:07:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1752142067; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=rGIE01kMcyNBaDBFM9Fq15Zgu6LOtwION7ReWiLtKFs=;
	b=LPUTiMTvZ+V/gpVqEKaiW3PlD4E1f1LCFFX9AUz+l+tqvWJX6apa1Xg7FwAVG/vpkNt4zT
	7siiSZPSywk25smi7GCOS/9wY0shLXrXaY0sMi4Mlg0bmoy/zEKXhO1PVOljRX1ebc+mnN
	DWKXlTIocoEuqi/nTRlusv3cYwERQFw=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1752142067;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=rGIE01kMcyNBaDBFM9Fq15Zgu6LOtwION7ReWiLtKFs=;
	b=U8vAxU/khyLtBui+R+s+5Dl63IzfMIlgBCQ1uxf9LT9eUR1PegHYBz0RRsP4vvYPN5Wwqw
	Yd95tyqZIkSlqNBg==
Authentication-Results: smtp-out2.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1752142067; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=rGIE01kMcyNBaDBFM9Fq15Zgu6LOtwION7ReWiLtKFs=;
	b=LPUTiMTvZ+V/gpVqEKaiW3PlD4E1f1LCFFX9AUz+l+tqvWJX6apa1Xg7FwAVG/vpkNt4zT
	7siiSZPSywk25smi7GCOS/9wY0shLXrXaY0sMi4Mlg0bmoy/zEKXhO1PVOljRX1ebc+mnN
	DWKXlTIocoEuqi/nTRlusv3cYwERQFw=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1752142067;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=rGIE01kMcyNBaDBFM9Fq15Zgu6LOtwION7ReWiLtKFs=;
	b=U8vAxU/khyLtBui+R+s+5Dl63IzfMIlgBCQ1uxf9LT9eUR1PegHYBz0RRsP4vvYPN5Wwqw
	Yd95tyqZIkSlqNBg==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id B268C136DC;
	Thu, 10 Jul 2025 10:07:47 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id uK82KvOQb2jZWQAAD6G6ig
	(envelope-from <tiwai@suse.de>); Thu, 10 Jul 2025 10:07:47 +0000
From: Takashi Iwai <tiwai@suse.de>
To: linux-sound@vger.kernel.org
Subject: [PATCH 082/103] ALSA: rme9652: Use safer strscpy() instead of strcpy()
Date: Thu, 10 Jul 2025 12:07:04 +0200
Message-ID: <20250710100727.22653-83-tiwai@suse.de>
X-Mailer: git-send-email 2.50.0
In-Reply-To: <20250710100727.22653-1-tiwai@suse.de>
References: <20250710100727.22653-1-tiwai@suse.de>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spamd-Result: default: False [-2.80 / 50.00];
	BAYES_HAM(-3.00)[99.99%];
	MID_CONTAINS_FROM(1.00)[];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	R_MISSING_CHARSET(0.50)[];
	NEURAL_HAM_SHORT(-0.20)[-0.999];
	MIME_GOOD(-0.10)[text/plain];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCPT_COUNT_ONE(0.00)[1];
	FUZZY_RATELIMITED(0.00)[rspamd.com];
	MIME_TRACE(0.00)[0:+];
	ARC_NA(0.00)[];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	DBL_BLOCKED_OPENRESOLVER(0.00)[imap1.dmz-prg2.suse.org:helo,suse.de:mid,suse.de:email];
	FROM_EQ_ENVFROM(0.00)[];
	FROM_HAS_DN(0.00)[];
	R_RATELIMIT(0.00)[to_ip_from(RLsqo7dymd5dgmoaprf5rep8is)];
	RCVD_COUNT_TWO(0.00)[2];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	TO_DN_NONE(0.00)[];
	RCVD_TLS_ALL(0.00)[]
X-Spam-Flag: NO
X-Spam-Level: 
X-Spam-Score: -2.80

Use a safer function strscpy() instead of strcpy() for copying to
arrays.

Only idiomatic code replacement, and no functional changes.

Signed-off-by: Takashi Iwai <tiwai@suse.de>
---
 sound/pci/rme9652/rme9652.c | 12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)

diff --git a/sound/pci/rme9652/rme9652.c b/sound/pci/rme9652/rme9652.c
index 34d9c7995ddd..7dc8e3777c37 100644
--- a/sound/pci/rme9652/rme9652.c
+++ b/sound/pci/rme9652/rme9652.c
@@ -2364,7 +2364,7 @@ static int snd_rme9652_create_pcm(struct snd_card *card,
 
 	rme9652->pcm = pcm;
 	pcm->private_data = rme9652;
-	strcpy(pcm->name, rme9652->card_name);
+	strscpy(pcm->name, rme9652->card_name);
 
 	snd_pcm_set_ops(pcm, SNDRV_PCM_STREAM_PLAYBACK, &snd_rme9652_playback_ops);
 	snd_pcm_set_ops(pcm, SNDRV_PCM_STREAM_CAPTURE, &snd_rme9652_capture_ops);
@@ -2447,7 +2447,7 @@ static int snd_rme9652_create(struct snd_card *card,
 
 	switch (rev) {
 	case 8: /* original eprom */
-		strcpy(card->driver, "RME9636");
+		strscpy(card->driver, "RME9636");
 		if (rme9652->hw_rev == 15) {
 			rme9652->card_name = "RME Digi9636 (Rev 1.5)";
 		} else {
@@ -2456,17 +2456,17 @@ static int snd_rme9652_create(struct snd_card *card,
 		rme9652->ss_channels = RME9636_NCHANNELS;
 		break;
 	case 9: /* W36_G EPROM */
-		strcpy(card->driver, "RME9636");
+		strscpy(card->driver, "RME9636");
 		rme9652->card_name = "RME Digi9636 (Rev G)";
 		rme9652->ss_channels = RME9636_NCHANNELS;
 		break;
 	case 4: /* W52_G EPROM */
-		strcpy(card->driver, "RME9652");
+		strscpy(card->driver, "RME9652");
 		rme9652->card_name = "RME Digi9652 (Rev G)";
 		rme9652->ss_channels = RME9652_NCHANNELS;
 		break;
 	case 3: /* original eprom */
-		strcpy(card->driver, "RME9652");
+		strscpy(card->driver, "RME9652");
 		if (rme9652->hw_rev == 15) {
 			rme9652->card_name = "RME Digi9652 (Rev 1.5)";
 		} else {
@@ -2539,7 +2539,7 @@ static int snd_rme9652_probe(struct pci_dev *pci,
 	if (err)
 		goto error;
 
-	strcpy(card->shortname, rme9652->card_name);
+	strscpy(card->shortname, rme9652->card_name);
 
 	sprintf(card->longname, "%s at 0x%lx, irq %d",
 		card->shortname, rme9652->port, rme9652->irq);
-- 
2.50.0

