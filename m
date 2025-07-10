Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 84EF92D5C89
	for <linux-sound@vger.kernel.org>; Thu, 10 Jul 2025 10:10:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752142248; cv=none; b=uf6ZLcbff3LQb12qAl1L8WXq4dChLhVxb+ckLFgSUiWoFhUtioCaqFEJXqlzH7q4Tcaj6clkxtoioq2AwR7wfwiZ7R8JCvuvx2Qaz9CpRIFMIIt9sGFEiO+rOZwIlfsoOIuNw5C+wM2p2oN5bV7gtkdFm8nfJwb7dyErhOQC1lA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752142248; c=relaxed/simple;
	bh=hoB5vot+v3VHr0y/JUp/2hXklqpsizQq7q/iQtEQZCs=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=dsUl1eIUSITxiVUrVpxsLSFTTLB9gaC9swhD4WzCMoGSMbqv/v7fzvwl7/33aIfEGp5yk4JVq9exR/KOJ3KSEVLRR07t/ps7j+o8Diiow6Wke6ub8NybdsqTSH1PbhldTjmAsldEptZ27mVb6dzGY4YyMA9oBoIhH+d1JXuoZ+Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=ozlGm3YF; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=oJjlT/tr; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=ozlGm3YF; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=oJjlT/tr; arc=none smtp.client-ip=195.135.223.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="ozlGm3YF";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="oJjlT/tr";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="ozlGm3YF";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="oJjlT/tr"
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id 9CA012119C;
	Thu, 10 Jul 2025 10:07:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1752142062; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=XtTcBIOrYkyzDHduRw8K8OZHgFNWLSWShTKZ+/S+cIY=;
	b=ozlGm3YF8V6xRcdGRYofghjHE5HyDEBmWEsTz/kfGO6iAh2I1PhUsLiZiqBHGv7HhIGTFL
	DRZ6Us5Mn5iuItEzOLHWKPx2jFw44XFuyPSNumPmFp8y+DCdGd/1IhWSfHkbLXJvI6Vr8X
	Gg370yp+LsX5JjN6cf7IRoAFbZIeKJg=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1752142062;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=XtTcBIOrYkyzDHduRw8K8OZHgFNWLSWShTKZ+/S+cIY=;
	b=oJjlT/tr7nkPeiK1z6eY8U1FqSqaaNSu/txiA+auq9b/mP3RAMCdqSPxNpcsrHf2P5PHiQ
	ShiRzf7ky7xFPVCQ==
Authentication-Results: smtp-out1.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1752142062; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=XtTcBIOrYkyzDHduRw8K8OZHgFNWLSWShTKZ+/S+cIY=;
	b=ozlGm3YF8V6xRcdGRYofghjHE5HyDEBmWEsTz/kfGO6iAh2I1PhUsLiZiqBHGv7HhIGTFL
	DRZ6Us5Mn5iuItEzOLHWKPx2jFw44XFuyPSNumPmFp8y+DCdGd/1IhWSfHkbLXJvI6Vr8X
	Gg370yp+LsX5JjN6cf7IRoAFbZIeKJg=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1752142062;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=XtTcBIOrYkyzDHduRw8K8OZHgFNWLSWShTKZ+/S+cIY=;
	b=oJjlT/tr7nkPeiK1z6eY8U1FqSqaaNSu/txiA+auq9b/mP3RAMCdqSPxNpcsrHf2P5PHiQ
	ShiRzf7ky7xFPVCQ==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 83474136DC;
	Thu, 10 Jul 2025 10:07:42 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id MA/UHu6Qb2jZWQAAD6G6ig
	(envelope-from <tiwai@suse.de>); Thu, 10 Jul 2025 10:07:42 +0000
From: Takashi Iwai <tiwai@suse.de>
To: linux-sound@vger.kernel.org
Subject: [PATCH 044/103] ALSA: ali5451: Use safer strscpy() instead of strcpy()
Date: Thu, 10 Jul 2025 12:06:26 +0200
Message-ID: <20250710100727.22653-45-tiwai@suse.de>
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
 sound/pci/ali5451/ali5451.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/sound/pci/ali5451/ali5451.c b/sound/pci/ali5451/ali5451.c
index 69c02bdd38ce..a6e499e0ceda 100644
--- a/sound/pci/ali5451/ali5451.c
+++ b/sound/pci/ali5451/ali5451.c
@@ -1645,7 +1645,7 @@ static int snd_ali_pcm(struct snd_ali *codec, int device,
 	pcm->info_flags = 0;
 	pcm->dev_class = desc->class;
 	pcm->dev_subclass = SNDRV_PCM_SUBCLASS_GENERIC_MIX;
-	strcpy(pcm->name, desc->name);
+	strscpy(pcm->name, desc->name);
 	codec->pcm[0] = pcm;
 	return 0;
 }
@@ -2133,8 +2133,8 @@ static int __snd_ali_probe(struct pci_dev *pci,
 
 	snd_ali_proc_init(codec);
 
-	strcpy(card->driver, "ALI5451");
-	strcpy(card->shortname, "ALI 5451");
+	strscpy(card->driver, "ALI5451");
+	strscpy(card->shortname, "ALI 5451");
 	
 	sprintf(card->longname, "%s at 0x%lx, irq %i",
 		card->shortname, codec->port, codec->irq);
-- 
2.50.0

