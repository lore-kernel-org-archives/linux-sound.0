Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6A4072D5A12
	for <linux-sound@vger.kernel.org>; Thu, 10 Jul 2025 10:09:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752142180; cv=none; b=cl9mRoWlPRJcOPSQdzGZ+qIkQtfxiTwdPewFYO4M7afVYnwognO0RcXGKrJIHoKdZ4JVQxHDHL5bWMqmoVp7tfLju6AWM9S2258NJ8zyeu7DvS/o4GZis2EpN6GXPVlmgoy7ltuJD2PHLXAXxLJcMIVOhnht6+d++kIIC9q/ZmI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752142180; c=relaxed/simple;
	bh=Mkn+3pncYO1nkafIF+p2MtXgefEQwij/dDOy7PrZDXM=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=A6Dsz+J4lLRTRkPpgTgYMWGH1Qp2CUIQNO8QSD6b8U5b2xGRK3vDgMBejPIjh2enfW4bvIN3I3WEXb3M1gFaz8F8NMZTi7TSG/PQWNSLYjW6r9F6IQk1p9V1zoR3UdKS8HjZmoEtjl70xf4VoQvkj8wi2tYXKlmu1tGLVAAdxkA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=hCxNfPvu; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=gsgmQ8Fy; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=hCxNfPvu; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=gsgmQ8Fy; arc=none smtp.client-ip=195.135.223.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="hCxNfPvu";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="gsgmQ8Fy";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="hCxNfPvu";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="gsgmQ8Fy"
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id B056121191;
	Thu, 10 Jul 2025 10:07:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1752142060; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=nI7lNUpUNZT+Nb4uW4crKPJj14U+Dn5h57pcY2/a2TE=;
	b=hCxNfPvuMbc6HEyhwbwwcQbG/qAwX+hi9SXE9Wx5Yu5dhD49f93iDJDCni5sjidknsc5uh
	eJp5ni04tBDH6jQMC3lPUlLHwK4Zy7xAymmwiAc9p/btzQPZ6zPEkuxbw8/fzWVaB0lMW0
	pMCTAurWQZQb5p1k8dH+7JF3PQg8Qds=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1752142060;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=nI7lNUpUNZT+Nb4uW4crKPJj14U+Dn5h57pcY2/a2TE=;
	b=gsgmQ8FycJmKZEuh6kWoU09lB7rWsn5z8yeJH/E3Y+ugxL1RgjTdCgwBf4kDPiffReeNU/
	5UpZlN9OKRG2pnCQ==
Authentication-Results: smtp-out1.suse.de;
	dkim=pass header.d=suse.de header.s=susede2_rsa header.b=hCxNfPvu;
	dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=gsgmQ8Fy
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1752142060; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=nI7lNUpUNZT+Nb4uW4crKPJj14U+Dn5h57pcY2/a2TE=;
	b=hCxNfPvuMbc6HEyhwbwwcQbG/qAwX+hi9SXE9Wx5Yu5dhD49f93iDJDCni5sjidknsc5uh
	eJp5ni04tBDH6jQMC3lPUlLHwK4Zy7xAymmwiAc9p/btzQPZ6zPEkuxbw8/fzWVaB0lMW0
	pMCTAurWQZQb5p1k8dH+7JF3PQg8Qds=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1752142060;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=nI7lNUpUNZT+Nb4uW4crKPJj14U+Dn5h57pcY2/a2TE=;
	b=gsgmQ8FycJmKZEuh6kWoU09lB7rWsn5z8yeJH/E3Y+ugxL1RgjTdCgwBf4kDPiffReeNU/
	5UpZlN9OKRG2pnCQ==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 8C34913A70;
	Thu, 10 Jul 2025 10:07:40 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id aOOxIOyQb2jZWQAAD6G6ig
	(envelope-from <tiwai@suse.de>); Thu, 10 Jul 2025 10:07:40 +0000
From: Takashi Iwai <tiwai@suse.de>
To: linux-sound@vger.kernel.org
Subject: [PATCH 029/103] ALSA: es18xx: Use safer strscpy() instead of strcpy()
Date: Thu, 10 Jul 2025 12:06:11 +0200
Message-ID: <20250710100727.22653-30-tiwai@suse.de>
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
X-Rspamd-Queue-Id: B056121191
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[imap1.dmz-prg2.suse.org:rdns,imap1.dmz-prg2.suse.org:helo,suse.de:dkim,suse.de:mid,suse.de:email];
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
 sound/isa/es18xx.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/sound/isa/es18xx.c b/sound/isa/es18xx.c
index e35c727a52fa..3e89a84c6244 100644
--- a/sound/isa/es18xx.c
+++ b/sound/isa/es18xx.c
@@ -1771,7 +1771,7 @@ static int snd_es18xx_mixer(struct snd_card *card)
 	int err;
 	unsigned int idx;
 
-	strcpy(card->mixername, chip->pcm->name);
+	strscpy(card->mixername, chip->pcm->name);
 
 	for (idx = 0; idx < ARRAY_SIZE(snd_es18xx_base_controls); idx++) {
 		struct snd_kcontrol *kctl;
-- 
2.50.0

