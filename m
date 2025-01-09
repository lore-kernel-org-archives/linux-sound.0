Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2B8AE21D59A
	for <linux-sound@vger.kernel.org>; Thu,  9 Jan 2025 16:23:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736439805; cv=none; b=g8g/Suf9weg5igii/Js4yAtrfjGyDvlH1bzkNinTPgnjKWTuOHi3X6RAKZWDSqoubL6r4TYeO7/lZqm3vCqULDmVvAWmVvETrFAmYIlsQoUhEb6WY7lp1uKMaGpOJwm1lKcSVtsSBPvZmDU3U7E+uUhJH5lBO6Nk15KWOuGdn5M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736439805; c=relaxed/simple;
	bh=NaZ1+TqXkdUs7pzgO3MQ7S+YPu2+mJqbv8URUh8AAzQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=u1OBg30TQaQdpi4ubKKo5SCMrFJuyGItIz+E5DXjcpxypqZHFgl5mD04kR7ov4H83+wg+1mHd56s55b5dlLWHCs5x9zhU03YcBoZnIze4iJ/IcmzqRjiTNMWsqZ2MLnEhM3wR0+r7ZU7zDLb6RBKwpoMQfe/xXE2Iw5zCwnpOjo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=xSCqjxEv; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=9/d5d2KV; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=fx/3Wo5u; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=iR70nei2; arc=none smtp.client-ip=195.135.223.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="xSCqjxEv";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="9/d5d2KV";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="fx/3Wo5u";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="iR70nei2"
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id DB23721164;
	Thu,  9 Jan 2025 16:23:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1736439801; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=4o0m2489DodiGimKRUq7KvsB5pl2bndXQBBsdl67UA0=;
	b=xSCqjxEvfvpaf1hF3YXuPuLlVJeaK5eoHAlZhaCkGs3YfZzfnhTolhYhyX6MDhB5gYb/vJ
	1AekWHhNVPJ5di7/fjEcmaNVPo9TP5yAjKy9Dhz1n+bfVBCSVcZh7LHoih00Rgw6fgoELD
	oJi9hX3/KoSK2OaD7tm8eRrKPqanY80=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1736439801;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=4o0m2489DodiGimKRUq7KvsB5pl2bndXQBBsdl67UA0=;
	b=9/d5d2KVGgCrddK7akC1I5y7kKGiuiglJxcUpWFenzo8pXGDPM3fdFPfVnEAL8wFaP3Y0U
	4v6OvageEOgWCDAw==
Authentication-Results: smtp-out1.suse.de;
	dkim=pass header.d=suse.de header.s=susede2_rsa header.b="fx/3Wo5u";
	dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=iR70nei2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1736439800; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=4o0m2489DodiGimKRUq7KvsB5pl2bndXQBBsdl67UA0=;
	b=fx/3Wo5u1+hOzQ1WXUcRSOMxkYiNY+gMiSrCIzm9x2Gt+i0UYtF71Ug7k6RNN0+38eaWqq
	FItR2girKSl5mtNaZUVEUUAmvwjmnwtK60wGOEsTRCb+XVvNCFBZlIytW4Eccl2PvLZbnA
	MGlmHdHhvgYP+OKUdTrlso1Hsbbxn0U=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1736439800;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=4o0m2489DodiGimKRUq7KvsB5pl2bndXQBBsdl67UA0=;
	b=iR70nei2mLtVZJ16FnM/6gHk6tMrngbvR/3HJqh/6oQ1//P/QmJ9Vshv8roucXSalg9tad
	P2PFjXjNco3ZZPCA==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id BE4CA13A9E;
	Thu,  9 Jan 2025 16:23:20 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id yC8rLfj3f2cCBgAAD6G6ig
	(envelope-from <tiwai@suse.de>); Thu, 09 Jan 2025 16:23:20 +0000
From: Takashi Iwai <tiwai@suse.de>
To: linux-sound@vger.kernel.org
Cc: Takashi Iwai <tiwai@suse.de>
Subject: [PATCH 2/2] ALSA: rme9652: Simplify with str_yes_no()
Date: Thu,  9 Jan 2025 17:23:17 +0100
Message-ID: <20250109162318.9172-3-tiwai@suse.de>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250109162318.9172-1-tiwai@suse.de>
References: <20250109162318.9172-1-tiwai@suse.de>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Queue-Id: DB23721164
X-Spam-Level: 
X-Spamd-Result: default: False [-3.01 / 50.00];
	BAYES_HAM(-3.00)[99.99%];
	MID_CONTAINS_FROM(1.00)[];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	R_MISSING_CHARSET(0.50)[];
	R_DKIM_ALLOW(-0.20)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	MX_GOOD(-0.01)[];
	ARC_NA(0.00)[];
	RCPT_COUNT_TWO(0.00)[2];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	MIME_TRACE(0.00)[0:+];
	FUZZY_BLOCKED(0.00)[rspamd.com];
	TO_DN_SOME(0.00)[];
	RBL_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	RCVD_COUNT_TWO(0.00)[2];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	FROM_HAS_DN(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RECEIVED_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:106:10:150:64:167:received];
	FROM_EQ_ENVFROM(0.00)[];
	ASN(0.00)[asn:25478, ipnet:::/0, country:RU];
	RCVD_TLS_ALL(0.00)[];
	DKIM_TRACE(0.00)[suse.de:+];
	SPAMHAUS_XBL(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:email,suse.de:dkim,suse.de:mid]
X-Rspamd-Server: rspamd2.dmz-prg2.suse.org
X-Rspamd-Action: no action
X-Spam-Score: -3.01
X-Spam-Flag: NO

Use the standard helper for simplifying the code.
Merely cleanup, no behavior change.

Signed-off-by: Takashi Iwai <tiwai@suse.de>
---
 sound/pci/rme9652/rme9652.c | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)

diff --git a/sound/pci/rme9652/rme9652.c b/sound/pci/rme9652/rme9652.c
index d066c70ae160..5b8dd7b0a02c 100644
--- a/sound/pci/rme9652/rme9652.c
+++ b/sound/pci/rme9652/rme9652.c
@@ -1561,8 +1561,7 @@ snd_rme9652_proc_read(struct snd_info_entry *entry, struct snd_info_buffer *buff
 		    x, (unsigned long) rme9652->period_bytes);
 	snd_iprintf(buffer, "Hardware pointer (frames): %ld\n",
 		    rme9652_hw_pointer(rme9652));
-	snd_iprintf(buffer, "Passthru: %s\n",
-		    rme9652->passthru ? "yes" : "no");
+	snd_iprintf(buffer, "Passthru: %s\n", str_yes_no(rme9652->passthru));
 
 	if ((rme9652->control_register & (RME9652_Master | RME9652_wsel)) == 0) {
 		snd_iprintf(buffer, "Clock mode: autosync\n");
@@ -1685,7 +1684,7 @@ snd_rme9652_proc_read(struct snd_info_entry *entry, struct snd_info_buffer *buff
 	snd_iprintf(buffer, "\n");
 
 	snd_iprintf(buffer, "Timecode signal: %s\n",
-		    (status & RME9652_tc_valid) ? "yes" : "no");
+		    str_yes_no(status & RME9652_tc_valid));
 
 	/* thru modes */
 
-- 
2.43.0

