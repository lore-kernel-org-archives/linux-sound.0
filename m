Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D38462D5C8D
	for <linux-sound@vger.kernel.org>; Thu, 10 Jul 2025 10:10:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752142255; cv=none; b=laFJr+1ljNdPNYE20p4gRlNbt8UbOxSRpssBlRx6GgUYJhWNE/PU1/9YNRBJ5f/bXpccq2KHthUqjW+ddAQHTsL1OhBDKlE5cRs8zIxhnHxgKnvHTHGeIsv8VwDse82vaDlJfSazM2W0gn8kNZHizoUVlEY8uVnFprw617IPaHA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752142255; c=relaxed/simple;
	bh=IMjfgBYgMH2kXJMgKUXcIs4OKz1Xsn6arujanXYzcmY=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=lBFTWAzt1G6Kelh/jcah3vlSs6CvM2qzq15+vTOlSDLiBHGyAiHAFcslu4Q7cAWVvhnpL/K7RJ+ROUz455kAwk+MhsQoYYKFMSp0TVLyPvsrpbkiNi7e8l5v0+fYadaU0SXhMA7JQFdRGkjX25kIxOIs/16mfhPwo01+XqLUc2M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=LhmrNYeH; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=xn9smvAv; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=LhmrNYeH; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=xn9smvAv; arc=none smtp.client-ip=195.135.223.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="LhmrNYeH";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="xn9smvAv";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="LhmrNYeH";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="xn9smvAv"
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id 8DB991F76B;
	Thu, 10 Jul 2025 10:07:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1752142067; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=W/HlIqA/Ul+X+QA199+hdIrQBMSTgzZ/MkYnUIfSxFI=;
	b=LhmrNYeHemNoKMzSntj9egRdJyjT9fkVU/gFatFbZzUO6qlfHkmG4O+nbfu1rzHXQSQvYb
	yUadZh6zVv0MEZ+8zbGLOQmnra2dMAaaSUU8e/34Lgp4/kOQRpG80z90m3cr39trmla/Jf
	YDbc6+/vREdcwaMcMb18TtE3khvHt+A=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1752142067;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=W/HlIqA/Ul+X+QA199+hdIrQBMSTgzZ/MkYnUIfSxFI=;
	b=xn9smvAvlaPQe5NENpmeuOmKY7tnigs9z4QkDsvuXM8el/UChGwxM3kApD4E6U0M7Uwk2W
	LEVIHnPcz0aG7hDg==
Authentication-Results: smtp-out2.suse.de;
	dkim=pass header.d=suse.de header.s=susede2_rsa header.b=LhmrNYeH;
	dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=xn9smvAv
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1752142067; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=W/HlIqA/Ul+X+QA199+hdIrQBMSTgzZ/MkYnUIfSxFI=;
	b=LhmrNYeHemNoKMzSntj9egRdJyjT9fkVU/gFatFbZzUO6qlfHkmG4O+nbfu1rzHXQSQvYb
	yUadZh6zVv0MEZ+8zbGLOQmnra2dMAaaSUU8e/34Lgp4/kOQRpG80z90m3cr39trmla/Jf
	YDbc6+/vREdcwaMcMb18TtE3khvHt+A=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1752142067;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=W/HlIqA/Ul+X+QA199+hdIrQBMSTgzZ/MkYnUIfSxFI=;
	b=xn9smvAvlaPQe5NENpmeuOmKY7tnigs9z4QkDsvuXM8el/UChGwxM3kApD4E6U0M7Uwk2W
	LEVIHnPcz0aG7hDg==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 754E7136DC;
	Thu, 10 Jul 2025 10:07:47 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id UKpxG/OQb2jZWQAAD6G6ig
	(envelope-from <tiwai@suse.de>); Thu, 10 Jul 2025 10:07:47 +0000
