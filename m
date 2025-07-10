Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 736482D59EA
	for <linux-sound@vger.kernel.org>; Thu, 10 Jul 2025 10:08:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752142098; cv=none; b=PFve31dQ3TnqrFJ2dud1CwSm9kE8gOOoCvEPLXCZFCqHagZSrCQvkMdkjhvmftri8qpP5vCKCfiPAwCsQih0+GwEksKromdxkzUEdqAvsAQfJNOv2RsxmxrIzoIXT3FfVB82tmmJRXCD41gkhDOSu5Ozt0n17jiBoeTARW931yw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752142098; c=relaxed/simple;
	bh=UXWSC3THRSwQmOA2i3Grz/3mjmHDLojkG4SupcqbpGs=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=cEienJYTSVsk/zDate4Qe6XOcqoNciQf2ZU27ABs6/9IPS/EJSO7ZzABymYrifiqKJuqdwd+s/OBO/4yDENA+d4vbcNgbtERGCNCt6iForD7tCc7z3+baZX5/aGoZv+MCHf+zliPVD3ZBsU7+/0M4PlVtL33WOEh0nQuZua2RYc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=nokFz1/O; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=7KpshcXo; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=nokFz1/O; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=7KpshcXo; arc=none smtp.client-ip=195.135.223.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="nokFz1/O";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="7KpshcXo";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="nokFz1/O";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="7KpshcXo"
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id 332B21F454;
	Thu, 10 Jul 2025 10:07:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1752142059; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Ldh4jgPxbHJc64OT8bzOKk11iYRiqm+oinJ5a82IMbo=;
	b=nokFz1/O+5PmGjx+OyAcHpMKOAJtyFlPzg/5esjcvzA6YsSiw6QGBjJWjLOYRkENxXH0Nh
	Ixa0r1LqSl7Z3woJ58EJfk9FaBhE3P/EGlianpo7I5rUyw6jijW6QQhYE1I8v5G02dLFDK
	2/w5f0/jsauizRKoeRQueCpmZwZTCwo=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1752142059;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Ldh4jgPxbHJc64OT8bzOKk11iYRiqm+oinJ5a82IMbo=;
	b=7KpshcXo4B1swCOsXSW5HiTxE0YWqgEqgsadbtYd1z2msOZe13a52k7J1FrLt0e3uPcUZf
	j/GrfwyhrqVAqPCg==
Authentication-Results: smtp-out2.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1752142059; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Ldh4jgPxbHJc64OT8bzOKk11iYRiqm+oinJ5a82IMbo=;
	b=nokFz1/O+5PmGjx+OyAcHpMKOAJtyFlPzg/5esjcvzA6YsSiw6QGBjJWjLOYRkENxXH0Nh
	Ixa0r1LqSl7Z3woJ58EJfk9FaBhE3P/EGlianpo7I5rUyw6jijW6QQhYE1I8v5G02dLFDK
	2/w5f0/jsauizRKoeRQueCpmZwZTCwo=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1752142059;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Ldh4jgPxbHJc64OT8bzOKk11iYRiqm+oinJ5a82IMbo=;
	b=7KpshcXo4B1swCOsXSW5HiTxE0YWqgEqgsadbtYd1z2msOZe13a52k7J1FrLt0e3uPcUZf
	j/GrfwyhrqVAqPCg==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 19D0813AAB;
	Thu, 10 Jul 2025 10:07:39 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id mE8dBeuQb2jZWQAAD6G6ig
	(envelope-from <tiwai@suse.de>); Thu, 10 Jul 2025 10:07:39 +0000
From: Takashi Iwai <tiwai@suse.de>
To: linux-sound@vger.kernel.org
Subject: [PATCH 018/103] ALSA: firewire: isight: Use safer strscpy() instead of strcpy()
Date: Thu, 10 Jul 2025 12:06:00 +0200
Message-ID: <20250710100727.22653-19-tiwai@suse.de>
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
X-Spamd-Result: default: False [-2.80 / 50.00];
	BAYES_HAM(-3.00)[100.00%];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	NEURAL_HAM_SHORT(-0.20)[-0.999];
	MIME_GOOD(-0.10)[text/plain];
	FUZZY_RATELIMITED(0.00)[rspamd.com];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCPT_COUNT_ONE(0.00)[1];
	ARC_NA(0.00)[];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:email,suse.de:mid,imap1.dmz-prg2.suse.org:helo];
	FROM_EQ_ENVFROM(0.00)[];
	FROM_HAS_DN(0.00)[];
	MIME_TRACE(0.00)[0:+];
	RCVD_COUNT_TWO(0.00)[2];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	TO_DN_NONE(0.00)[];
	RCVD_TLS_ALL(0.00)[]
X-Spam-Flag: NO
X-Spam-Score: -2.80

Use a safer function strscpy() instead of strcpy() for copying to
arrays.

Only idiomatic code replacement, and no functional changes.

Signed-off-by: Takashi Iwai <tiwai@suse.de>
---
 sound/firewire/isight.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/sound/firewire/isight.c b/sound/firewire/isight.c
index b1e059f0d473..ee574b5d7406 100644
--- a/sound/firewire/isight.c
+++ b/sound/firewire/isight.c
@@ -455,7 +455,7 @@ static int isight_create_pcm(struct isight *isight)
 		return err;
 	pcm->private_data = isight;
 	pcm->nonatomic = true;
-	strcpy(pcm->name, "iSight");
+	strscpy(pcm->name, "iSight");
 	isight->pcm = pcm->streams[SNDRV_PCM_STREAM_CAPTURE].substream;
 	isight->pcm->ops = &ops;
 	snd_pcm_set_managed_buffer_all(pcm, SNDRV_DMA_TYPE_VMALLOC, NULL, 0, 0);
@@ -638,13 +638,13 @@ static int isight_probe(struct fw_unit *unit,
 
 	card->private_free = isight_card_free;
 
-	strcpy(card->driver, "iSight");
-	strcpy(card->shortname, "Apple iSight");
+	strscpy(card->driver, "iSight");
+	strscpy(card->shortname, "Apple iSight");
 	snprintf(card->longname, sizeof(card->longname),
 		 "Apple iSight (GUID %08x%08x) at %s, S%d",
 		 fw_dev->config_rom[3], fw_dev->config_rom[4],
 		 dev_name(&unit->device), 100 << fw_dev->max_speed);
-	strcpy(card->mixername, "iSight");
+	strscpy(card->mixername, "iSight");
 
 	err = isight_create_pcm(isight);
 	if (err < 0)
-- 
2.50.0

