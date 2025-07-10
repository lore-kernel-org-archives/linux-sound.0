Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BDAC02D63F0
	for <linux-sound@vger.kernel.org>; Thu, 10 Jul 2025 10:11:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752142290; cv=none; b=UKVWLrJxconbMI3+riXVt24xk/GCt4Y7oGfYYiC14YQIXwtAetmQEoph/tcZ5BcxF874z6ZKyTwPEP7+Ti6SNEC6eA2qkfVEJLPuAr+XAZGSm6KazEK34VUTTxWEBUZLV67adz0W/cABiAUTjbzJyPIwMnzpWPI2god+t7eWxmU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752142290; c=relaxed/simple;
	bh=BC9zAq5/0WL8yy+f0A+4W/f26pB0hNVEQyflkdt0QII=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=VHT/g8FOqG/WyzWq/mCQ01qPqATlaW8NpMg2C0yK2uQzpWcK6NRzb1kx5aZJw8ohdUS7fDnHCaHIJyMN4DbrouNSgZ5nPAEJFxwNtF3kPpKGtRDPGZcnXjRuvZ/vp2sFsE0CV4WQrCKc0ON6D44xnHXUfxEE4Dsq/AdMA/W9zYw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=hKMiaX7+; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=GiXYDEe7; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=hKMiaX7+; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=GiXYDEe7; arc=none smtp.client-ip=195.135.223.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="hKMiaX7+";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="GiXYDEe7";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="hKMiaX7+";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="GiXYDEe7"
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id 522E2211A5;
	Thu, 10 Jul 2025 10:07:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1752142064; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=mry35DoqtVAsg+TiUSo9MN8GFycyOevLR1TthkGmrlE=;
	b=hKMiaX7+f9lPwNSRxsWm77qcpQ18FcXsvDbI/7za/gL/Q8wv2mryzuHzWn7BcLotMOKeWp
	t2zzvuNvW89KEQWBWNbM/J/hUpm2Am+VFWgmt18I8FodpYYeI6aq8JM+od6p3T3VQphW8N
	FzhjZ8MVcPjyGHgh8Jog60xQlSuEyyY=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1752142064;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=mry35DoqtVAsg+TiUSo9MN8GFycyOevLR1TthkGmrlE=;
	b=GiXYDEe7Ju0LVVa/rU3IMotPRO5Fj0GBL7eA4vn7/hdiCVS8erouPwSbAcMPx4pZScAgeg
	wkChaMu5TfHHjVDw==
Authentication-Results: smtp-out1.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1752142064; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=mry35DoqtVAsg+TiUSo9MN8GFycyOevLR1TthkGmrlE=;
	b=hKMiaX7+f9lPwNSRxsWm77qcpQ18FcXsvDbI/7za/gL/Q8wv2mryzuHzWn7BcLotMOKeWp
	t2zzvuNvW89KEQWBWNbM/J/hUpm2Am+VFWgmt18I8FodpYYeI6aq8JM+od6p3T3VQphW8N
	FzhjZ8MVcPjyGHgh8Jog60xQlSuEyyY=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1752142064;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=mry35DoqtVAsg+TiUSo9MN8GFycyOevLR1TthkGmrlE=;
	b=GiXYDEe7Ju0LVVa/rU3IMotPRO5Fj0GBL7eA4vn7/hdiCVS8erouPwSbAcMPx4pZScAgeg
	wkChaMu5TfHHjVDw==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 3866113AAB;
	Thu, 10 Jul 2025 10:07:44 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id EHyPDPCQb2jZWQAAD6G6ig
	(envelope-from <tiwai@suse.de>); Thu, 10 Jul 2025 10:07:44 +0000
From: Takashi Iwai <tiwai@suse.de>
To: linux-sound@vger.kernel.org
Subject: [PATCH 057/103] ALSA: cs5530: Use safer strscpy() instead of strcpy()
Date: Thu, 10 Jul 2025 12:06:39 +0200
Message-ID: <20250710100727.22653-58-tiwai@suse.de>
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
 sound/pci/cs5530.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/sound/pci/cs5530.c b/sound/pci/cs5530.c
index 532891e67c34..292b65aa758a 100644
--- a/sound/pci/cs5530.c
+++ b/sound/pci/cs5530.c
@@ -207,8 +207,8 @@ static int snd_cs5530_probe(struct pci_dev *pci,
 	if (err < 0)
 		return err;
 
-	strcpy(card->driver, "CS5530");
-	strcpy(card->shortname, "CS5530 Audio");
+	strscpy(card->driver, "CS5530");
+	strscpy(card->shortname, "CS5530 Audio");
 	sprintf(card->longname, "%s at 0x%lx", card->shortname, chip->pci_base);
 
 	err = snd_card_register(card);
-- 
2.50.0

