Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EF5522D5C8D
	for <linux-sound@vger.kernel.org>; Thu, 10 Jul 2025 10:10:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752142230; cv=none; b=F1u+LZ5cQyc7zKMAtcP8811oIhcUz/qx/nQlXsQ9Lvc+bji4EvmOA16oGGM9aNF5W4U+Cv5TGYOiUuzlkuqIfrmtpi94xM8SlM4VaHt3CMKg796jZ7m+VPmxDI/zI6oCvZ7AQ3GffwB+d1LnNoYMcl7LvL0RrLuBTwxgVILbaqw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752142230; c=relaxed/simple;
	bh=tqjUbHixafwZQriLwuyE2zeDtm2/S+juo22uYLu0Wgo=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=h11+Gx/3RIi2fYscAHEZyIjLdNhbA3Zjz+K+JqXlYubtxcPLtjaBxXFswJgREVrL8tzjpThqlVt2L/DwTx6PgoaZSujh7K4D5cIgrLflWtGpgRv9Hg6/9mxuedRelG4vmN8o9tX2FQZ7AXQkWHpZfYbZbEQkvoGiotNg38FdK4I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=DD3T8u6I; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=cEyLqsDJ; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=DD3T8u6I; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=cEyLqsDJ; arc=none smtp.client-ip=195.135.223.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="DD3T8u6I";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="cEyLqsDJ";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="DD3T8u6I";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="cEyLqsDJ"
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id 19EA72119A;
	Thu, 10 Jul 2025 10:07:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1752142062; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=HOViwzaHK7KjnFIXHLQRbflV5Lida+iSk4QmKqh+WvI=;
	b=DD3T8u6I8m+2mWZXXzMsmr43W+VwW19iFDZl5xdnVJPHNoVyaPn1qLSADw/oxoDuyadbTk
	33xxbS8bJHc8dyE+Td8QKNcoZjIcrXrtO0QKg9WwSs+PcNr8geixaB4uiM5KJeyQ/2g2rr
	zq2XHliJfoMkFJNA5nn7ewoARzQTMrU=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1752142062;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=HOViwzaHK7KjnFIXHLQRbflV5Lida+iSk4QmKqh+WvI=;
	b=cEyLqsDJPBpIKWk7S9RmFwF+Dz4czftcXFsBKj+U17PuImkSAHdz+Q6/7SSNLxy/bcDdce
	Btvy8tvtuIkCa4BQ==
Authentication-Results: smtp-out1.suse.de;
	dkim=pass header.d=suse.de header.s=susede2_rsa header.b=DD3T8u6I;
	dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=cEyLqsDJ
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1752142062; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=HOViwzaHK7KjnFIXHLQRbflV5Lida+iSk4QmKqh+WvI=;
	b=DD3T8u6I8m+2mWZXXzMsmr43W+VwW19iFDZl5xdnVJPHNoVyaPn1qLSADw/oxoDuyadbTk
	33xxbS8bJHc8dyE+Td8QKNcoZjIcrXrtO0QKg9WwSs+PcNr8geixaB4uiM5KJeyQ/2g2rr
	zq2XHliJfoMkFJNA5nn7ewoARzQTMrU=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1752142062;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=HOViwzaHK7KjnFIXHLQRbflV5Lida+iSk4QmKqh+WvI=;
	b=cEyLqsDJPBpIKWk7S9RmFwF+Dz4czftcXFsBKj+U17PuImkSAHdz+Q6/7SSNLxy/bcDdce
	Btvy8tvtuIkCa4BQ==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 01EB4136DC;
	Thu, 10 Jul 2025 10:07:41 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id 6IPWOu2Qb2jZWQAAD6G6ig
	(envelope-from <tiwai@suse.de>); Thu, 10 Jul 2025 10:07:41 +0000
From: Takashi Iwai <tiwai@suse.de>
To: linux-sound@vger.kernel.org
Subject: [PATCH 040/103] ALSA: parisc: Use safer strscpy() instead of strcpy()
Date: Thu, 10 Jul 2025 12:06:22 +0200
Message-ID: <20250710100727.22653-41-tiwai@suse.de>
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
	FUZZY_RATELIMITED(0.00)[rspamd.com];
	RBL_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:104:10:150:64:97:from];
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
X-Rspamd-Queue-Id: 19EA72119A
X-Rspamd-Server: rspamd2.dmz-prg2.suse.org
X-Rspamd-Action: no action
X-Spam-Score: -3.01

Use a safer function strscpy() instead of strcpy() for copying to
arrays.

Only idiomatic code replacement, and no functional changes.

Signed-off-by: Takashi Iwai <tiwai@suse.de>
---
 sound/parisc/harmony.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/sound/parisc/harmony.c b/sound/parisc/harmony.c
index db9c296dd688..76dd2210f9ea 100644
--- a/sound/parisc/harmony.c
+++ b/sound/parisc/harmony.c
@@ -601,7 +601,7 @@ snd_harmony_pcm_init(struct snd_harmony *h)
 
 	pcm->private_data = h;
 	pcm->info_flags = 0;
-	strcpy(pcm->name, "harmony");
+	strscpy(pcm->name, "harmony");
 	h->pcm = pcm;
 
 	h->psubs = NULL;
@@ -823,7 +823,7 @@ snd_harmony_mixer_init(struct snd_harmony *h)
 	if (snd_BUG_ON(!h))
 		return -EINVAL;
 	card = h->card;
-	strcpy(card->mixername, "Harmony Gain control interface");
+	strscpy(card->mixername, "Harmony Gain control interface");
 
 	for (idx = 0; idx < HARMONY_CONTROLS; idx++) {
 		err = snd_ctl_add(card, 
@@ -937,8 +937,8 @@ snd_harmony_probe(struct parisc_device *padev)
 	if (err < 0)
 		goto free_and_ret;
 
-	strcpy(card->driver, "harmony");
-	strcpy(card->shortname, "Harmony");
+	strscpy(card->driver, "harmony");
+	strscpy(card->shortname, "Harmony");
 	sprintf(card->longname, "%s at 0x%lx, irq %i",
 		card->shortname, h->hpa, h->irq);
 
-- 
2.50.0