From: Takashi Iwai <tiwai@suse.de>
To: linux-sound@vger.kernel.org
Subject: [PATCH 080/103] ALSA: hdsp: Use safer strscpy() instead of strcpy()
Date: Thu, 10 Jul 2025 12:07:02 +0200
Message-ID: <20250710100727.22653-81-tiwai@suse.de>
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
X-Spamd-Result: default: False [-3.01 / 50.00];
	BAYES_HAM(-3.00)[99.99%];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	R_DKIM_ALLOW(-0.20)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	MX_GOOD(-0.01)[];
	ARC_NA(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	RCPT_COUNT_ONE(0.00)[1];
	MIME_TRACE(0.00)[0:+];
	RBL_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	FUZZY_RATELIMITED(0.00)[rspamd.com];
	FROM_HAS_DN(0.00)[];
	RECEIVED_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:106:10:150:64:167:received];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:mid,suse.de:dkim,suse.de:email,imap1.dmz-prg2.suse.org:helo,imap1.dmz-prg2.suse.org:rdns];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	TO_DN_NONE(0.00)[];
	RCVD_TLS_ALL(0.00)[];
	FROM_EQ_ENVFROM(0.00)[];
	R_RATELIMIT(0.00)[to_ip_from(RLe1mc1hwayk397878n5a1j337)];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	DKIM_TRACE(0.00)[suse.de:+]
X-Spam-Flag: NO
X-Spam-Level: 
X-Rspamd-Queue-Id: 8DB991F76B
X-Rspamd-Server: rspamd2.dmz-prg2.suse.org
X-Rspamd-Action: no action
X-Spam-Score: -3.01

Use a safer function strscpy() instead of strcpy() for copying to
arrays.

Only idiomatic code replacement, and no functional changes.

Signed-off-by: Takashi Iwai <tiwai@suse.de>
---
 sound/pci/rme9652/hdsp.c | 12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)

diff --git a/sound/pci/rme9652/hdsp.c b/sound/pci/rme9652/hdsp.c
index 8df0f5bba0f6..7ce73746168a 100644
--- a/sound/pci/rme9652/hdsp.c
+++ b/sound/pci/rme9652/hdsp.c
@@ -4944,7 +4944,7 @@ static int snd_hdsp_create_hwdep(struct snd_card *card, struct hdsp *hdsp)
 
 	hdsp->hwdep = hw;
 	hw->private_data = hdsp;
-	strcpy(hw->name, "HDSP hwdep interface");
+	strscpy(hw->name, "HDSP hwdep interface");
 
 	hw->ops.ioctl = snd_hdsp_hwdep_ioctl;
 	hw->ops.ioctl_compat = snd_hdsp_hwdep_ioctl;
@@ -4963,7 +4963,7 @@ static int snd_hdsp_create_pcm(struct snd_card *card, struct hdsp *hdsp)
 
 	hdsp->pcm = pcm;
 	pcm->private_data = hdsp;
-	strcpy(pcm->name, hdsp->card_name);
+	strscpy(pcm->name, hdsp->card_name);
 
 	snd_pcm_set_ops(pcm, SNDRV_PCM_STREAM_PLAYBACK, &snd_hdsp_playback_ops);
 	snd_pcm_set_ops(pcm, SNDRV_PCM_STREAM_CAPTURE, &snd_hdsp_capture_ops);
@@ -5111,7 +5111,7 @@ static int snd_hdsp_create_alsa_devices(struct snd_card *card, struct hdsp *hdsp
 	}
 
 	if (!(hdsp->state & HDSP_InitializationComplete)) {
-		strcpy(card->shortname, "Hammerfall DSP");
+		strscpy(card->shortname, "Hammerfall DSP");
 		sprintf(card->longname, "%s at 0x%lx, irq %d", hdsp->card_name,
 			hdsp->port, hdsp->irq);
 
@@ -5255,8 +5255,8 @@ static int snd_hdsp_create(struct snd_card *card,
 	*/
 	pci_write_config_byte(hdsp->pci, PCI_LATENCY_TIMER, 0xFF);
 
-	strcpy(card->driver, "H-DSP");
-	strcpy(card->mixername, "Xilinx FPGA");
+	strscpy(card->driver, "H-DSP");
+	strscpy(card->mixername, "Xilinx FPGA");
 
 	if (hdsp->firmware_rev < 0xa)
 		return -ENODEV;
@@ -5412,7 +5412,7 @@ static int snd_hdsp_probe(struct pci_dev *pci,
 	if (err)
 		goto error;
 
-	strcpy(card->shortname, "Hammerfall DSP");
+	strscpy(card->shortname, "Hammerfall DSP");
 	sprintf(card->longname, "%s at 0x%lx, irq %d", hdsp->card_name,
 		hdsp->port, hdsp->irq);
 	err = snd_card_register(card);
-- 
2.50.0

