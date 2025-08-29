Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9164D31CA76
	for <linux-sound@vger.kernel.org>; Fri, 29 Aug 2025 14:53:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756479233; cv=none; b=N8Yt3o1hm+Af9G7al1U6wkWCcKC8vt4g5gK+xLcYTeBZdyIKds/43sxAx8qmxKc1HvWU+UIT0W4n7POfqGNaTxIvyBDQUdMWPdKRpK9u3leUswtFyMHZlBmNe6aICLHT/f6dlkvG35kZ/q3xS2hacA4oAoQg+QvMkkY3PuA/uvQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756479233; c=relaxed/simple;
	bh=imNyeI+4//IunLDyENNweD0u/vd+ob8qWEu8GDmW+Cw=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=kMlPzGRYN0jk/XLHcKPtQnLYOvv1kDrn0oRSGrIgW6MMm5lUhbHSi0z6gpxBwei3AMupa0yZQksh8ZPbZt5W7y/TzxHtMwYKzidymFdH2+vCmAV91pP8PJBPPdesWHRPudUM5jvX6+47h28uznzSWwW6PNBYpGKX/ZGI7RLbcgk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=kc1HoO6T; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=okpsAlak; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=kc1HoO6T; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=okpsAlak; arc=none smtp.client-ip=195.135.223.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="kc1HoO6T";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="okpsAlak";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="kc1HoO6T";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="okpsAlak"
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id 4A791225AE;
	Fri, 29 Aug 2025 14:53:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1756479192; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=nt1i4U9urbulvmpPJKnlyMfMKROrA1gdxSJ2bmtsDCk=;
	b=kc1HoO6TXmo4EHu1glIvI3+FgQjHj56D0IB8Agj9+3177ZmCBCRIiWf7RtLRy6gpLamPG3
	zeCLAtvWUgh1XnSf+3+piHIXN7FIG2gSkXeuV2TJ3bkD01+uzen2j6nbuB7FwtbWSMpnWZ
	YLTxWzieoyreu3vib2DuUBC9PiAPVb0=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1756479192;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=nt1i4U9urbulvmpPJKnlyMfMKROrA1gdxSJ2bmtsDCk=;
	b=okpsAlakuxFB9vhQEw8nEq7eh/aI0rtApX1d9Zh4F8zOYt5A+4G6Sdr4h+NDk4WoV6D5LN
	0wOhfoxcQ7/WwwAA==
Authentication-Results: smtp-out1.suse.de;
	dkim=pass header.d=suse.de header.s=susede2_rsa header.b=kc1HoO6T;
	dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=okpsAlak
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1756479192; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=nt1i4U9urbulvmpPJKnlyMfMKROrA1gdxSJ2bmtsDCk=;
	b=kc1HoO6TXmo4EHu1glIvI3+FgQjHj56D0IB8Agj9+3177ZmCBCRIiWf7RtLRy6gpLamPG3
	zeCLAtvWUgh1XnSf+3+piHIXN7FIG2gSkXeuV2TJ3bkD01+uzen2j6nbuB7FwtbWSMpnWZ
	YLTxWzieoyreu3vib2DuUBC9PiAPVb0=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1756479192;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=nt1i4U9urbulvmpPJKnlyMfMKROrA1gdxSJ2bmtsDCk=;
	b=okpsAlakuxFB9vhQEw8nEq7eh/aI0rtApX1d9Zh4F8zOYt5A+4G6Sdr4h+NDk4WoV6D5LN
	0wOhfoxcQ7/WwwAA==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 2F51513326;
	Fri, 29 Aug 2025 14:53:12 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id +HZeCti+sWhzGwAAD6G6ig
	(envelope-from <tiwai@suse.de>); Fri, 29 Aug 2025 14:53:12 +0000
From: Takashi Iwai <tiwai@suse.de>
To: linux-sound@vger.kernel.org
Subject: [PATCH 12/18] ALSA: sb: Use guard() for mutex locks
Date: Fri, 29 Aug 2025 16:52:52 +0200
Message-ID: <20250829145300.5460-13-tiwai@suse.de>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20250829145300.5460-1-tiwai@suse.de>
References: <20250829145300.5460-1-tiwai@suse.de>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Level: 
X-Spam-Flag: NO
X-Rspamd-Queue-Id: 4A791225AE
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
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FUZZY_RATELIMITED(0.00)[rspamd.com];
	ARC_NA(0.00)[];
	FROM_HAS_DN(0.00)[];
	RCPT_COUNT_ONE(0.00)[1];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	FROM_EQ_ENVFROM(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:dkim,suse.de:mid,suse.de:email,imap1.dmz-prg2.suse.org:rdns,imap1.dmz-prg2.suse.org:helo];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	DNSWL_BLOCKED(0.00)[2a07:de40:b281:104:10:150:64:97:from,2a07:de40:b281:106:10:150:64:167:received];
	RCVD_COUNT_TWO(0.00)[2];
	RCVD_TLS_ALL(0.00)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[suse.de:+]
X-Spam-Score: -3.01

Replace the manual mutex lock/unlock pairs with guard() for code
simplification.

Only code refactoring, and no behavior change.

Signed-off-by: Takashi Iwai <tiwai@suse.de>
---
 sound/isa/sb/sb16_csp.c | 12 +++---------
 1 file changed, 3 insertions(+), 9 deletions(-)

diff --git a/sound/isa/sb/sb16_csp.c b/sound/isa/sb/sb16_csp.c
index 7034072c80d4..7c5072e4a96f 100644
--- a/sound/isa/sb/sb16_csp.c
+++ b/sound/isa/sb/sb16_csp.c
@@ -265,14 +265,10 @@ static int snd_sb_csp_release(struct snd_hwdep * hw, struct file *file)
  */
 static int snd_sb_csp_use(struct snd_sb_csp * p)
 {
-	mutex_lock(&p->access_mutex);
-	if (p->used) {
-		mutex_unlock(&p->access_mutex);
+	guard(mutex)(&p->access_mutex);
+	if (p->used)
 		return -EAGAIN;
-	}
 	p->used++;
-	mutex_unlock(&p->access_mutex);
-
 	return 0;
 
 }
@@ -282,10 +278,8 @@ static int snd_sb_csp_use(struct snd_sb_csp * p)
  */
 static int snd_sb_csp_unuse(struct snd_sb_csp * p)
 {
-	mutex_lock(&p->access_mutex);
+	guard(mutex)(&p->access_mutex);
 	p->used--;
-	mutex_unlock(&p->access_mutex);
-
 	return 0;
 }
 
-- 
2.50.1

