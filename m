Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 45D8818FDAE
	for <linux-sound@vger.kernel.org>; Mon, 17 Jun 2024 10:05:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718618707; cv=none; b=RxU09NhUsm51c5OhNYlmomnBFmm6sAqXpAEMm/EuIuW7HHoXp5FyXztplu+YAldun7gCvRnteHZCur7azLd9SXtYd4EO5iM6Mr6YPUHCbRojnmgFSj5RkvHgFGJIXnQ8KM2F2NGA4H5Kg1zshc0pG+iTESY7iIF/TJxETpqjKhY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718618707; c=relaxed/simple;
	bh=25Iuf5SCWi2roC2jKlT6qLg2k1w/hOk/X4xbN1Yd+Ek=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=jZjiFGJRCZVB3AcOyYtLDhY18tg6YJXqCzboSznJncIEJ4TNAtN/B6enHamSOoKJhfpFjSDKFnIcOp8qGb1jWO5HtzDUjXDn6m3cr/+DxU+ag5waDeMYs+jENgv4m1t/j7X5RREEV+JHntJ02RemzjK9bhbvlGlbg1DmkEKfrg4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=r19x+qZm; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=tkw2hPf4; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=r19x+qZm; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=tkw2hPf4; arc=none smtp.client-ip=195.135.223.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="r19x+qZm";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="tkw2hPf4";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="r19x+qZm";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="tkw2hPf4"
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id 9C98537FCD;
	Mon, 17 Jun 2024 10:05:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1718618704; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=ATFjaMa14uwYey0BBiN1F4g6bXEYhtMLwkCf9tpMg4Q=;
	b=r19x+qZmUIlb5OeByKp89WvD2JfCVvRc6ZHHGwXSWkWDr3PPWGsFVvhY/UyH4ZapObYsh2
	6E7/H7o6mIcPiFml8nc9ixiALNMEhlcN4SodaS9/8OR+A3GSk0jcychYF4nBYUpPVklMx3
	Aozng/9j5mB9n3dOb78IK/plLm1rVgU=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1718618704;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=ATFjaMa14uwYey0BBiN1F4g6bXEYhtMLwkCf9tpMg4Q=;
	b=tkw2hPf4uQfFQolrsZxM06AJej1ETMWnTnrK0jxIGhoPNJ/oGjk/cvHLyD5AOz4kODaNdt
	nHPfwvttbqjcuFCg==
Authentication-Results: smtp-out1.suse.de;
	dkim=pass header.d=suse.de header.s=susede2_rsa header.b=r19x+qZm;
	dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=tkw2hPf4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1718618704; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=ATFjaMa14uwYey0BBiN1F4g6bXEYhtMLwkCf9tpMg4Q=;
	b=r19x+qZmUIlb5OeByKp89WvD2JfCVvRc6ZHHGwXSWkWDr3PPWGsFVvhY/UyH4ZapObYsh2
	6E7/H7o6mIcPiFml8nc9ixiALNMEhlcN4SodaS9/8OR+A3GSk0jcychYF4nBYUpPVklMx3
	Aozng/9j5mB9n3dOb78IK/plLm1rVgU=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1718618704;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=ATFjaMa14uwYey0BBiN1F4g6bXEYhtMLwkCf9tpMg4Q=;
	b=tkw2hPf4uQfFQolrsZxM06AJej1ETMWnTnrK0jxIGhoPNJ/oGjk/cvHLyD5AOz4kODaNdt
	nHPfwvttbqjcuFCg==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 7B5A913AC0;
	Mon, 17 Jun 2024 10:05:04 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id GIrhHFAKcGYfAgAAD6G6ig
	(envelope-from <tiwai@suse.de>); Mon, 17 Jun 2024 10:05:04 +0000
