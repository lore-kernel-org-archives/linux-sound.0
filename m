Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E38B42D6608
	for <linux-sound@vger.kernel.org>; Thu, 10 Jul 2025 10:12:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752142358; cv=none; b=RwSdimp/zUSW0SddDlpz8h/1ZDcMSsElzxkVUD4yjcV17lL34H/P5WcBu5HoHojkUmvRdHFUQuIekJZdPIJecycnSnXZLc+mkvAMIgZkg14sawTpAE4qCaGrf/yQbWHZ+QfHy92Xi9+nRxLMlB42BDBlnSwXOKbGlvE/hZjVFF0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752142358; c=relaxed/simple;
	bh=tIvg572JPbseH98lg1ZPruXCTF/Ghahy7cCoJkR2EMQ=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=APZ5SH83HopfPHHOdDG1VpPoLwmVqs+CkcFbSG6kKVzr7f67NGzIRip63KoqgTMKSMlnGJkPq0PRA2netQk7XpCINwPMgnq7bJHOMpysIIro63Qxw9O0GamI6pOwj+CNoPW0QWRL2k6XKO4G929h1/AyPp+2AhjUMmkJ1t4f7kg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=ZWoCM9fK; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=NKh4JTvG; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=ZWoCM9fK; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=NKh4JTvG; arc=none smtp.client-ip=195.135.223.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="ZWoCM9fK";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="NKh4JTvG";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="ZWoCM9fK";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="NKh4JTvG"
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id 0AACC211B4;
	Thu, 10 Jul 2025 10:07:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1752142067; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=j/UJvCO6AMb+tEC6o+1do2YZZ26CFsUF0xElswvGWgQ=;
	b=ZWoCM9fKq2XMFNWBSJ1vsFirdYeU4YQcfkVUu94aH6rYWZVChzJ3u2Xd2vqavi55/qpjLZ
	QJlBJHkH13tCJyRu1ETry6MVGXhw03/mPRTSDRgyXc64JkxUAarLFwCsr60wBQecunPcAL
	R7TwG0qSFYw8FsbXbEA7JieCD6c9Ue4=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1752142067;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=j/UJvCO6AMb+tEC6o+1do2YZZ26CFsUF0xElswvGWgQ=;
	b=NKh4JTvGFH+2AbuzwWL10CwN3GXnAY7D4fw6CgdsKZLRyuQwIIbq6XGDtUyPCCTPZvjo21
	1y2SmzkcCVGv4GAg==
Authentication-Results: smtp-out1.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1752142067; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=j/UJvCO6AMb+tEC6o+1do2YZZ26CFsUF0xElswvGWgQ=;
	b=ZWoCM9fKq2XMFNWBSJ1vsFirdYeU4YQcfkVUu94aH6rYWZVChzJ3u2Xd2vqavi55/qpjLZ
	QJlBJHkH13tCJyRu1ETry6MVGXhw03/mPRTSDRgyXc64JkxUAarLFwCsr60wBQecunPcAL
	R7TwG0qSFYw8FsbXbEA7JieCD6c9Ue4=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1752142067;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=j/UJvCO6AMb+tEC6o+1do2YZZ26CFsUF0xElswvGWgQ=;
	b=NKh4JTvGFH+2AbuzwWL10CwN3GXnAY7D4fw6CgdsKZLRyuQwIIbq6XGDtUyPCCTPZvjo21
	1y2SmzkcCVGv4GAg==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id E59A9136DC;
	Thu, 10 Jul 2025 10:07:46 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id kAnpNvKQb2jZWQAAD6G6ig
	(envelope-from <tiwai@suse.de>); Thu, 10 Jul 2025 10:07:46 +0000
From: Takashi Iwai <tiwai@suse.de>
To: linux-sound@vger.kernel.org
Subject: [PATCH 076/103] ALSA: pcxhr: Use safer strscpy() instead of strcpy()
Date: Thu, 10 Jul 2025 12:06:58 +0200
Message-ID: <20250710100727.22653-77-tiwai@suse.de>
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
	BAYES_HAM(-3.00)[99.99%];
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
 sound/pci/pcxhr/pcxhr.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/sound/pci/pcxhr/pcxhr.c b/sound/pci/pcxhr/pcxhr.c
index 242bd7e04b3e..bfd84c50e981 100644
--- a/sound/pci/pcxhr/pcxhr.c
+++ b/sound/pci/pcxhr/pcxhr.c
@@ -1149,7 +1149,7 @@ int pcxhr_create_pcm(struct snd_pcxhr *chip)
 
 	pcm->info_flags = 0;
 	pcm->nonatomic = true;
-	strcpy(pcm->name, name);
+	strscpy(pcm->name, name);
 
 	snd_pcm_set_managed_buffer_all(pcm, SNDRV_DMA_TYPE_DEV,
 				       &chip->mgr->pci->dev,
@@ -1605,7 +1605,7 @@ static int pcxhr_probe(struct pci_dev *pci,
 			return err;
 		}
 
-		strcpy(card->driver, DRIVER_NAME);
+		strscpy(card->driver, DRIVER_NAME);
 		snprintf(card->shortname, sizeof(card->shortname),
 			 "Digigram [PCM #%d]", i);
 		snprintf(card->longname, sizeof(card->longname),
-- 
2.50.0

