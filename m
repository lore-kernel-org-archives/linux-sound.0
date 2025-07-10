Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1A0AD2D5A12
	for <linux-sound@vger.kernel.org>; Thu, 10 Jul 2025 10:09:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752142187; cv=none; b=J/YkcI7YY2+ArC79ywAyYigOCGQG5JhzsNE5akqEKVLMM8z8FcGBDuljkgu3r1eAmxIZooU4Rn25fzcb3hFgmwWo8FwNu67D6h+uFeTxNSStD3ZTQL2JeQF8fW1163uUFF5xnYIEsPl95tPv1i+uK5MvcUkibMa0n7IOB7yML1w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752142187; c=relaxed/simple;
	bh=sx0uaa5WCnyVZdJJ4Hu79xo7GEXLYeWKyVOg0Hzl2gM=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=EYlkrHGtu+VhE355zYjeQ/Ek3gWovdXorzqA4jZzs7sITDev1qlbf84HTiSlKLUBWZnAd6MpSY3noKHRHjddwLyVkOICZv/KPjO0KlqTRpM7vNClNyBDtyhVk5pQzuOJ/TPQ+0/WdkSKEvIH697C37Mbx7pFSXbs8GB5vYVXq/E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=nZsmn4H+; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=psMl84tf; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=nZsmn4H+; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=psMl84tf; arc=none smtp.client-ip=195.135.223.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="nZsmn4H+";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="psMl84tf";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="nZsmn4H+";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="psMl84tf"
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id D079C21192;
	Thu, 10 Jul 2025 10:07:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1752142060; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=E5+7MUIseFWcw/VRVpaluQLqkcnnv45uzIl9gBwYg0k=;
	b=nZsmn4H+ungvJEkyrb0zBsWXm9HeOb/NLuHUzvm2YTYNM9hOOOJrqngXra4evDfoiVHyi+
	QmG4jIJizOXEIljZrzim8oes61+vpPwQcXH+1yccIe24TnFDKcoIWGJJlFmX634WTm2tX9
	zcOp8GZ+K43TJ7aVW0mjfvH7dmOg3w8=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1752142060;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=E5+7MUIseFWcw/VRVpaluQLqkcnnv45uzIl9gBwYg0k=;
	b=psMl84tfANJPDA4xcCkakeAWOdamHgZgn8jmBHuMm3Jo3SyctSxJOqvjoUwp1TjsDLmBS6
	KbUTypfA07xQvDBg==
Authentication-Results: smtp-out1.suse.de;
	dkim=pass header.d=suse.de header.s=susede2_rsa header.b=nZsmn4H+;
	dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=psMl84tf
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1752142060; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=E5+7MUIseFWcw/VRVpaluQLqkcnnv45uzIl9gBwYg0k=;
	b=nZsmn4H+ungvJEkyrb0zBsWXm9HeOb/NLuHUzvm2YTYNM9hOOOJrqngXra4evDfoiVHyi+
	QmG4jIJizOXEIljZrzim8oes61+vpPwQcXH+1yccIe24TnFDKcoIWGJJlFmX634WTm2tX9
	zcOp8GZ+K43TJ7aVW0mjfvH7dmOg3w8=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1752142060;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=E5+7MUIseFWcw/VRVpaluQLqkcnnv45uzIl9gBwYg0k=;
	b=psMl84tfANJPDA4xcCkakeAWOdamHgZgn8jmBHuMm3Jo3SyctSxJOqvjoUwp1TjsDLmBS6
	KbUTypfA07xQvDBg==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id B6D80136DC;
	Thu, 10 Jul 2025 10:07:40 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id QLRxK+yQb2jZWQAAD6G6ig
	(envelope-from <tiwai@suse.de>); Thu, 10 Jul 2025 10:07:40 +0000
From: Takashi Iwai <tiwai@suse.de>
To: linux-sound@vger.kernel.org
Subject: [PATCH 030/103] ALSA: galaxy: Use safer strscpy() instead of strcpy()
Date: Thu, 10 Jul 2025 12:06:12 +0200
Message-ID: <20250710100727.22653-31-tiwai@suse.de>
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
X-Rspamd-Queue-Id: D079C21192
X-Rspamd-Server: rspamd2.dmz-prg2.suse.org
X-Rspamd-Action: no action
X-Spam-Score: -3.01

Use a safer function strscpy() instead of strcpy() for copying to
arrays.

Only idiomatic code replacement, and no functional changes.

Signed-off-by: Takashi Iwai <tiwai@suse.de>
---
 sound/isa/galaxy/galaxy.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/sound/isa/galaxy/galaxy.c b/sound/isa/galaxy/galaxy.c
index 3164eb8510fa..b0f1562d0fc0 100644
--- a/sound/isa/galaxy/galaxy.c
+++ b/sound/isa/galaxy/galaxy.c
@@ -542,8 +542,8 @@ static int __snd_galaxy_probe(struct device *dev, unsigned int n)
 		return err;
 	}
 
-	strcpy(card->driver, DRV_NAME);
-	strcpy(card->shortname, DRV_NAME);
+	strscpy(card->driver, DRV_NAME);
+	strscpy(card->shortname, DRV_NAME);
 	sprintf(card->longname, "%s at %#lx/%#lx, irq %d, dma %d/%d",
 		card->shortname, port[n], wss_port[n], irq[n], dma1[n],
 		dma2[n]);
-- 
2.50.0

