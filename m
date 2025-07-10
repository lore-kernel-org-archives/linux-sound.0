Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 174822D660A
	for <linux-sound@vger.kernel.org>; Thu, 10 Jul 2025 10:12:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752142352; cv=none; b=j4lFqU2is0csiilvzH1QII7gbmVN/euyRXoSw4ALO9hiNa0+aUl/x8DO3HUMa1yAkv7iJaXqvkFjEfslxGpfcz6mQg90Srs9ODqsiZsGPuF6iFhS7Vl+sNKQGsNrsH/kWmZTQ8NHxtnCj5JslONaOHOGv8hisHKU6Q7sOVKKcGk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752142352; c=relaxed/simple;
	bh=vTsrFNaukPLbw704/E9BMczUuzWEq4LVCgrzQ4ohzbc=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=jDIaBh5TuGsFHgtgWCyi175QhzzR+qmPKyU5Vn8Ii8d2ohTpvVD76x2cy+qrGVMuvE+69YfeR3LcrMZTjZ82PtGyL/tihEecn2r+yCU4Ome17ITxwQ9vKkamWbDCtWy0sWrlG5FwOWDEWAO0IE+/zjSSKjiMrzuYtGai47m6K+I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=aypMI/bv; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=SB/q6FtO; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=aypMI/bv; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=SB/q6FtO; arc=none smtp.client-ip=195.135.223.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="aypMI/bv";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="SB/q6FtO";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="aypMI/bv";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="SB/q6FtO"
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id E017D211B3;
	Thu, 10 Jul 2025 10:07:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1752142066; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Cae8YXqkKM2bGz5F60kzuF8qhJNoxowabcB1iny0mPw=;
	b=aypMI/bvzKCzw3nvwLklUb7Svfhd0W0gkb+aSTO5tyP587UXoI+AI2haiNNnpNbH8+f8CV
	9Oay38UoDf+YWtMXNKcPhAPQ8DF/VcFj9vyv+vf0F45Rqj53BOPtqbaTai4F/LM9zvm5IQ
	aKy8Wt8gvOmvxf4XjjdYuNlF4cQnLCc=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1752142066;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Cae8YXqkKM2bGz5F60kzuF8qhJNoxowabcB1iny0mPw=;
	b=SB/q6FtO0x6xzq6rYhSxESBIMZYpSC5TnKXV6ZGkLBKPpRjxjHn6IAbX5JP3lqMaV2J8Tc
	KHJNBIob/ohfjEBw==
Authentication-Results: smtp-out1.suse.de;
	dkim=pass header.d=suse.de header.s=susede2_rsa header.b="aypMI/bv";
	dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b="SB/q6FtO"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1752142066; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Cae8YXqkKM2bGz5F60kzuF8qhJNoxowabcB1iny0mPw=;
	b=aypMI/bvzKCzw3nvwLklUb7Svfhd0W0gkb+aSTO5tyP587UXoI+AI2haiNNnpNbH8+f8CV
	9Oay38UoDf+YWtMXNKcPhAPQ8DF/VcFj9vyv+vf0F45Rqj53BOPtqbaTai4F/LM9zvm5IQ
	aKy8Wt8gvOmvxf4XjjdYuNlF4cQnLCc=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1752142066;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Cae8YXqkKM2bGz5F60kzuF8qhJNoxowabcB1iny0mPw=;
	b=SB/q6FtO0x6xzq6rYhSxESBIMZYpSC5TnKXV6ZGkLBKPpRjxjHn6IAbX5JP3lqMaV2J8Tc
	KHJNBIob/ohfjEBw==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id BFC0F13A70;
	Thu, 10 Jul 2025 10:07:46 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id sDBqLfKQb2jZWQAAD6G6ig
	(envelope-from <tiwai@suse.de>); Thu, 10 Jul 2025 10:07:46 +0000
From: Takashi Iwai <tiwai@suse.de>
To: linux-sound@vger.kernel.org
Subject: [PATCH 075/103] ALSA: oxygen: Use safer strscpy() instead of strcpy()
Date: Thu, 10 Jul 2025 12:06:57 +0200
Message-ID: <20250710100727.22653-76-tiwai@suse.de>
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
X-Spam-Level: 
X-Spam-Flag: NO
X-Rspamd-Queue-Id: E017D211B3
X-Rspamd-Action: no action
X-Rspamd-Server: rspamd1.dmz-prg2.suse.org
X-Spamd-Result: default: False [-3.01 / 50.00];
	BAYES_HAM(-3.00)[100.00%];
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:dkim,suse.de:mid,suse.de:email,imap1.dmz-prg2.suse.org:rdns,imap1.dmz-prg2.suse.org:helo];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	TO_DN_NONE(0.00)[];
	RCVD_TLS_ALL(0.00)[];
	FROM_EQ_ENVFROM(0.00)[];
	R_RATELIMIT(0.00)[to_ip_from(RLe1mc1hwayk397878n5a1j337)];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	DKIM_TRACE(0.00)[suse.de:+]
