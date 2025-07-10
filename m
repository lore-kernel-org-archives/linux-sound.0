Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D16B92D5C77
	for <linux-sound@vger.kernel.org>; Thu, 10 Jul 2025 10:10:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752142212; cv=none; b=vFAHSFpKDK5pka2yPAX2JslGJEOwRHknELjmkuI8djUqh6l1VEL6E2UoLrU+tspa4Hqw/jezgmxemxqhUbf+fmjTHBIPdNJj+MtJ1QP3K6Ew7EqQJynN3plOjMweN27VYivGVav1sXrjL2T4MhDEEjQbntDT4a23FH2CCs6QJvg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752142212; c=relaxed/simple;
	bh=FL5hDE5o8gJHwBoKqvrbHn/nQntEWBWe8z9G3cC25N0=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=aaWiSSLjmo1ekXcy4zo5Z71iimoB1HiUSRpq4Cyn3gpD3+6J4wIx2Ka21NfDoZcSBCqFcaTbTGVCxCdsz8CHyIsC6C8GN+YrFN4cJtJDQJiz3XoXqlTdtMNZG6AP9LUM/Efquw19pUHButxAZhD1QPAtdO4iNVxOTvu02FgyRnY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=ObjLzJL9; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=cS7k3Qgb; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=ObjLzJL9; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=cS7k3Qgb; arc=none smtp.client-ip=195.135.223.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="ObjLzJL9";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="cS7k3Qgb";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="ObjLzJL9";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="cS7k3Qgb"
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id 5B8B81F74A;
	Thu, 10 Jul 2025 10:07:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1752142065; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=JJuy6CgRYnOPC2B0PJ0P5DCXs9oLcH+GtUt151/8FwM=;
	b=ObjLzJL92YKeVJgiX5j/bHD7bSr0+oQcwEyK0iSWTUaQ1tOzNE/laph50YFN9+CpB7hIBC
	pmfNMvjVdAKYFNoJby2DwEowjFUAba8z+epxFxYANWv+fUtc6t374TebPjSndDX6Gb28ja
	+hU8kRxYDbG6stl+RdSwXYH344lyOwo=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1752142065;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=JJuy6CgRYnOPC2B0PJ0P5DCXs9oLcH+GtUt151/8FwM=;
	b=cS7k3QgbgXybWLpunTJhQx4yr80lkz5BxajUkT/BsjMQnShRxTNaDy+Fl7oUJhCWN7ZjX8
	a98gPLAhwd9B1gCg==
Authentication-Results: smtp-out2.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1752142065; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=JJuy6CgRYnOPC2B0PJ0P5DCXs9oLcH+GtUt151/8FwM=;
	b=ObjLzJL92YKeVJgiX5j/bHD7bSr0+oQcwEyK0iSWTUaQ1tOzNE/laph50YFN9+CpB7hIBC
	pmfNMvjVdAKYFNoJby2DwEowjFUAba8z+epxFxYANWv+fUtc6t374TebPjSndDX6Gb28ja
	+hU8kRxYDbG6stl+RdSwXYH344lyOwo=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1752142065;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=JJuy6CgRYnOPC2B0PJ0P5DCXs9oLcH+GtUt151/8FwM=;
	b=cS7k3QgbgXybWLpunTJhQx4yr80lkz5BxajUkT/BsjMQnShRxTNaDy+Fl7oUJhCWN7ZjX8
	a98gPLAhwd9B1gCg==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 3D29F136DC;
	Thu, 10 Jul 2025 10:07:45 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id qOSrDfGQb2jZWQAAD6G6ig
	(envelope-from <tiwai@suse.de>); Thu, 10 Jul 2025 10:07:45 +0000
From: Takashi Iwai <tiwai@suse.de>
To: linux-sound@vger.kernel.org
Subject: [PATCH 064/103] ALSA: es1968: Use safer strscpy() instead of strcpy()
Date: Thu, 10 Jul 2025 12:06:46 +0200
Message-ID: <20250710100727.22653-65-tiwai@suse.de>
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:email,suse.de:mid,imap1.dmz-prg2.suse.org:helo];
	FROM_EQ_ENVFROM(0.00)[];
	FROM_HAS_DN(0.00)[];
	R_RATELIMIT(0.00)[to_ip_from(RLsqo7dymd5dgmoaprf5rep8is)];
	RCVD_COUNT_TWO(0.00)[2];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	TO_DN_NONE(0.00)[];
	RCVD_TLS_ALL(0.00)[]
X-Spam-Flag: NO
X-Spam-Score: -2.80

Use a safer function strscpy() instead of strcpy() for copying to
arrays.

Only idiomatic code replacement, and no functional changes.

Signed-off-by: Takashi Iwai <tiwai@suse.de>
---
 sound/pci/es1968.c | 14 +++++++-------
 1 file changed, 7 insertions(+), 7 deletions(-)

diff --git a/sound/pci/es1968.c b/sound/pci/es1968.c
index 37bac890613e..624ba7d47566 100644
--- a/sound/pci/es1968.c
+++ b/sound/pci/es1968.c
@@ -1812,7 +1812,7 @@ snd_es1968_pcm(struct es1968 *chip, int device)
 
 	pcm->info_flags = 0;
 
-	strcpy(pcm->name, "ESS Maestro");
+	strscpy(pcm->name, "ESS Maestro");
 
 	chip->pcm = pcm;
 
@@ -2761,16 +2761,16 @@ static int __snd_es1968_probe(struct pci_dev *pci,
 
 	switch (chip->type) {
 	case TYPE_MAESTRO2E:
-		strcpy(card->driver, "ES1978");
-		strcpy(card->shortname, "ESS ES1978 (Maestro 2E)");
+		strscpy(card->driver, "ES1978");
+		strscpy(card->shortname, "ESS ES1978 (Maestro 2E)");
 		break;
 	case TYPE_MAESTRO2:
-		strcpy(card->driver, "ES1968");
-		strcpy(card->shortname, "ESS ES1968 (Maestro 2)");
+		strscpy(card->driver, "ES1968");
+		strscpy(card->shortname, "ESS ES1968 (Maestro 2)");
 		break;
 	case TYPE_MAESTRO:
-		strcpy(card->driver, "ESM1");
-		strcpy(card->shortname, "ESS Maestro 1");
+		strscpy(card->driver, "ESM1");
+		strscpy(card->shortname, "ESS Maestro 1");
 		break;
 	}
 
-- 
2.50.0

