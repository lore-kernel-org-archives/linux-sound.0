Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 29F832D5438
	for <linux-sound@vger.kernel.org>; Thu, 10 Jul 2025 10:08:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752142081; cv=none; b=nZD6y+6PYMQYnPZorZ0NF5yEZTT2VSZTwcbA4xO76SW+Y/fLTgYDrz/w2B1cnEk2m6RSOeOpFgEz/0d+DDg2Xoa5m8PWLDTE92Rgf4M3lH87dbfUjsr9uVUP9LeKUjd+dRxNvILnSnn+hfhZy+3wCGLk6XcDt3DXwS5Xgm+PAvc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752142081; c=relaxed/simple;
	bh=l6Cj3uZNgruWFnpFGiGLOy6T/BBFhkGqC6EeO/sdn4A=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=iPTznKbY6403WC1xewDLaGscpUF6+g9LwaLj8KBJTBe8nTCez9vh/yTcMtWB8kLn9H0srssa7JPGYStArxyi9VCatvOxWY10iNnCjwwVCQipyYmmA/aPoyud5H0xchkpqWOtSdk7Iyh57yvFItDLsoar88Y+kVSkql5DS04pzmU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=j1mHgfPf; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=mF2C0ntI; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=j1mHgfPf; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=mF2C0ntI; arc=none smtp.client-ip=195.135.223.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="j1mHgfPf";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="mF2C0ntI";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="j1mHgfPf";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="mF2C0ntI"
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id 4DA352117A;
	Thu, 10 Jul 2025 10:07:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1752142057; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=NbKyRNF8+qIo+KLiy4zsW40eTTknCIQljpZCh63e+dk=;
	b=j1mHgfPft41D3Fe46Ls2IgvlSOS8U+MkGOR7JJ+LTQN5CrdCYJ88Uh1YTLsPz8hm5Rhhxr
	2Z9suW7lKnHpV4cFoKNtAOH/Xz4fwGzGAEZLFNPklI79CF/q9l/DwB9Dn+l9qvbnIMqdjY
	SfD+XQ3FtoPOoHGf32ecPlrCFY0FCSI=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1752142057;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=NbKyRNF8+qIo+KLiy4zsW40eTTknCIQljpZCh63e+dk=;
	b=mF2C0ntIdsqyBYU1bt+fnUu/5dDOFHA1tmJUrBsr5CJQ07ERS0iPwSnIxGNx5t067cbwb2
	wat0SvZSZYVI+6DQ==
Authentication-Results: smtp-out1.suse.de;
	dkim=pass header.d=suse.de header.s=susede2_rsa header.b=j1mHgfPf;
	dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=mF2C0ntI
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1752142057; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=NbKyRNF8+qIo+KLiy4zsW40eTTknCIQljpZCh63e+dk=;
	b=j1mHgfPft41D3Fe46Ls2IgvlSOS8U+MkGOR7JJ+LTQN5CrdCYJ88Uh1YTLsPz8hm5Rhhxr
	2Z9suW7lKnHpV4cFoKNtAOH/Xz4fwGzGAEZLFNPklI79CF/q9l/DwB9Dn+l9qvbnIMqdjY
	SfD+XQ3FtoPOoHGf32ecPlrCFY0FCSI=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1752142057;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=NbKyRNF8+qIo+KLiy4zsW40eTTknCIQljpZCh63e+dk=;
	b=mF2C0ntIdsqyBYU1bt+fnUu/5dDOFHA1tmJUrBsr5CJQ07ERS0iPwSnIxGNx5t067cbwb2
	wat0SvZSZYVI+6DQ==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 28DCA136DC;
	Thu, 10 Jul 2025 10:07:37 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id mP7TCOmQb2jZWQAAD6G6ig
	(envelope-from <tiwai@suse.de>); Thu, 10 Jul 2025 10:07:37 +0000
From: Takashi Iwai <tiwai@suse.de>
To: linux-sound@vger.kernel.org
Subject: [PATCH 004/103] ALSA: mpu401: Use safer strscpy() instead of strcpy()
Date: Thu, 10 Jul 2025 12:05:46 +0200
Message-ID: <20250710100727.22653-5-tiwai@suse.de>
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
X-Rspamd-Queue-Id: 4DA352117A
X-Rspamd-Action: no action
X-Rspamd-Server: rspamd1.dmz-prg2.suse.org
X-Spamd-Result: default: False [-3.01 / 50.00];
	BAYES_HAM(-3.00)[99.99%];
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
 sound/drivers/mpu401/mpu401.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/sound/drivers/mpu401/mpu401.c b/sound/drivers/mpu401/mpu401.c
index cd01af5fa4ed..d3f9424088d4 100644
--- a/sound/drivers/mpu401/mpu401.c
+++ b/sound/drivers/mpu401/mpu401.c
@@ -63,8 +63,8 @@ static int snd_mpu401_create(struct device *devptr, int dev,
 				0, &card);
 	if (err < 0)
 		return err;
-	strcpy(card->driver, "MPU-401 UART");
-	strcpy(card->shortname, card->driver);
+	strscpy(card->driver, "MPU-401 UART");
+	strscpy(card->shortname, card->driver);
 	sprintf(card->longname, "%s at %#lx, ", card->shortname, port[dev]);
 	if (irq[dev] >= 0) {
 		sprintf(card->longname + strlen(card->longname), "irq %d", irq[dev]);
-- 
2.50.0

