Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B034D2D5C99
	for <linux-sound@vger.kernel.org>; Thu, 10 Jul 2025 10:11:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752142273; cv=none; b=WGpYqLH0BXBhkq9FTnBr7Z0hwQXl88kgdOZSh9ll/Oovm3NmX3GSr1g2gM+rXLD19NoWGeLcG9agSI4cjKLzJnrnbhYbXUwGMJ+9XOX7zVUe5yitlldHOJObfX20Bb6yDHGMMYtl9l0+a31/TVK+iV/ukTJm96FJ3vkusi7xqoM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752142273; c=relaxed/simple;
	bh=S+8Y1i+f/d9+HNGTyWZjlyKya4F9h1dDhh97yMRXj1U=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=XYMcFCDjQkp09TfUIy+yCxTzimiyRAIW6cmq7l1SzNLedqMZpAyMR+pF3wv5ZBviS1wNLX0cv3lkGO78h64yQXz4Oc9eW/8qkMVAlz45el1cF0h3eEpg93vMb8wQFyCBzBGBwbqBcdkQ5C+H70w5CUVaPUB9k6g2wYeA7ywvEto=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=v2BTuHGn; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=ucgAuFkj; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=v2BTuHGn; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=ucgAuFkj; arc=none smtp.client-ip=195.135.223.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="v2BTuHGn";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="ucgAuFkj";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="v2BTuHGn";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="ucgAuFkj"
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id 0C9F21F786;
	Thu, 10 Jul 2025 10:07:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1752142068; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=DZYorSMS7GUTjgUUKB78XpNZkwVWMK2AKbJD6poyDYU=;
	b=v2BTuHGncejkI+VUsTPnsQvAipztDX2gYIZ9qMBMhW10GZaxT6WRpryqWfU+NhtdNk82Dp
	wa5aHtq2hp28vz/WFmab6KapVQ/NRmPPXkelZm1Eufds96dl85fjEonw5rsD8uG1YcDB3g
	3/II/vrB/65C9yVBZKEopFJyQP+utQo=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1752142068;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=DZYorSMS7GUTjgUUKB78XpNZkwVWMK2AKbJD6poyDYU=;
	b=ucgAuFkjJ3mg2vIHm4F+gJYBbzJ+9G7B/XlNl1yt97jeHSRR1GpRDB/BG4SDrMWBP4eUhb
	nYG9Sb021gqVAvBw==
Authentication-Results: smtp-out2.suse.de;
	dkim=pass header.d=suse.de header.s=susede2_rsa header.b=v2BTuHGn;
	dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=ucgAuFkj
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1752142068; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=DZYorSMS7GUTjgUUKB78XpNZkwVWMK2AKbJD6poyDYU=;
	b=v2BTuHGncejkI+VUsTPnsQvAipztDX2gYIZ9qMBMhW10GZaxT6WRpryqWfU+NhtdNk82Dp
	wa5aHtq2hp28vz/WFmab6KapVQ/NRmPPXkelZm1Eufds96dl85fjEonw5rsD8uG1YcDB3g
	3/II/vrB/65C9yVBZKEopFJyQP+utQo=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1752142068;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=DZYorSMS7GUTjgUUKB78XpNZkwVWMK2AKbJD6poyDYU=;
	b=ucgAuFkjJ3mg2vIHm4F+gJYBbzJ+9G7B/XlNl1yt97jeHSRR1GpRDB/BG4SDrMWBP4eUhb
	nYG9Sb021gqVAvBw==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id D587713A70;
	Thu, 10 Jul 2025 10:07:47 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id oA5gMvOQb2jZWQAAD6G6ig
	(envelope-from <tiwai@suse.de>); Thu, 10 Jul 2025 10:07:47 +0000
From: Takashi Iwai <tiwai@suse.de>
To: linux-sound@vger.kernel.org
Subject: [PATCH 083/103] ALSA: Use safer strscpy() instead of strcpy()
Date: Thu, 10 Jul 2025 12:07:05 +0200
Message-ID: <20250710100727.22653-84-tiwai@suse.de>
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
X-Rspamd-Queue-Id: 0C9F21F786
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
 sound/pci/sis7019.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/sound/pci/sis7019.c b/sound/pci/sis7019.c
index 42b22f123fa7..3d7abcb31679 100644
--- a/sound/pci/sis7019.c
+++ b/sound/pci/sis7019.c
@@ -868,7 +868,7 @@ static int sis_pcm_create(struct sis7019 *sis)
 		return rc;
 
 	pcm->private_data = sis;
-	strcpy(pcm->name, "SiS7019");
+	strscpy(pcm->name, "SiS7019");
 	sis->pcm = pcm;
 
 	snd_pcm_set_ops(pcm, SNDRV_PCM_STREAM_PLAYBACK, &sis_playback_ops);
@@ -1348,8 +1348,8 @@ static int __snd_sis7019_probe(struct pci_dev *pci,
 	if (rc < 0)
 		return rc;
 
-	strcpy(card->driver, "SiS7019");
-	strcpy(card->shortname, "SiS7019");
+	strscpy(card->driver, "SiS7019");
+	strscpy(card->shortname, "SiS7019");
 	rc = sis_chip_create(card, pci);
 	if (rc)
 		return rc;
-- 
2.50.0

