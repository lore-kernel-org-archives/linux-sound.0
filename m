Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C39EA2D5C89
	for <linux-sound@vger.kernel.org>; Thu, 10 Jul 2025 10:10:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752142254; cv=none; b=Lhes2eetDC8auniJwaCbIhFT2GZWU9PoyTE1L/pu8Agq+ThdnXnl6x7Nzf99y0p3voq5cMrsk9kWKh0G+Kkn8/EUTyJtEzwABMsLPaPQz81R4fV2ZuuKveJywEy5yMEPeq6QecLVuy18dZvpPeT06N/R4dWtXR4bQcerlTLrE5Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752142254; c=relaxed/simple;
	bh=hQtYcTq/j9J9fU43hSdvTNI9GDB9/UzBQoWI3l52CeQ=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=oLF4Q23b/lUk4W0/6ZG4FVHg0BsWWCNLOSHsbjUUqNEpXJDjitimhuD0xlgEPLGlQHWe+FghDPrVqbrHqUZTIvs+1z55d9hRGWH5laLbKStW7VYa/5mks4QJOtbLWnYihxGJfSkIS0iNOM9X1S+pGAUKxpq+1jFUV6cFdZq81Lo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=jAIMRRGh; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=L77QL25r; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=jAIMRRGh; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=L77QL25r; arc=none smtp.client-ip=195.135.223.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="jAIMRRGh";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="L77QL25r";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="jAIMRRGh";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="L77QL25r"
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id BA64C2119D;
	Thu, 10 Jul 2025 10:07:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1752142062; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=cxmlaLhPAm49qG9MojIVZOxszpUWU21ILiKm6OhW73g=;
	b=jAIMRRGhXo4BWk0ervfGI8njj2xJTzTELHVKFv+7wJLoJI+37U1r5yBfR8OMTIHohxPBQa
	1TJVlyq2pvR/4NCiN8JNMgeTDe4HvI8GTjv/UtFVF5mCn6A7In49XvyzHVAWE0PN1ee8Mt
	2WYeInyfWQjkOnXSXlo3j5Lcq+6YUqE=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1752142062;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=cxmlaLhPAm49qG9MojIVZOxszpUWU21ILiKm6OhW73g=;
	b=L77QL25r7061fO1cqMx/TLYbm//mBotTPGZmtR/RPgpy8RusX33qcbRKIUdtraJHHHegHx
	MJolWiulwGd9NGCg==
Authentication-Results: smtp-out1.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1752142062; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=cxmlaLhPAm49qG9MojIVZOxszpUWU21ILiKm6OhW73g=;
	b=jAIMRRGhXo4BWk0ervfGI8njj2xJTzTELHVKFv+7wJLoJI+37U1r5yBfR8OMTIHohxPBQa
	1TJVlyq2pvR/4NCiN8JNMgeTDe4HvI8GTjv/UtFVF5mCn6A7In49XvyzHVAWE0PN1ee8Mt
	2WYeInyfWQjkOnXSXlo3j5Lcq+6YUqE=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1752142062;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=cxmlaLhPAm49qG9MojIVZOxszpUWU21ILiKm6OhW73g=;
	b=L77QL25r7061fO1cqMx/TLYbm//mBotTPGZmtR/RPgpy8RusX33qcbRKIUdtraJHHHegHx
	MJolWiulwGd9NGCg==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id A192E13A70;
	Thu, 10 Jul 2025 10:07:42 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id WJw/Ju6Qb2jZWQAAD6G6ig
	(envelope-from <tiwai@suse.de>); Thu, 10 Jul 2025 10:07:42 +0000
From: Takashi Iwai <tiwai@suse.de>
To: linux-sound@vger.kernel.org
Subject: [PATCH 045/103] ALSA: als300: Use safer strscpy() instead of strcpy()
Date: Thu, 10 Jul 2025 12:06:27 +0200
Message-ID: <20250710100727.22653-46-tiwai@suse.de>
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
 sound/pci/als300.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/sound/pci/als300.c b/sound/pci/als300.c
index 43f98719e61b..f9e8424dc77f 100644
--- a/sound/pci/als300.c
+++ b/sound/pci/als300.c
@@ -546,7 +546,7 @@ static int snd_als300_new_pcm(struct snd_als300 *chip)
 	if (err < 0)
 		return err;
 	pcm->private_data = chip;
-	strcpy(pcm->name, "ALS300");
+	strscpy(pcm->name, "ALS300");
 	chip->pcm = pcm;
 
 	/* set operators */
@@ -705,7 +705,7 @@ static int snd_als300_probe(struct pci_dev *pci,
 	if (err < 0)
 		goto error;
 
-	strcpy(card->driver, "ALS300");
+	strscpy(card->driver, "ALS300");
 	if (chip->chip_type == DEVICE_ALS300_PLUS)
 		/* don't know much about ALS300+ yet
 		 * print revision number for now */
-- 
2.50.0

