Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C080A2D63E9
	for <linux-sound@vger.kernel.org>; Thu, 10 Jul 2025 10:11:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752142284; cv=none; b=kxCcQZOmgWt13rbZiCgD3+U/AaHjCjlJ6PGXwLYesAtLatrswg9fovOo4LckNqrJQjWGNH5ZhTc3UxsbGu1aeWWw4BL+eGwdUADVQW/i4x7YDCeB1xeKyScl4YF7OjC6er5WufjRAw5HASm4SsNSLUQWIDF6VmpXSJrL2lmf8Qk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752142284; c=relaxed/simple;
	bh=/+4qltmv/63pJsrUjOeeFRIrjLUNTrUoRchKnvPLVHQ=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=SrXQLQqm+Gf6KdggalXCx4PadyoYCYzdSuKZzFNq+kVI3JoRwbVms8IkMObwbZprPRZc/9Aw/lU4a9dhS00elKM55sX5di+5K5Y2lvh3v2gAJAjUkzB1JIDfuRASpKlUNcaUFCBEgVSmh9itYzSCcKxMvauAssTxYUkJGuKhvmA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=Tbr4yOw3; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=x9AhWCQo; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=Tbr4yOw3; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=x9AhWCQo; arc=none smtp.client-ip=195.135.223.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="Tbr4yOw3";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="x9AhWCQo";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="Tbr4yOw3";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="x9AhWCQo"
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id A6E37211A3;
	Thu, 10 Jul 2025 10:07:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1752142063; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=xf4JbdO/yKBRLaPVCTwD1bKuxUT0oqJqD9XXX6OjkoQ=;
	b=Tbr4yOw3ifVCy9uq7AqwZIlg4PBXFIdvoZ3hzaooSB7PgwHybxNjU6vOil9UIf/WQzVEPR
	joL0M52Mqg7saVPEU1IHZa6hbL56NmEy9QEVgKQT2lZxJCmPqleRmMZFbC507sA465zg5y
	JNTl8Jh4nUvM2Z+m6u/+D7QMSVNZiNQ=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1752142063;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=xf4JbdO/yKBRLaPVCTwD1bKuxUT0oqJqD9XXX6OjkoQ=;
	b=x9AhWCQoeeo3NVq32/y45nH8qZNsTNn2HwJZGbcMahVU4r4b2wD56XwhUsiK6xHpcGYgV0
	MKWVao9wto0X+3Dw==
Authentication-Results: smtp-out1.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1752142063; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=xf4JbdO/yKBRLaPVCTwD1bKuxUT0oqJqD9XXX6OjkoQ=;
	b=Tbr4yOw3ifVCy9uq7AqwZIlg4PBXFIdvoZ3hzaooSB7PgwHybxNjU6vOil9UIf/WQzVEPR
	joL0M52Mqg7saVPEU1IHZa6hbL56NmEy9QEVgKQT2lZxJCmPqleRmMZFbC507sA465zg5y
	JNTl8Jh4nUvM2Z+m6u/+D7QMSVNZiNQ=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1752142063;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=xf4JbdO/yKBRLaPVCTwD1bKuxUT0oqJqD9XXX6OjkoQ=;
	b=x9AhWCQoeeo3NVq32/y45nH8qZNsTNn2HwJZGbcMahVU4r4b2wD56XwhUsiK6xHpcGYgV0
	MKWVao9wto0X+3Dw==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 8B3C7136DC;
	Thu, 10 Jul 2025 10:07:43 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id oKqyIO+Qb2jZWQAAD6G6ig
	(envelope-from <tiwai@suse.de>); Thu, 10 Jul 2025 10:07:43 +0000
From: Takashi Iwai <tiwai@suse.de>
To: linux-sound@vger.kernel.org
Subject: [PATCH 052/103] ALSA: bt87x: Use safer strscpy() instead of strcpy()
Date: Thu, 10 Jul 2025 12:06:34 +0200
Message-ID: <20250710100727.22653-53-tiwai@suse.de>
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:mid,suse.de:email,imap1.dmz-prg2.suse.org:helo];
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
 sound/pci/bt87x.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/sound/pci/bt87x.c b/sound/pci/bt87x.c
index 91492dd2b38a..b70f6f4ffe67 100644
--- a/sound/pci/bt87x.c
+++ b/sound/pci/bt87x.c
@@ -672,7 +672,7 @@ static int snd_bt87x_pcm(struct snd_bt87x *chip, int device, char *name)
 	if (err < 0)
 		return err;
 	pcm->private_data = chip;
-	strcpy(pcm->name, name);
+	strscpy(pcm->name, name);
 	snd_pcm_set_ops(pcm, SNDRV_PCM_STREAM_CAPTURE, &snd_bt87x_pcm_ops);
 	snd_pcm_set_managed_buffer_all(pcm, SNDRV_DMA_TYPE_DEV_SG,
 				       &chip->pci->dev,
@@ -872,12 +872,12 @@ static int __snd_bt87x_probe(struct pci_dev *pci,
 		   chip->board.no_analog ? "no " : "",
 		   chip->board.no_digital ? "no " : "", chip->board.dig_rate);
 
-	strcpy(card->driver, "Bt87x");
+	strscpy(card->driver, "Bt87x");
 	sprintf(card->shortname, "Brooktree Bt%x", pci->device);
 	sprintf(card->longname, "%s at %#llx, irq %i",
 		card->shortname, (unsigned long long)pci_resource_start(pci, 0),
 		chip->irq);
-	strcpy(card->mixername, "Bt87x");
+	strscpy(card->mixername, "Bt87x");
 
 	err = snd_card_register(card);
 	if (err < 0)
-- 
2.50.0

