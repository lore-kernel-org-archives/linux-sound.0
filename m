Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 96522321F2F
	for <linux-sound@vger.kernel.org>; Fri, 29 Aug 2025 14:44:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756478661; cv=none; b=ftCEqVVfZ99oQHNFyVen3cIAHHXdJ/IJXypH8TD1IQ853Jdu4T2byc7GZO2M9F1iM3ZUPcdEVJBoltpb1s+rdNDuYDngVO/7yUwrUIvRRJJJRyhmRygRj0n2AllKcgBYvyIvLnfuobEeB62lfyMjUXrT/LXGqWaSTZzYjuPOQuM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756478661; c=relaxed/simple;
	bh=ZbkbmyAy2ygWR3qInqbKM+nV/EJHhSSzRKdPJzIpjlU=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=ueh8R8pD0unVDAtr9t/fFvutYb9szUd7vMO+QJWGf6rwUh51CFlUxURtgdkgTwsVzUU7et7PKhqHDyconFPYig5pBiP9Ywk/yTcOSqjzKlaUiPY80Vmr1gY2FLMPz55l2mCvvWBOsndHiAOqdT/MYTUsaOdbmjWdXsUjl7gCL/w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=omwxBE6F; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=TQ8KkD/4; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=omwxBE6F; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=TQ8KkD/4; arc=none smtp.client-ip=195.135.223.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="omwxBE6F";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="TQ8KkD/4";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="omwxBE6F";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="TQ8KkD/4"
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id 25B2033EC5;
	Fri, 29 Aug 2025 14:43:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1756478634; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Xz1buKuiVryZDuZJur32blaEVilVVQzuaEs31tQK3uU=;
	b=omwxBE6FNmivUOT2392+9M3b8jKGD05YNWMv9bYEsHBXOdXuHYER4R1VXmGYGow7O/DSq5
	PvNDz0n5lNLv5c1DriZ7SfOgGRc+SRbzkGdvARld932b+npK4AYuyVAZ507EPpkrQwPpuk
	FcmPwdKWOF7L7D9WMO+4A9DIneeJHNo=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1756478634;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Xz1buKuiVryZDuZJur32blaEVilVVQzuaEs31tQK3uU=;
	b=TQ8KkD/47XsP7wIUXsn62Wjh2EW5bLi7v6cL+vlBml6qYZ0Ja/bwUxxXCbHjOLbCW/NDSR
	nKC/CqAIL3iO/4Aw==
Authentication-Results: smtp-out1.suse.de;
	dkim=pass header.d=suse.de header.s=susede2_rsa header.b=omwxBE6F;
	dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b="TQ8KkD/4"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1756478634; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Xz1buKuiVryZDuZJur32blaEVilVVQzuaEs31tQK3uU=;
	b=omwxBE6FNmivUOT2392+9M3b8jKGD05YNWMv9bYEsHBXOdXuHYER4R1VXmGYGow7O/DSq5
	PvNDz0n5lNLv5c1DriZ7SfOgGRc+SRbzkGdvARld932b+npK4AYuyVAZ507EPpkrQwPpuk
	FcmPwdKWOF7L7D9WMO+4A9DIneeJHNo=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1756478634;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Xz1buKuiVryZDuZJur32blaEVilVVQzuaEs31tQK3uU=;
	b=TQ8KkD/47XsP7wIUXsn62Wjh2EW5bLi7v6cL+vlBml6qYZ0Ja/bwUxxXCbHjOLbCW/NDSR
	nKC/CqAIL3iO/4Aw==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 0C6F113A3E;
	Fri, 29 Aug 2025 14:43:54 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id uH7MAaq8sWi6GAAAD6G6ig
	(envelope-from <tiwai@suse.de>); Fri, 29 Aug 2025 14:43:54 +0000
From: Takashi Iwai <tiwai@suse.de>
To: linux-sound@vger.kernel.org
Subject: [PATCH 09/61] ALSA: ad1889: Use guard() for spin locks
Date: Fri, 29 Aug 2025 16:42:44 +0200
Message-ID: <20250829144342.4290-10-tiwai@suse.de>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20250829144342.4290-1-tiwai@suse.de>
References: <20250829144342.4290-1-tiwai@suse.de>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Level: 
X-Spam-Flag: NO
X-Rspamd-Queue-Id: 25B2033EC5
X-Rspamd-Action: no action
X-Rspamd-Server: rspamd1.dmz-prg2.suse.org
X-Spamd-Result: default: False [-3.01 / 50.00];
	BAYES_HAM(-3.00)[100.00%];
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

Clean up the code using guard() for spin locks.

Merely code refactoring, and no behavior change.

Signed-off-by: Takashi Iwai <tiwai@suse.de>
---
 sound/pci/ad1889.c | 12 +++---------
 1 file changed, 3 insertions(+), 9 deletions(-)

diff --git a/sound/pci/ad1889.c b/sound/pci/ad1889.c
index 020cbb467e7e..f4ec404c0d15 100644
--- a/sound/pci/ad1889.c
+++ b/sound/pci/ad1889.c
@@ -353,7 +353,7 @@ snd_ad1889_playback_prepare(struct snd_pcm_substream *ss)
 		reg |= AD_DS_WSMC_WAST;
 
 	/* let's make sure we don't clobber ourselves */
-	spin_lock_irq(&chip->lock);
+	guard(spinlock_irq)(&chip->lock);
 	
 	chip->wave.size = size;
 	chip->wave.reg = reg;
@@ -372,8 +372,6 @@ snd_ad1889_playback_prepare(struct snd_pcm_substream *ss)
 	/* writes flush */
 	ad1889_readw(chip, AD_DS_WSMC);
 	
-	spin_unlock_irq(&chip->lock);
-	
 	dev_dbg(chip->card->dev,
 		"prepare playback: addr = 0x%x, count = %u, size = %u, reg = 0x%x, rate = %u\n",
 		chip->wave.addr, count, size, reg, rt->rate);
@@ -403,7 +401,7 @@ snd_ad1889_capture_prepare(struct snd_pcm_substream *ss)
 		reg |= AD_DS_RAMC_ADST;
 
 	/* let's make sure we don't clobber ourselves */
-	spin_lock_irq(&chip->lock);
+	guard(spinlock_irq)(&chip->lock);
 	
 	chip->ramc.size = size;
 	chip->ramc.reg = reg;
@@ -419,8 +417,6 @@ snd_ad1889_capture_prepare(struct snd_pcm_substream *ss)
 	/* writes flush */
 	ad1889_readw(chip, AD_DS_RAMC);
 	
-	spin_unlock_irq(&chip->lock);
-	
 	dev_dbg(chip->card->dev,
 		"prepare capture: addr = 0x%x, count = %u, size = %u, reg = 0x%x, rate = %u\n",
 		chip->ramc.addr, count, size, reg, rt->rate);
@@ -775,7 +771,7 @@ snd_ad1889_free(struct snd_card *card)
 {
 	struct snd_ad1889 *chip = card->private_data;
 
-	spin_lock_irq(&chip->lock);
+	guard(spinlock_irq)(&chip->lock);
 
 	ad1889_mute(chip);
 
@@ -785,8 +781,6 @@ snd_ad1889_free(struct snd_card *card)
 	/* clear DISR. If we don't, we'd better jump off the Eiffel Tower */
 	ad1889_writel(chip, AD_DMA_DISR, AD_DMA_DISR_PTAI | AD_DMA_DISR_PMAI);
 	ad1889_readl(chip, AD_DMA_DISR);	/* flush, dammit! */
-
-	spin_unlock_irq(&chip->lock);
 }
 
 static int
-- 
2.50.1