X-Spam-Score: -3.01

Use a safer function strscpy() instead of strcpy() for copying to
arrays.

Only idiomatic code replacement, and no functional changes.

Signed-off-by: Takashi Iwai <tiwai@suse.de>
---
 sound/pci/oxygen/oxygen_lib.c | 6 +++---
 sound/pci/oxygen/oxygen_pcm.c | 8 ++++----
 2 files changed, 7 insertions(+), 7 deletions(-)

diff --git a/sound/pci/oxygen/oxygen_lib.c b/sound/pci/oxygen/oxygen_lib.c
index 39b8ccf37cdd..9c7270e4c35e 100644
--- a/sound/pci/oxygen/oxygen_lib.c
+++ b/sound/pci/oxygen/oxygen_lib.c
@@ -655,11 +655,11 @@ static int __oxygen_pci_probe(struct pci_dev *pci, int index, char *id,
 	chip->irq = pci->irq;
 	card->sync_irq = chip->irq;
 
-	strcpy(card->driver, chip->model.chip);
-	strcpy(card->shortname, chip->model.shortname);
+	strscpy(card->driver, chip->model.chip);
+	strscpy(card->shortname, chip->model.shortname);
 	sprintf(card->longname, "%s at %#lx, irq %i",
 		chip->model.longname, chip->addr, chip->irq);
-	strcpy(card->mixername, chip->model.chip);
+	strscpy(card->mixername, chip->model.chip);
 	snd_component_add(card, chip->model.chip);
 
 	err = oxygen_pcm_init(chip);
diff --git a/sound/pci/oxygen/oxygen_pcm.c b/sound/pci/oxygen/oxygen_pcm.c
index b2a3fcfe31d4..643141f345bb 100644
--- a/sound/pci/oxygen/oxygen_pcm.c
+++ b/sound/pci/oxygen/oxygen_pcm.c
@@ -697,7 +697,7 @@ int oxygen_pcm_init(struct oxygen *chip)
 			snd_pcm_set_ops(pcm, SNDRV_PCM_STREAM_CAPTURE,
 					&oxygen_rec_b_ops);
 		pcm->private_data = chip;
-		strcpy(pcm->name, "Multichannel");
+		strscpy(pcm->name, "Multichannel");
 		if (outs)
 			snd_pcm_set_managed_buffer(pcm->streams[SNDRV_PCM_STREAM_PLAYBACK].substream,
 						   SNDRV_DMA_TYPE_DEV,
@@ -725,7 +725,7 @@ int oxygen_pcm_init(struct oxygen *chip)
 			snd_pcm_set_ops(pcm, SNDRV_PCM_STREAM_CAPTURE,
 					&oxygen_rec_c_ops);
 		pcm->private_data = chip;
-		strcpy(pcm->name, "Digital");
+		strscpy(pcm->name, "Digital");
 		snd_pcm_set_managed_buffer_all(pcm, SNDRV_DMA_TYPE_DEV,
 					       &chip->pci->dev,
 					       DEFAULT_BUFFER_BYTES,
@@ -755,7 +755,7 @@ int oxygen_pcm_init(struct oxygen *chip)
 			snd_pcm_set_ops(pcm, SNDRV_PCM_STREAM_CAPTURE,
 					&oxygen_rec_b_ops);
 		pcm->private_data = chip;
-		strcpy(pcm->name, outs ? "Front Panel" : "Analog 2");
+		strscpy(pcm->name, outs ? "Front Panel" : "Analog 2");
 		snd_pcm_set_managed_buffer_all(pcm, SNDRV_DMA_TYPE_DEV,
 					       &chip->pci->dev,
 					       DEFAULT_BUFFER_BYTES,
@@ -773,7 +773,7 @@ int oxygen_pcm_init(struct oxygen *chip)
 				     OXYGEN_REC_C_ROUTE_I2S_ADC_3,
 				     OXYGEN_REC_C_ROUTE_MASK);
 		pcm->private_data = chip;
-		strcpy(pcm->name, "Analog 3");
+		strscpy(pcm->name, "Analog 3");
 		snd_pcm_set_managed_buffer_all(pcm, SNDRV_DMA_TYPE_DEV,
 					       &chip->pci->dev,
 					       DEFAULT_BUFFER_BYTES,
-- 
2.50.0

