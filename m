Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EBAD62D59F7
	for <linux-sound@vger.kernel.org>; Thu, 10 Jul 2025 10:08:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752142112; cv=none; b=V+WMdD9zujVgSGRQWNJQxJjTyKEh3+NXheF9vJ04MvbFAqvtbw1KcmKo08+RxBo50cnBupO0JNkL2J/NKOCZFwNLx06NrVcVJn3rhDHUwvZXBy6yIDZaAuiM4d+5huL1WE8ZUXdMKp2ZxUPXPW2MeN0qXNaX3QIXRNMyw8y8zU4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752142112; c=relaxed/simple;
	bh=HlxiTvqvlaiIsKhKeWp/f2AjGNE/9B8MAhpAABViqDA=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=b1PHRgqm0AdV9f4mcINXDj6KuRkDPk4M8N0qYZSFEPnLYv0IS6/hViXYPVmlV5DqQ+bgRm+PRC+ppXy8lFu3UG+8dFF/GBj1gpgWjlm5Xc5f48v31fWQMBJXztKffbD/eWuF9FrRzV6rK05fl4OBY5Bznq+uC+bWu1BU9FzDXZU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=UmgsOZ09; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=ICvPbR6Y; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=UmgsOZ09; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=ICvPbR6Y; arc=none smtp.client-ip=195.135.223.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="UmgsOZ09";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="ICvPbR6Y";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="UmgsOZ09";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="ICvPbR6Y"
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id 594BF21184;
	Thu, 10 Jul 2025 10:07:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1752142058; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=JsZCJIrMe6k0y/x39zjYQiiMaLBzwgm5USbHxVwLHhs=;
	b=UmgsOZ09pX3w+Ks7ZxIcdoumAuPSj4/G2eSVu3bjvJMMKNDVAJjheCjTk6cwwNkTIPANXU
	5pkC5HLNKLkKybNub9JhXPcG3/ey/HnZUeMLDcjCbSUhra8scn/qkXzyK1tt/sDx0RSzJr
	PcxeqMaQIH6XuTiDiV8K7rM2CdumltY=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1752142058;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=JsZCJIrMe6k0y/x39zjYQiiMaLBzwgm5USbHxVwLHhs=;
	b=ICvPbR6Y7MJdSTCpCGrJt32dLYLwMomDKz/IzUE3DdxLqmGJF9nRc5oWV3ctQPy38ORIwW
	8yQRUkhtelhVj2DQ==
Authentication-Results: smtp-out1.suse.de;
	dkim=pass header.d=suse.de header.s=susede2_rsa header.b=UmgsOZ09;
	dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=ICvPbR6Y
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1752142058; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=JsZCJIrMe6k0y/x39zjYQiiMaLBzwgm5USbHxVwLHhs=;
	b=UmgsOZ09pX3w+Ks7ZxIcdoumAuPSj4/G2eSVu3bjvJMMKNDVAJjheCjTk6cwwNkTIPANXU
	5pkC5HLNKLkKybNub9JhXPcG3/ey/HnZUeMLDcjCbSUhra8scn/qkXzyK1tt/sDx0RSzJr
	PcxeqMaQIH6XuTiDiV8K7rM2CdumltY=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1752142058;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=JsZCJIrMe6k0y/x39zjYQiiMaLBzwgm5USbHxVwLHhs=;
	b=ICvPbR6Y7MJdSTCpCGrJt32dLYLwMomDKz/IzUE3DdxLqmGJF9nRc5oWV3ctQPy38ORIwW
	8yQRUkhtelhVj2DQ==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 40C1413AAB;
	Thu, 10 Jul 2025 10:07:38 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id 2I+dDuqQb2jZWQAAD6G6ig
	(envelope-from <tiwai@suse.de>); Thu, 10 Jul 2025 10:07:38 +0000
From: Takashi Iwai <tiwai@suse.de>
To: linux-sound@vger.kernel.org
Subject: [PATCH 012/103] ALSA: vx: Use safer strscpy() instead of strcpy()
Date: Thu, 10 Jul 2025 12:05:54 +0200
Message-ID: <20250710100727.22653-13-tiwai@suse.de>
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
X-Rspamd-Queue-Id: 594BF21184
X-Rspamd-Action: no action
X-Rspamd-Server: rspamd1.dmz-prg2.suse.org
X-Spamd-Result: default: False [-3.01 / 50.00];
	BAYES_HAM(-3.00)[100.00%];
	MID_CONTAINS_FROM(1.00)[];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	R_MISSING_CHARSET(0.50)[];
	R_DKIM_ALLOW(-0.20)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	MX_GOOD(-0.01)[];
	TO_DN_NONE(0.00)[];
	ARC_NA(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RBL_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	RCPT_COUNT_ONE(0.00)[1];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	FROM_EQ_ENVFROM(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[imap1.dmz-prg2.suse.org:rdns,imap1.dmz-prg2.suse.org:helo,suse.de:dkim,suse.de:mid,suse.de:email];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	RECEIVED_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:106:10:150:64:167:received];
	RCVD_COUNT_TWO(0.00)[2];
	RCVD_TLS_ALL(0.00)[];
	FUZZY_RATELIMITED(0.00)[rspamd.com];
	DKIM_TRACE(0.00)[suse.de:+]
X-Spam-Score: -3.01

Use a safer function strscpy() instead of strcpy() for copying to
arrays.

Only idiomatic code replacement, and no functional changes.

Signed-off-by: Takashi Iwai <tiwai@suse.de>
---
 sound/drivers/vx/vx_core.c  | 2 +-
 sound/drivers/vx/vx_mixer.c | 2 +-
 sound/drivers/vx/vx_pcm.c   | 2 +-
 3 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/sound/drivers/vx/vx_core.c b/sound/drivers/vx/vx_core.c
index e2def8719ed2..7f25fa7c0404 100644
--- a/sound/drivers/vx/vx_core.c
+++ b/sound/drivers/vx/vx_core.c
@@ -806,7 +806,7 @@ struct vx_core *snd_vx_create(struct snd_card *card,
 
 	chip->card = card;
 	card->private_data = chip;
-	strcpy(card->driver, hw->name);
+	strscpy(card->driver, hw->name);
 	sprintf(card->shortname, "Digigram %s", hw->name);
 
 	vx_proc_init(chip);
diff --git a/sound/drivers/vx/vx_mixer.c b/sound/drivers/vx/vx_mixer.c
index 53d78eb13c53..0a51ecdc084a 100644
--- a/sound/drivers/vx/vx_mixer.c
+++ b/sound/drivers/vx/vx_mixer.c
@@ -903,7 +903,7 @@ int snd_vx_mixer_new(struct vx_core *chip)
 	struct snd_card *card = chip->card;
 	char name[32];
 
-	strcpy(card->mixername, card->driver);
+	strscpy(card->mixername, card->driver);
 
 	/* output level controls */
 	for (i = 0; i < chip->hw->num_outs; i++) {
diff --git a/sound/drivers/vx/vx_pcm.c b/sound/drivers/vx/vx_pcm.c
index cbc77ca1ebdd..defc489494af 100644
--- a/sound/drivers/vx/vx_pcm.c
+++ b/sound/drivers/vx/vx_pcm.c
@@ -1226,7 +1226,7 @@ int snd_vx_pcm_new(struct vx_core *chip)
 		pcm->private_free = snd_vx_pcm_free;
 		pcm->info_flags = 0;
 		pcm->nonatomic = true;
-		strcpy(pcm->name, chip->card->shortname);
+		strscpy(pcm->name, chip->card->shortname);
 		chip->pcm[i] = pcm;
 	}
 
-- 
2.50.0

