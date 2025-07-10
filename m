Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AB8B22D5A0D
	for <linux-sound@vger.kernel.org>; Thu, 10 Jul 2025 10:09:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752142174; cv=none; b=oaHPI1/WnnTHaIuuI9JgBKumCs4jX6G0Z3dqT/9OyzHocn0C//+cy4i+0GPyjcBnnfc7jZ/6JqWHGeCsYmhYTaQE1xOGMleSAoez1K+6mAhvJ+ce+WgMUrUgLuqg4RYGXdLsw7GdLH5droifhiUa/oH3vzLTBhoqcadD5tJ0JSw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752142174; c=relaxed/simple;
	bh=d8krcxyzy21HbLgvbHHxEckrHqD1wihWexTMCLHaGQo=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=HvIvDjyXi5o5LP8dPyagJRPbtMAscEdbJMoenAMosHctyhL3ehqkpAQc4K4UW4FrrriD3LsJJgefH22Z/S6GRQO4/1n6JMsbE13cycyEu7DLk9Lm8PQ1Wyg5urNZIeZ008p++eJHq7yyNNCOCXhX/VHJbQnd2AlOKeP9PrcGq8A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=FNV2zbBl; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=lzyyvaCI; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=FNV2zbBl; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=lzyyvaCI; arc=none smtp.client-ip=195.135.223.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="FNV2zbBl";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="lzyyvaCI";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="FNV2zbBl";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="lzyyvaCI"
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id E77481F6E6;
	Thu, 10 Jul 2025 10:07:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1752142063; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=futx1QMMBCH2rX/wKQsK4GQPTTnwSvMmsycF81goYVQ=;
	b=FNV2zbBlmoFn5h3dNTYboaku5II3BZv02JABuQLF0i1OZbJERU/KyWgATNDLVa/VZZlUWO
	7UQFeHhlEtrplg+B0WvgcYflaCZn8Gg6uUm3vN0VViAU3t02In/wXsmhhXnUI6GN6Teuey
	ACGpgqXJ2WMOrWKJRpkRLsQVgGtxN3c=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1752142063;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=futx1QMMBCH2rX/wKQsK4GQPTTnwSvMmsycF81goYVQ=;
	b=lzyyvaCIKlfZvzrdkK+ModbjzCcKjAFSsYDYFa5MiZaRwJv1fiDYx5ta6/cw9YkLimhK/N
	1I5/RYNvQ/eqNyBA==
Authentication-Results: smtp-out2.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1752142063; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=futx1QMMBCH2rX/wKQsK4GQPTTnwSvMmsycF81goYVQ=;
	b=FNV2zbBlmoFn5h3dNTYboaku5II3BZv02JABuQLF0i1OZbJERU/KyWgATNDLVa/VZZlUWO
	7UQFeHhlEtrplg+B0WvgcYflaCZn8Gg6uUm3vN0VViAU3t02In/wXsmhhXnUI6GN6Teuey
	ACGpgqXJ2WMOrWKJRpkRLsQVgGtxN3c=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1752142063;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=futx1QMMBCH2rX/wKQsK4GQPTTnwSvMmsycF81goYVQ=;
	b=lzyyvaCIKlfZvzrdkK+ModbjzCcKjAFSsYDYFa5MiZaRwJv1fiDYx5ta6/cw9YkLimhK/N
	1I5/RYNvQ/eqNyBA==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id CE73C136DC;
	Thu, 10 Jul 2025 10:07:43 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id QDI5Me+Qb2jZWQAAD6G6ig
	(envelope-from <tiwai@suse.de>); Thu, 10 Jul 2025 10:07:43 +0000
From: Takashi Iwai <tiwai@suse.de>
To: linux-sound@vger.kernel.org
Subject: [PATCH 054/103] ALSA: cmipci: Use safer strscpy() instead of strcpy()
Date: Thu, 10 Jul 2025 12:06:36 +0200
Message-ID: <20250710100727.22653-55-tiwai@suse.de>
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
	BAYES_HAM(-3.00)[100.00%];
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
 sound/pci/cmipci.c | 14 +++++++-------
 1 file changed, 7 insertions(+), 7 deletions(-)

diff --git a/sound/pci/cmipci.c b/sound/pci/cmipci.c
index b00df0a60d3f..9056214e9cda 100644
--- a/sound/pci/cmipci.c
+++ b/sound/pci/cmipci.c
@@ -1868,7 +1868,7 @@ static int snd_cmipci_pcm_new(struct cmipci *cm, int device)
 
 	pcm->private_data = cm;
 	pcm->info_flags = 0;
-	strcpy(pcm->name, "C-Media PCI DAC/ADC");
+	strscpy(pcm->name, "C-Media PCI DAC/ADC");
 	cm->pcm = pcm;
 
 	snd_pcm_set_managed_buffer_all(pcm, SNDRV_DMA_TYPE_DEV,
@@ -1890,7 +1890,7 @@ static int snd_cmipci_pcm2_new(struct cmipci *cm, int device)
 
 	pcm->private_data = cm;
 	pcm->info_flags = 0;
-	strcpy(pcm->name, "C-Media PCI 2nd DAC");
+	strscpy(pcm->name, "C-Media PCI 2nd DAC");
 	cm->pcm2 = pcm;
 
 	snd_pcm_set_managed_buffer_all(pcm, SNDRV_DMA_TYPE_DEV,
@@ -1913,7 +1913,7 @@ static int snd_cmipci_pcm_spdif_new(struct cmipci *cm, int device)
 
 	pcm->private_data = cm;
 	pcm->info_flags = 0;
-	strcpy(pcm->name, "C-Media PCI IEC958");
+	strscpy(pcm->name, "C-Media PCI IEC958");
 	cm->pcm_spdif = pcm;
 
 	snd_pcm_set_managed_buffer_all(pcm, SNDRV_DMA_TYPE_DEV,
@@ -2633,7 +2633,7 @@ static int snd_cmipci_mixer_new(struct cmipci *cm, int pcm_spdif_device)
 
 	card = cm->card;
 
-	strcpy(card->mixername, "CMedia PCI");
+	strscpy(card->mixername, "CMedia PCI");
 
 	spin_lock_irq(&cm->reg_lock);
 	snd_cmipci_mixer_write(cm, 0x00, 0x00);		/* mixer reset */
@@ -3216,14 +3216,14 @@ static int snd_cmipci_probe(struct pci_dev *pci,
 	switch (pci->device) {
 	case PCI_DEVICE_ID_CMEDIA_CM8738:
 	case PCI_DEVICE_ID_CMEDIA_CM8738B:
-		strcpy(card->driver, "CMI8738");
+		strscpy(card->driver, "CMI8738");
 		break;
 	case PCI_DEVICE_ID_CMEDIA_CM8338A:
 	case PCI_DEVICE_ID_CMEDIA_CM8338B:
-		strcpy(card->driver, "CMI8338");
+		strscpy(card->driver, "CMI8338");
 		break;
 	default:
-		strcpy(card->driver, "CMIPCI");
+		strscpy(card->driver, "CMIPCI");
 		break;
 	}
 
-- 
2.50.0

