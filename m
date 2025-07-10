Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 503712D9796
	for <linux-sound@vger.kernel.org>; Thu, 10 Jul 2025 10:12:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752142371; cv=none; b=G/veVe70/Loe9v1oQtLR5efh9QIGCtRiBhWDAy+SajL3Qk72Pu+vvvZ8OLNFhpEPc0Clw4Dl5WE8cef7UbnaJr5FoiM+3fBRhU7ltT+kXCM7pNyniUvs+WffqYUITYg0sMgx7eE3wJfW1fCp/bGC3hxA0AVah0k8EMkhrHVmb3c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752142371; c=relaxed/simple;
	bh=QRsu5lzQ1EhnkXrTVlvlI1lv53/WfBjKDKf0+DQyLq8=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=LF5j53OknpdefexqlA2p+LxknExtkTcKk40bPECciHRgpmDzJkRiRJsb0h80ZLfspNCJD4ZnBMyvh5BUeQry5ikOYU2l37Gr8f1SAt+BpO77G6Q59xdeGHtQN3gQkabKFmp8BEW9BdKJXsJ33N+ycn8q9y6fZ+Wxy5xT5BSCDLs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=YRRnU1fj; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=ElyBIsDh; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=YRRnU1fj; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=ElyBIsDh; arc=none smtp.client-ip=195.135.223.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="YRRnU1fj";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="ElyBIsDh";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="YRRnU1fj";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="ElyBIsDh"
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id 51E4C211B8;
	Thu, 10 Jul 2025 10:07:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1752142068; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=ldj1l35LnO8z4/hW5nRqynVT2HamuwSfFakv1M3sPZE=;
	b=YRRnU1fjAPWU/VDbTxGK9Ciz/RMPm3bVusBVLlweDYsDX2WSec5V3nqEz8D2YEj42I9Jyh
	sdYBFF8fYtT40G72BssIFIa7qxEFRdpSXcGOsgaMqYHv5QOCr1nAl5bCIMo5GRH5ojXmjz
	q4+jxk491lmcS9I4rpf8WDqJ7pAFPZg=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1752142068;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=ldj1l35LnO8z4/hW5nRqynVT2HamuwSfFakv1M3sPZE=;
	b=ElyBIsDhk8qrVDP13uZTL5E0zmJNKLTNhOT8wbznMmEni/QnB2UUIvzZLM/59dn9L0l4ng
	x7bnIlXqossAE1CA==
Authentication-Results: smtp-out1.suse.de;
	dkim=pass header.d=suse.de header.s=susede2_rsa header.b=YRRnU1fj;
	dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=ElyBIsDh
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1752142068; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=ldj1l35LnO8z4/hW5nRqynVT2HamuwSfFakv1M3sPZE=;
	b=YRRnU1fjAPWU/VDbTxGK9Ciz/RMPm3bVusBVLlweDYsDX2WSec5V3nqEz8D2YEj42I9Jyh
	sdYBFF8fYtT40G72BssIFIa7qxEFRdpSXcGOsgaMqYHv5QOCr1nAl5bCIMo5GRH5ojXmjz
	q4+jxk491lmcS9I4rpf8WDqJ7pAFPZg=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1752142068;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=ldj1l35LnO8z4/hW5nRqynVT2HamuwSfFakv1M3sPZE=;
	b=ElyBIsDhk8qrVDP13uZTL5E0zmJNKLTNhOT8wbznMmEni/QnB2UUIvzZLM/59dn9L0l4ng
	x7bnIlXqossAE1CA==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 3825C13A70;
	Thu, 10 Jul 2025 10:07:48 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id 4PBoDPSQb2jZWQAAD6G6ig
	(envelope-from <tiwai@suse.de>); Thu, 10 Jul 2025 10:07:48 +0000
From: Takashi Iwai <tiwai@suse.de>
To: linux-sound@vger.kernel.org
Subject: [PATCH 085/103] ALSA: trident: Use safer strscpy() instead of strcpy()
Date: Thu, 10 Jul 2025 12:07:07 +0200
Message-ID: <20250710100727.22653-86-tiwai@suse.de>
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[imap1.dmz-prg2.suse.org:helo,imap1.dmz-prg2.suse.org:rdns,suse.de:mid,suse.de:dkim,suse.de:email];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	TO_DN_NONE(0.00)[];
	RCVD_TLS_ALL(0.00)[];
	FROM_EQ_ENVFROM(0.00)[];
	R_RATELIMIT(0.00)[to_ip_from(RLe1mc1hwayk397878n5a1j337)];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	DKIM_TRACE(0.00)[suse.de:+]
