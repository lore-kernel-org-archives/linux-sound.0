Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E252F3A5443
	for <linux-sound@vger.kernel.org>; Wed, 29 Jul 2026 08:38:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785314313; cv=none; b=pEQrDv/r2NVutctiKWsYQ6kiZ5rS7qv3BIE3ssv49pUNsq9qvhE/j8HK0ETxOvpE9AwyuiThbY24JNUkyu3Y23y1BIOm2Xqdwr8n8MjzdeV6MiQRum37YGXLt9S+uGZ/MfNE2DzgJ+o8fewkgzUESZAqOcIJhEaGlYP/JMuk6ws=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785314313; c=relaxed/simple;
	bh=79WZcgAzcNjnyTzcAceSqsLLImjsOfNlhDNMtIQis0o=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=T8ZdBlUq7krD9Je4T6u0muo3mUIXSu2MQfn1Oe+OXyE8Z4qQ2x8vLYcMLG1yb24EAMoUPsXP/tVks1BM3s5YxkMy7zQ60oPudXiFwHYM5vJcyVoeJ7IQjmuqVivfiApSkQQFQH7q6njkyJI0e7U9agF4cVorPKPikSyznYBf87M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=E1KyAZcU; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=+IEjkQ8g; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=szvYkPKt; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=OYW0qdZu; arc=none smtp.client-ip=195.135.223.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="E1KyAZcU";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="+IEjkQ8g";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="szvYkPKt";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="OYW0qdZu"
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id 30C6E3E25;
	Wed, 29 Jul 2026 08:37:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1785314276; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=HEhATNSii1zooAQYsV60HKxNfLmAaRhtQoHqK+aZHrA=;
	b=E1KyAZcUUg8AiKus8E3ntvp8QunyQqZQLb35mwoN0ESaPJCBCE+xvq7Ui+VxgrYOMgkC+O
	f0dK6IjgS44y4jsQ833jpJoWWr19Pg8xyTWq98sYCrOpE/7h1xmRKGUpF06i7h8ZXZqbGA
	2I6sZm8Y92f7inlXWC4Sm30iSsZr6VY=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1785314276;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=HEhATNSii1zooAQYsV60HKxNfLmAaRhtQoHqK+aZHrA=;
	b=+IEjkQ8gB2QvLc4PafGY2j/uH3Tn64We7HlzjWNxbAGUutlAXaHmi8dsvhRXu1FGgkspah
	QAXcRo4sD/MTEoDg==
Authentication-Results: smtp-out2.suse.de;
	dkim=pass header.d=suse.de header.s=susede2_rsa header.b=szvYkPKt;
	dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=OYW0qdZu
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1785314272; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=HEhATNSii1zooAQYsV60HKxNfLmAaRhtQoHqK+aZHrA=;
	b=szvYkPKtNEz7AkPYdaWWWbRpIborFe9W9UqFYVBh0aSsEr6AiZTlu0phALiVxeqqw+TB5H
	bFWlzhHjPdFVCjFl58COyFUSqqJnrYth5Q5Jv6PHOfhKj+GRyGGIS4ITUF87ZYhvRTpwcg
	8l70KEBFXgWEXZ6VBpMeVdYbPOklvFg=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1785314272;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=HEhATNSii1zooAQYsV60HKxNfLmAaRhtQoHqK+aZHrA=;
	b=OYW0qdZuGeA9WjHeo748Xx0gvVgZmY2amAHpzKh/Zeh0OIgXLRbnS72i+076A+sNFzsN/t
	qjr7ZGgqN8Q9lNCg==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id E4342779D0;
	Wed, 29 Jul 2026 08:37:44 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id qF2HNti7aWqCVwAAD6G6ig
	(envelope-from <tiwai@suse.de>); Wed, 29 Jul 2026 08:37:44 +0000
