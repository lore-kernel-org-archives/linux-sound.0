Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 663DA2D59F6
	for <linux-sound@vger.kernel.org>; Thu, 10 Jul 2025 10:08:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752142125; cv=none; b=ZA1+X3iMUgCDoJgn/59s063pZcmA+CprTx/8uZw6X62wjuZgPD5Xwx9NARbL6A0GB8tOfGSjS1X9cwTq8UgyzPLuGkZm2HNcadr3Ho26C0Fi+jDfrAvKM+LkUoZ4ePGcLBdH6t4jQ6vRiRAjW/LBjF4T/pfSoakIhMWWEdec3IQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752142125; c=relaxed/simple;
	bh=xYBO9Q530yQRr4QmNZ9p4592Hda8EErKyllsqbmBZPA=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=eTg0zmPAPtkFwTg6zoTo2y5ntK1is4+vLomC184mHCwuIC7FSaEJxPbUNR9Me51YbrcrKvHj5DrO0aN6jzrU4HS+T5EN9EHqxIRDahirAm/5t+RBCvaMd/OncvXmk98IOKY/EbIiBeBVMmTDYCUk9aWhX7s41nHX1liEm/X/XwI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=16F3npcw; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=ymf/Bmf2; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=16F3npcw; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=ymf/Bmf2; arc=none smtp.client-ip=195.135.223.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="16F3npcw";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="ymf/Bmf2";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="16F3npcw";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="ymf/Bmf2"
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id C7D0321187;
	Thu, 10 Jul 2025 10:07:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1752142058; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=UptrXOfNnYM87ZFu2INBoIq/GTQeBdsIPo/XL2Q5c4U=;
	b=16F3npcwsfVDvEOhemzY6sqBTzQPKjGqMVYwINo4Dn74TrJUKbc6D7TXu6FTF1YFEXGOyz
	Ge2rh5tPyOEyxlM2LDbB3UFSba66WRFbSNIhNITGax8FBkQQHqLp/MqZmzWEAK6eihR7Fm
	HyhmZsIO0ghB7V9JIa0uxw9q7jDSdsc=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1752142058;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=UptrXOfNnYM87ZFu2INBoIq/GTQeBdsIPo/XL2Q5c4U=;
	b=ymf/Bmf2TxP4xKTOHb2noV7nTEjCqFZ2VES0jW6YSSpT/u79Dyi/6c89u/gIj8XmzSdi3y
	IFgfIphkNIqFEDAQ==
Authentication-Results: smtp-out1.suse.de;
	dkim=pass header.d=suse.de header.s=susede2_rsa header.b=16F3npcw;
	dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b="ymf/Bmf2"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1752142058; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=UptrXOfNnYM87ZFu2INBoIq/GTQeBdsIPo/XL2Q5c4U=;
	b=16F3npcwsfVDvEOhemzY6sqBTzQPKjGqMVYwINo4Dn74TrJUKbc6D7TXu6FTF1YFEXGOyz
	Ge2rh5tPyOEyxlM2LDbB3UFSba66WRFbSNIhNITGax8FBkQQHqLp/MqZmzWEAK6eihR7Fm
	HyhmZsIO0ghB7V9JIa0uxw9q7jDSdsc=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1752142058;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=UptrXOfNnYM87ZFu2INBoIq/GTQeBdsIPo/XL2Q5c4U=;
	b=ymf/Bmf2TxP4xKTOHb2noV7nTEjCqFZ2VES0jW6YSSpT/u79Dyi/6c89u/gIj8XmzSdi3y
	IFgfIphkNIqFEDAQ==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id AF37D13A70;
	Thu, 10 Jul 2025 10:07:38 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id SECeKeqQb2jZWQAAD6G6ig
	(envelope-from <tiwai@suse.de>); Thu, 10 Jul 2025 10:07:38 +0000
From: Takashi Iwai <tiwai@suse.de>
To: linux-sound@vger.kernel.org
Subject: [PATCH 015/103] ALSA: firewire: digi00x: Use safer strscpy() instead of strcpy()
Date: Thu, 10 Jul 2025 12:05:57 +0200
Message-ID: <20250710100727.22653-16-tiwai@suse.de>
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
X-Rspamd-Queue-Id: C7D0321187
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:dkim,suse.de:mid,suse.de:email,imap1.dmz-prg2.suse.org:rdns,imap1.dmz-prg2.suse.org:helo];
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
 sound/firewire/digi00x/digi00x-hwdep.c | 2 +-
 sound/firewire/digi00x/digi00x.c       | 6 +++---
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/sound/firewire/digi00x/digi00x-hwdep.c b/sound/firewire/digi00x/digi00x-hwdep.c
index aadf7d724856..b150607c0a0d 100644
--- a/sound/firewire/digi00x/digi00x-hwdep.c
+++ b/sound/firewire/digi00x/digi00x-hwdep.c
@@ -188,7 +188,7 @@ int snd_dg00x_create_hwdep_device(struct snd_dg00x *dg00x)
 	if (err < 0)
 		return err;
 
-	strcpy(hwdep->name, "Digi00x");
+	strscpy(hwdep->name, "Digi00x");
 	hwdep->iface = SNDRV_HWDEP_IFACE_FW_DIGI00X;
 	hwdep->ops = ops;
 	hwdep->private_data = dg00x;
diff --git a/sound/firewire/digi00x/digi00x.c b/sound/firewire/digi00x/digi00x.c
index 704ae2a5316b..cebc35dcf8cd 100644
--- a/sound/firewire/digi00x/digi00x.c
+++ b/sound/firewire/digi00x/digi00x.c
@@ -30,9 +30,9 @@ static int name_card(struct snd_dg00x *dg00x)
 
 	model = skip_spaces(name);
 
-	strcpy(dg00x->card->driver, "Digi00x");
-	strcpy(dg00x->card->shortname, model);
-	strcpy(dg00x->card->mixername, model);
+	strscpy(dg00x->card->driver, "Digi00x");
+	strscpy(dg00x->card->shortname, model);
+	strscpy(dg00x->card->mixername, model);
 	snprintf(dg00x->card->longname, sizeof(dg00x->card->longname),
 		 "Digidesign %s, GUID %08x%08x at %s, S%d", model,
 		 fw_dev->config_rom[3], fw_dev->config_rom[4],
-- 
2.50.0