X-Spam-Flag: NO
X-Spam-Level: 
X-Rspamd-Queue-Id: 51E4C211B8
X-Rspamd-Server: rspamd2.dmz-prg2.suse.org
X-Rspamd-Action: no action
X-Spam-Score: -3.01

Use a safer function strscpy() instead of strcpy() for copying to
arrays.

Only idiomatic code replacement, and no functional changes.

Signed-off-by: Takashi Iwai <tiwai@suse.de>
---
 sound/pci/trident/trident.c      |  6 +++---
 sound/pci/trident/trident_main.c | 14 +++++++-------
 2 files changed, 10 insertions(+), 10 deletions(-)

diff --git a/sound/pci/trident/trident.c b/sound/pci/trident/trident.c
index 9922ab40798c..ddb6ccc72e44 100644
--- a/sound/pci/trident/trident.c
+++ b/sound/pci/trident/trident.c
@@ -88,11 +88,11 @@ static int snd_trident_probe(struct pci_dev *pci,
 	default:
 		str = "Unknown";
 	}
-	strcpy(card->driver, str);
+	strscpy(card->driver, str);
 	if (trident->device == TRIDENT_DEVICE_ID_SI7018) {
-		strcpy(card->shortname, "SiS ");
+		strscpy(card->shortname, "SiS ");
 	} else {
-		strcpy(card->shortname, "Trident ");
+		strscpy(card->shortname, "Trident ");
 	}
 	strcat(card->shortname, str);
 	sprintf(card->longname, "%s PCI Audio at 0x%lx, irq %d",
diff --git a/sound/pci/trident/trident_main.c b/sound/pci/trident/trident_main.c
index 4e16b79d6584..39ed52bf8631 100644
--- a/sound/pci/trident/trident_main.c
+++ b/sound/pci/trident/trident_main.c
@@ -2137,7 +2137,7 @@ int snd_trident_pcm(struct snd_trident *trident, int device)
 
 	pcm->info_flags = 0;
 	pcm->dev_subclass = SNDRV_PCM_SUBCLASS_GENERIC_MIX;
-	strcpy(pcm->name, "Trident 4DWave");
+	strscpy(pcm->name, "Trident 4DWave");
 	trident->pcm = pcm;
 
 	if (trident->tlb.entries) {
@@ -2189,16 +2189,16 @@ int snd_trident_foldback_pcm(struct snd_trident *trident, int device)
 	else
 		snd_pcm_set_ops(foldback, SNDRV_PCM_STREAM_CAPTURE, &snd_trident_foldback_ops);
 	foldback->info_flags = 0;
-	strcpy(foldback->name, "Trident 4DWave");
+	strscpy(foldback->name, "Trident 4DWave");
 	substream = foldback->streams[SNDRV_PCM_STREAM_CAPTURE].substream;
-	strcpy(substream->name, "Front Mixer");
+	strscpy(substream->name, "Front Mixer");
 	substream = substream->next;
-	strcpy(substream->name, "Reverb Mixer");
+	strscpy(substream->name, "Reverb Mixer");
 	substream = substream->next;
-	strcpy(substream->name, "Chorus Mixer");
+	strscpy(substream->name, "Chorus Mixer");
 	if (num_chan == 4) {
 		substream = substream->next;
-		strcpy(substream->name, "Second AC'97 ADC");
+		strscpy(substream->name, "Second AC'97 ADC");
 	}
 	trident->foldback = foldback;
 
@@ -2241,7 +2241,7 @@ int snd_trident_spdif_pcm(struct snd_trident *trident, int device)
 		snd_pcm_set_ops(spdif, SNDRV_PCM_STREAM_PLAYBACK, &snd_trident_spdif_7018_ops);
 	}
 	spdif->info_flags = 0;
-	strcpy(spdif->name, "Trident 4DWave IEC958");
+	strscpy(spdif->name, "Trident 4DWave IEC958");
 	trident->spdif = spdif;
 
 	snd_pcm_set_managed_buffer_all(spdif, SNDRV_DMA_TYPE_DEV,
-- 
2.50.0