From: Takashi Iwai <tiwai@suse.de>
To: linux-sound@vger.kernel.org
Subject: [PATCH 2/5] ALSA: sb: Drop NULL check for snd_ctl_remove()
Date: Mon, 17 Jun 2024 12:05:24 +0200
Message-ID: <20240617100529.6667-3-tiwai@suse.de>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240617100529.6667-1-tiwai@suse.de>
References: <20240617100529.6667-1-tiwai@suse.de>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Queue-Id: 9C98537FCD
X-Spam-Score: -3.01
X-Spam-Level: 
X-Spam-Flag: NO
X-Spamd-Result: default: False [-3.01 / 50.00];
	BAYES_HAM(-3.00)[100.00%];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	R_DKIM_ALLOW(-0.20)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	MX_GOOD(-0.01)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FROM_EQ_ENVFROM(0.00)[];
	TO_DN_NONE(0.00)[];
	ARC_NA(0.00)[];
	FROM_HAS_DN(0.00)[];
	RCPT_COUNT_ONE(0.00)[1];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	FUZZY_BLOCKED(0.00)[rspamd.com];
	RCVD_TLS_ALL(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	URIBL_BLOCKED(0.00)[imap1.dmz-prg2.suse.org:helo,imap1.dmz-prg2.suse.org:rdns,suse.de:email,suse.de:dkim];
	DBL_BLOCKED_OPENRESOLVER(0.00)[imap1.dmz-prg2.suse.org:helo,imap1.dmz-prg2.suse.org:rdns];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	DNSWL_BLOCKED(0.00)[2a07:de40:b281:106:10:150:64:167:received,2a07:de40:b281:104:10:150:64:97:from];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[suse.de:+]
X-Rspamd-Action: no action
X-Rspamd-Server: rspamd1.dmz-prg2.suse.org

Since snd_ctl_remove() accepts the NULL kcontrol argument now, we can
drop the check in the caller side.

Signed-off-by: Takashi Iwai <tiwai@suse.de>
---
 sound/isa/sb/emu8000.c  |  6 ++----
 sound/isa/sb/sb16_csp.c | 12 ++++--------
 2 files changed, 6 insertions(+), 12 deletions(-)

diff --git a/sound/isa/sb/emu8000.c b/sound/isa/sb/emu8000.c
index a6405772d537..af478c36ce5b 100644
--- a/sound/isa/sb/emu8000.c
+++ b/sound/isa/sb/emu8000.c
@@ -1039,10 +1039,8 @@ snd_emu8000_create_mixer(struct snd_card *card, struct snd_emu8000 *emu)
 	return 0;
 
 __error:
-	for (i = 0; i < EMU8000_NUM_CONTROLS; i++) {
-		if (emu->controls[i])
-			snd_ctl_remove(card, emu->controls[i]);
-	}
+	for (i = 0; i < EMU8000_NUM_CONTROLS; i++)
+		snd_ctl_remove(card, emu->controls[i]);
 	return err;
 }
 
diff --git a/sound/isa/sb/sb16_csp.c b/sound/isa/sb/sb16_csp.c
index 8d8357019719..fdb992733bde 100644
--- a/sound/isa/sb/sb16_csp.c
+++ b/sound/isa/sb/sb16_csp.c
@@ -1080,14 +1080,10 @@ static void snd_sb_qsound_destroy(struct snd_sb_csp * p)
 
 	card = p->chip->card;	
 	
-	if (p->qsound_switch) {
-		snd_ctl_remove(card, p->qsound_switch);
-		p->qsound_switch = NULL;
-	}
-	if (p->qsound_space) {
-		snd_ctl_remove(card, p->qsound_space);
-		p->qsound_space = NULL;
-	}
+	snd_ctl_remove(card, p->qsound_switch);
+	p->qsound_switch = NULL;
+	snd_ctl_remove(card, p->qsound_space);
+	p->qsound_space = NULL;
 
 	/* cancel pending transfer of QSound parameters */
 	spin_lock_irqsave (&p->q_lock, flags);
-- 
2.43.0