From: Takashi Iwai <tiwai@suse.de>
To: linux-sound@vger.kernel.org
Subject: [PATCH 11/14] ALSA: korg1212: Use auto-cleanup for firmware loading
Date: Wed, 29 Jul 2026 10:37:29 +0200
Message-ID: <20260729083735.120219-12-tiwai@suse.de>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260729083735.120219-1-tiwai@suse.de>
References: <20260729083735.120219-1-tiwai@suse.de>
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
X-Rspamd-Queue-Id: 30C6E3E25
X-Spamd-Result: default: False [-3.01 / 50.00];
	BAYES_HAM(-3.00)[100.00%];
	MID_CONTAINS_FROM(1.00)[];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	R_MISSING_CHARSET(0.50)[];
	R_DKIM_ALLOW(-0.20)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	NEURAL_HAM_SHORT(-0.20)[-0.999];
	MIME_GOOD(-0.10)[text/plain];
	MX_GOOD(-0.01)[];
	RECEIVED_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:106:10:150:64:167:received];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCPT_COUNT_ONE(0.00)[1];
	ARC_NA(0.00)[];
	RBL_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:mid,suse.de:email,suse.de:dkim,imap1.dmz-prg2.suse.org:helo,imap1.dmz-prg2.suse.org:rdns];
	DNSWL_BLOCKED(0.00)[2a07:de40:b281:106:10:150:64:167:received];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	FROM_EQ_ENVFROM(0.00)[];
	FROM_HAS_DN(0.00)[];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_ALL(0.00)[];
	TO_DN_NONE(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	DKIM_TRACE(0.00)[suse.de:+]
X-Rspamd-Server: rspamd1.dmz-prg2.suse.org
X-Spam-Flag: NO

Simplify the code to manage the firmware loading with __free(firmware)
auto-cleanup.

Only the code refactoring, no functional changes.

Signed-off-by: Takashi Iwai <tiwai@suse.de>
---
 sound/pci/korg1212/korg1212.c | 8 ++------
 1 file changed, 2 insertions(+), 6 deletions(-)

diff --git a/sound/pci/korg1212/korg1212.c b/sound/pci/korg1212/korg1212.c
index d16acf83668a..f4d8402f835f 100644
--- a/sound/pci/korg1212/korg1212.c
+++ b/sound/pci/korg1212/korg1212.c
@@ -1980,7 +1980,7 @@ static int snd_korg1212_create(struct snd_card *card, struct pci_dev *pci)
 	__maybe_unused unsigned ioport_size;
 	__maybe_unused unsigned iomem2_size;
 	struct snd_korg1212 *korg1212 = card->private_data;
-	const struct firmware *dsp_code;
+	const struct firmware *dsp_code __free(firmware) = NULL;
 
 	err = pcim_enable_device(pci);
 	if (err < 0)
@@ -2147,10 +2147,8 @@ static int snd_korg1212_create(struct snd_card *card, struct pci_dev *pci)
 
 	korg1212->dma_dsp = snd_devm_alloc_pages(&pci->dev, SNDRV_DMA_TYPE_DEV,
 						 dsp_code->size);
-	if (!korg1212->dma_dsp) {
-		release_firmware(dsp_code);
+	if (!korg1212->dma_dsp)
 		return -ENOMEM;
-	}
 
         K1212_DEBUG_PRINTK("K1212_DEBUG: DSP Code area = 0x%p (0x%08x) %d bytes [%s]\n",
 		   korg1212->dma_dsp->area, korg1212->dma_dsp->addr, dsp_code->size,
@@ -2158,8 +2156,6 @@ static int snd_korg1212_create(struct snd_card *card, struct pci_dev *pci)
 
 	memcpy(korg1212->dma_dsp->area, dsp_code->data, dsp_code->size);
 
-	release_firmware(dsp_code);
-
 	rc = snd_korg1212_Send1212Command(korg1212, K1212_DB_RebootCard, 0, 0, 0, 0);
 
 	if (rc)
-- 
2.55.0

